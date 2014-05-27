#include "JetMETCorrections/METPUSubtraction/plugins/NoPileUpPFMEtProducer.h"

#include "FWCore/Utilities/interface/Exception.h"

#include "DataFormats/METReco/interface/PFMET.h"
#include "DataFormats/METReco/interface/PFMETFwd.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"
#include "DataFormats/Candidate/interface/Candidate.h"
#include "DataFormats/METReco/interface/SigInputObj.h"

#include "JetMETCorrections/METPUSubtraction/interface/noPileUpMEtUtilities.h"
#include "DataFormats/METReco/interface/PFMEtSignCovMatrix.h"
#include "RecoMET/METAlgorithms/interface/significanceAlgo.h"

#include <math.h>

using namespace noPileUpMEtUtilities;

const double defaultPFMEtResolutionX = 10.;
const double defaultPFMEtResolutionY = 10.;

const double epsilon = 1.e-9;

NoPileUpPFMEtProducer::NoPileUpPFMEtProducer(const edm::ParameterSet& cfg)
  : moduleLabel_(cfg.getParameter<std::string>("@module_label"))
{
  srcMEt_ = cfg.getParameter<edm::InputTag>("srcMEt");
  srcMEtCov_ = ( cfg.exists("srcMEtCov") ) ?
    cfg.getParameter<edm::InputTag>("srcMEtCov") : edm::InputTag();
  srcJetInfo_ = cfg.getParameter<edm::InputTag>("srcMVAMEtData");
  srcJetInfoLeptonMatch_ = cfg.getParameter<edm::InputTag>("srcMVAMEtDataLeptonMatch");
  srcPFCandInfo_ = cfg.getParameter<edm::InputTag>("srcMVAMEtData");
  srcPFCandInfoLeptonMatch_ = cfg.getParameter<edm::InputTag>("srcMVAMEtDataLeptonMatch");
  srcLeptons_ = cfg.getParameter<vInputTag>("srcLeptons");
  srcType0Correction_ = cfg.getParameter<edm::InputTag>("srcType0Correction");

  sfNoPUjets_ = cfg.getParameter<double>("sfNoPUjets");
  sfNoPUjetOffsetEnCorr_ = cfg.getParameter<double>("sfNoPUjetOffsetEnCorr");
  sfPUjets_ = cfg.getParameter<double>("sfPUjets");
  sfNoPUunclChargedCands_ = cfg.getParameter<double>("sfNoPUunclChargedCands");
  sfPUunclChargedCands_ = cfg.getParameter<double>("sfPUunclChargedCands");
  sfUnclNeutralCands_ = cfg.getParameter<double>("sfUnclNeutralCands");
  sfType0Correction_ = cfg.getParameter<double>("sfType0Correction");

  pfMEtSignInterface_ = new PFMEtSignInterfaceBase(cfg.getParameter<edm::ParameterSet>("resolution"));
  sfMEtCovMin_ = cfg.getParameter<double>("sfMEtCovMin");
  sfMEtCovMax_ = cfg.getParameter<double>("sfMEtCovMax");

  saveInputs_ = ( cfg.exists("saveInputs") ) ?
    cfg.getParameter<bool>("saveInputs") : false;

  verbosity_ = ( cfg.exists("verbosity") ) ?
    cfg.getParameter<int>("verbosity") : 0;
  
  produces<reco::PFMETCollection>();
  if ( saveInputs_ ) {
    produces<CommonMETData>("sumLeptons");
    produces<CommonMETData>("sumNoPUjetOffsetEnCorr");
    produces<CommonMETData>("sumNoPUjets");
    produces<CommonMETData>("sumPUjets");
    produces<CommonMETData>("sumNoPUunclChargedCands");
    produces<CommonMETData>("sumPUunclChargedCands");
    produces<CommonMETData>("sumUnclNeutralCands");
    produces<CommonMETData>("type0Correction");
  }
  produces<double>("sfNoPU");
}

NoPileUpPFMEtProducer::~NoPileUpPFMEtProducer() 
{ 
  delete pfMEtSignInterface_;
}

void initializeCommonMETData(CommonMETData& metData)
{
  metData.met   = 0.;
  metData.mex   = 0.;
  metData.mey   = 0.;
  metData.mez   = 0.;
  metData.sumet = 0.;
  metData.phi   = 0.;
}

void addToCommonMETData(CommonMETData& metData, const reco::Candidate::LorentzVector& p4)
{
  metData.mex   += p4.px();
  metData.mey   += p4.py();
  metData.mez   += p4.pz();
  metData.sumet += p4.pt();
}

void finalizeCommonMETData(CommonMETData& metData)
{
  metData.met = TMath::Sqrt(metData.mex*metData.mex + metData.mey*metData.mey);
  metData.phi = TMath::ATan2(metData.mey, metData.mex);
}

void scaleAndAddPFMEtSignObjects(std::vector<metsig::SigInputObj>& metSignObjects_scaled, const std::vector<metsig::SigInputObj>& metSignObjects, 
				 double sf, double sfMin, double sfMax)
{
  double sf_value = sf;
  if ( sf_value > sfMax ) sf = sfMax;
  if ( sf_value < sfMin ) sf = sfMin;
  for ( std::vector<metsig::SigInputObj>::const_iterator metSignObject = metSignObjects.begin();
	metSignObject != metSignObjects.end(); ++metSignObject ) {
    metsig::SigInputObj metSignObject_scaled;
    metSignObject_scaled.set(
      metSignObject->get_type(), 
      sf_value*metSignObject->get_energy(), 
      metSignObject->get_phi(),
      sf_value*metSignObject->get_sigma_e(), 
      metSignObject->get_sigma_tan());
    metSignObjects_scaled.push_back(metSignObject_scaled);
  }
}

namespace
{
  double determinant(const TMatrixD& pfMEtCov)
  {
    assert(pfMEtCov.GetNrows() == 2);
    assert(pfMEtCov.GetNcols() == 2);
    return (pfMEtCov(0,0)*pfMEtCov(1,1) - pfMEtCov(0,1)*pfMEtCov(1,0));
  }
}

TMatrixD computePFMEtSignificance(const std::vector<metsig::SigInputObj>& metSignObjects)
{
  TMatrixD pfMEtCov(2,2);
  if ( metSignObjects.size() >= 2 ) {
    metsig::significanceAlgo pfMEtSignAlgorithm;
    pfMEtSignAlgorithm.addObjects(metSignObjects);
    pfMEtCov = pfMEtSignAlgorithm.getSignifMatrix();
  } 
  
  if ( TMath::Abs(determinant(pfMEtCov)) < epsilon ) {
    edm::LogWarning("computePFMEtSignificance") 
      << "Inversion of PFMEt covariance matrix failed, det = " << determinant(pfMEtCov)
      << " --> replacing covariance matrix by resolution defaults !!";    
    pfMEtCov(0,0) = defaultPFMEtResolutionX*defaultPFMEtResolutionX;
    pfMEtCov(0,1) = 0.;
    pfMEtCov(1,0) = 0.;
    pfMEtCov(1,1) = defaultPFMEtResolutionY*defaultPFMEtResolutionY;
  }

  return pfMEtCov;
}

void printP4(const std::string& label_part1, int idx, const std::string& label_part2, const reco::Candidate& candidate)
{
  std::cout << label_part1 << " #" << idx << label_part2 << ": Pt = " << candidate.pt() << ", eta = " << candidate.eta() << ", phi = " << candidate.phi() 
	    << " (charge = " << candidate.charge() << ")" << std::endl;
}

void printCommonMETData(const std::string& label, const CommonMETData& metData)
{
  std::cout << label << ": Px = " << metData.mex << ", Py = " << metData.mey << ", sumEt = " << metData.sumet << std::endl;
}

void printMVAMEtJetInfo(const std::string& label, int idx, const reco::MVAMEtJetInfo& jet)
{
  std::cout << label << " #" << idx << " (";
  if      ( jet.type_ == reco::MVAMEtJetInfo::kNoPileUp ) std::cout << "no-PU";
  else if ( jet.type_ == reco::MVAMEtJetInfo::kPileUp   ) std::cout << "PU";
  std::cout << "): Pt = " << jet.p4_.pt() << ", eta = " << jet.p4_.eta() << ", phi = " << jet.p4_.phi();
  std::cout << " id. flags: anti-noise = " << jet.passesLooseJetId_ << std::endl;
  std::cout << std::endl;
}

void printMVAMEtPFCandInfo(const std::string& label, int idx, const reco::MVAMEtPFCandInfo& pfCand)
{
  std::cout << label << " #" << idx << " (";
  if      ( pfCand.type_ == reco::MVAMEtPFCandInfo::kNoPileUpCharged ) std::cout << "no-PU charged";
  else if ( pfCand.type_ == reco::MVAMEtPFCandInfo::kPileUpCharged   ) std::cout << "PU charged";
  else if ( pfCand.type_ == reco::MVAMEtPFCandInfo::kNeutral         ) std::cout << "neutral";
  std::cout << "): Pt = " << pfCand.p4_.pt() << ", eta = " << pfCand.p4_.eta() << ", phi = " << pfCand.p4_.phi();
  std::string isWithinJet_string;
  if ( pfCand.isWithinJet_ ) isWithinJet_string = "true";
  else isWithinJet_string = "false";
  std::cout << " (isWithinJet = " << isWithinJet_string << ")";
  if ( pfCand.isWithinJet_ ) std::cout << " Jet id. flags: anti-noise = " << pfCand.passesLooseJetId_ << std::endl;
  std::cout << std::endl;
}

void NoPileUpPFMEtProducer::produce(edm::Event& evt, const edm::EventSetup& es)
{
  if ( verbosity_ ) {
    std::cout << "<NoPileUpPFMEtProducer::produce>:" << std::endl;
    std::cout << " moduleLabel = " << moduleLabel_ << std::endl;
  }

  // get original MET
  edm::Handle<reco::PFMETCollection> pfMETs;
  evt.getByLabel(srcMEt_, pfMETs);
  if ( !(pfMETs->size() == 1) )
    throw cms::Exception("NoPileUpPFMEtProducer::produce") 
      << "Failed to find unique MET object !!\n";
  const reco::PFMET& pfMEt_original = pfMETs->front();
  
  // get MET covariance matrix
  TMatrixD pfMEtCov(2,2);
  if ( srcMEtCov_.label() != "" ) {
    edm::Handle<PFMEtSignCovMatrix> pfMEtCovHandle;    
    evt.getByLabel(srcMEtCov_, pfMEtCovHandle);
    pfMEtCov = (*pfMEtCovHandle);
  } else {
    pfMEtCov = pfMEt_original.getSignificanceMatrix();
  }
  
  // get lepton momenta
  std::vector<reco::Candidate::LorentzVector> leptons;
  std::vector<metsig::SigInputObj> metSignObjectsLeptons;
  reco::Candidate::LorentzVector sumLeptonP4s;
  for ( vInputTag::const_iterator srcLeptons_i = srcLeptons_.begin();
	srcLeptons_i != srcLeptons_.end(); ++srcLeptons_i ) {
    typedef edm::View<reco::Candidate> CandidateView;
    edm::Handle<CandidateView> leptons_i;
    evt.getByLabel(*srcLeptons_i, leptons_i);
    int leptonIdx = 0;
    for ( CandidateView::const_iterator lepton = leptons_i->begin();
	  lepton != leptons_i->end(); ++lepton ) {
      if ( verbosity_ ) printP4(srcLeptons_i->label(), leptonIdx, "", *lepton);
      leptons.push_back(lepton->p4());
      metSignObjectsLeptons.push_back(pfMEtSignInterface_->compResolution(&(*lepton)));
      sumLeptonP4s += lepton->p4();
      ++leptonIdx;
    }
  }
  if ( verbosity_ ) {
    std::cout << " sum(leptons): Pt = " << sumLeptonP4s.pt() << ", eta = " << sumLeptonP4s.eta() << ", phi = " << sumLeptonP4s.phi() << ","
	      << " mass = " << sumLeptonP4s.mass() << std::endl;
  }

  // get jet and PFCandidate information
  edm::Handle<reco::MVAMEtJetInfoCollection> jets;
  evt.getByLabel(srcJetInfo_, jets);
  edm::Handle<reco::MVAMEtJetInfoCollection> jetsLeptonMatch;
  evt.getByLabel(srcJetInfoLeptonMatch_, jetsLeptonMatch);
  edm::Handle<reco::MVAMEtPFCandInfoCollection> pfCandidates;
  evt.getByLabel(srcPFCandInfo_, pfCandidates);
  edm::Handle<reco::MVAMEtPFCandInfoCollection> pfCandidatesLeptonMatch;
  evt.getByLabel(srcPFCandInfoLeptonMatch_, pfCandidatesLeptonMatch);

  reco::MVAMEtJetInfoCollection jets_leptons = cleanJets(*jetsLeptonMatch, leptons, 0.5, true);
  reco::MVAMEtPFCandInfoCollection pfCandidates_leptons = cleanPFCandidates(*pfCandidatesLeptonMatch, leptons, 0.3, true);
  std::auto_ptr<CommonMETData> sumLeptons(new CommonMETData());
  initializeCommonMETData(*sumLeptons);
  for ( reco::MVAMEtJetInfoCollection::const_iterator jet = jets_leptons.begin();
	jet != jets_leptons.end(); ++jet ) {
    sumLeptons->mex   += jet->p4_.px();
    sumLeptons->mey   += jet->p4_.py();
    sumLeptons->sumet += jet->p4_.pt();
  }
  for ( reco::MVAMEtPFCandInfoCollection::const_iterator pfCandidate = pfCandidates_leptons.begin();
	pfCandidate != pfCandidates_leptons.end(); ++pfCandidate ) {
    bool isWithinJet_lepton = true; 
    if ( pfCandidate->isWithinJet_ ) {
      for ( reco::MVAMEtJetInfoCollection::const_iterator jet = jets_leptons.begin();
	    jet != jets_leptons.end(); ++jet ) {
	double dR = deltaR(pfCandidate->p4_, jet->p4_);
	if ( dR < 0.5 ) isWithinJet_lepton = true; 
      }
    }
    if ( !isWithinJet_lepton ) {
      sumLeptons->mex   += pfCandidate->p4_.px();
      sumLeptons->mey   += pfCandidate->p4_.py();
      sumLeptons->sumet += pfCandidate->p4_.pt();
    }
  }
  
  reco::MVAMEtJetInfoCollection jets_cleaned = cleanJets(*jets, leptons, 0.5, false);
  reco::MVAMEtPFCandInfoCollection pfCandidates_cleaned = cleanPFCandidates(*pfCandidates, leptons, 0.3, false);

  std::auto_ptr<CommonMETData> sumNoPUjets(new CommonMETData());
  initializeCommonMETData(*sumNoPUjets);
  std::vector<metsig::SigInputObj> metSignObjectsNoPUjets;
  std::auto_ptr<CommonMETData> sumNoPUjetOffsetEnCorr(new CommonMETData());
  initializeCommonMETData(*sumNoPUjetOffsetEnCorr);
  std::vector<metsig::SigInputObj> metSignObjectsNoPUjetOffsetEnCorr;
  std::auto_ptr<CommonMETData> sumPUjets(new CommonMETData());
  initializeCommonMETData(*sumPUjets);
  std::vector<metsig::SigInputObj> metSignObjectsPUjets;
  int jetIdx = 0;
  for ( reco::MVAMEtJetInfoCollection::const_iterator jet = jets_cleaned.begin();
	jet != jets_cleaned.end(); ++jet ) {
    if ( verbosity_ ) printMVAMEtJetInfo("jet", jetIdx, *jet);
    if ( jet->passesLooseJetId_ ) {
      if ( jet->type_ == reco::MVAMEtJetInfo::kNoPileUp ) {	
	addToCommonMETData(*sumNoPUjets, jet->p4_);
	metSignObjectsNoPUjets.push_back(jet->pfMEtSignObj_);
	sumNoPUjetOffsetEnCorr->mex   += jet->offsetEnCorr_*TMath::Cos(jet->p4_.phi())*TMath::Sin(jet->p4_.theta());
	sumNoPUjetOffsetEnCorr->mey   += jet->offsetEnCorr_*TMath::Sin(jet->p4_.phi())*TMath::Sin(jet->p4_.theta());
	sumNoPUjetOffsetEnCorr->mez   += jet->offsetEnCorr_*TMath::Cos(jet->p4_.theta());
	sumNoPUjetOffsetEnCorr->sumet += jet->offsetEnCorr_*TMath::Sin(jet->p4_.theta());
	metsig::SigInputObj pfMEtSignObjectOffsetEnCorr(
    	  jet->pfMEtSignObj_.get_type(),
	  jet->offsetEnCorr_,
	  jet->pfMEtSignObj_.get_phi(),
	  (jet->offsetEnCorr_/jet->p4_.E())*jet->pfMEtSignObj_.get_sigma_e(),
	  jet->pfMEtSignObj_.get_sigma_tan());
	metSignObjectsNoPUjetOffsetEnCorr.push_back(pfMEtSignObjectOffsetEnCorr);
      } else {
	addToCommonMETData(*sumPUjets, jet->p4_);
	metSignObjectsPUjets.push_back(jet->pfMEtSignObj_);
      }
    }
    ++jetIdx;
  }
    
  std::auto_ptr<CommonMETData> sumNoPUunclChargedCands(new CommonMETData());
  initializeCommonMETData(*sumNoPUunclChargedCands);
  std::vector<metsig::SigInputObj> metSignObjectsNoPUunclChargedCands;
  std::auto_ptr<CommonMETData> sumPUunclChargedCands(new CommonMETData());
  initializeCommonMETData(*sumPUunclChargedCands);
  std::vector<metsig::SigInputObj> metSignObjectsPUunclChargedCands;
  std::auto_ptr<CommonMETData> sumUnclNeutralCands(new CommonMETData());
  initializeCommonMETData(*sumUnclNeutralCands);
  std::vector<metsig::SigInputObj> metSignObjectsUnclNeutralCands;
  int pfCandIdx = 0;
  for ( reco::MVAMEtPFCandInfoCollection::const_iterator pfCandidate = pfCandidates_cleaned.begin();
	pfCandidate != pfCandidates_cleaned.end(); ++pfCandidate ) {
    if ( verbosity_ && pfCandidate->p4_.pt() > 2. ) printMVAMEtPFCandInfo("pfCand", pfCandIdx, *pfCandidate);
    if ( pfCandidate->passesLooseJetId_ ) {
      if ( !pfCandidate->isWithinJet_ ) {
	if ( pfCandidate->type_ == reco::MVAMEtPFCandInfo::kNoPileUpCharged ) {
	  addToCommonMETData(*sumNoPUunclChargedCands, pfCandidate->p4_);
	  metSignObjectsNoPUunclChargedCands.push_back(pfCandidate->pfMEtSignObj_);
	} else if ( pfCandidate->type_ == reco::MVAMEtPFCandInfo::kPileUpCharged ) {
	  addToCommonMETData(*sumPUunclChargedCands, pfCandidate->p4_);
	  metSignObjectsPUunclChargedCands.push_back(pfCandidate->pfMEtSignObj_);
	} else if ( pfCandidate->type_ == reco::MVAMEtPFCandInfo::kNeutral ) {
	  addToCommonMETData(*sumUnclNeutralCands, pfCandidate->p4_);
	  metSignObjectsUnclNeutralCands.push_back(pfCandidate->pfMEtSignObj_);
	}
      }
    }
    ++pfCandIdx;
  }

  edm::Handle<CorrMETData> type0Correction_input;
  evt.getByLabel(srcType0Correction_, type0Correction_input);
  std::auto_ptr<CommonMETData> type0Correction_output(new CommonMETData());
  initializeCommonMETData(*type0Correction_output);
  type0Correction_output->mex = type0Correction_input->mex;
  type0Correction_output->mey = type0Correction_input->mey;

  finalizeCommonMETData(*sumLeptons);
  finalizeCommonMETData(*sumNoPUjetOffsetEnCorr);
  finalizeCommonMETData(*sumNoPUjets);
  finalizeCommonMETData(*sumPUjets);
  finalizeCommonMETData(*sumNoPUunclChargedCands);
  finalizeCommonMETData(*sumPUunclChargedCands);
  finalizeCommonMETData(*sumUnclNeutralCands);
  finalizeCommonMETData(*type0Correction_output);

  if ( verbosity_ ) {
    printCommonMETData("sumLeptons", *sumLeptons);
    printCommonMETData("sumNoPUjetOffsetEnCorr", *sumNoPUjetOffsetEnCorr);
    printCommonMETData("sumNoPUjets", *sumNoPUjets);
    printCommonMETData("sumPUjets", *sumPUjets);
    printCommonMETData("sumNoPUunclChargedCands", *sumNoPUunclChargedCands);
    printCommonMETData("sumPUunclChargedCands", *sumPUunclChargedCands);
    printCommonMETData("sumUnclNeutralCands", *sumUnclNeutralCands);
    printCommonMETData("type0Correction", *type0Correction_output);
  }

  double noPileUpScaleFactor = ( sumPUunclChargedCands->sumet > 0. ) ?
    (sumPUunclChargedCands->sumet/(sumNoPUunclChargedCands->sumet + sumPUunclChargedCands->sumet)) : 1.;
  if ( verbosity_ ) std::cout << "noPileUpScaleFactor = " << noPileUpScaleFactor << std::endl;

  double noPileUpMEtPx = -(sumLeptons->mex + sumNoPUjets->mex + sumNoPUunclChargedCands->mex 
    + noPileUpScaleFactor*(sfNoPUjetOffsetEnCorr_*sumNoPUjetOffsetEnCorr->mex 
			 + sfUnclNeutralCands_*sumUnclNeutralCands->mex + sfPUunclChargedCands_*sumPUunclChargedCands->mex + sfPUjets_*sumPUjets->mex))
    + noPileUpScaleFactor*sfType0Correction_*type0Correction_output->mex;
  double noPileUpMEtPy = -(sumLeptons->mey + sumNoPUjets->mey + sumNoPUunclChargedCands->mey
    + noPileUpScaleFactor*(sfNoPUjetOffsetEnCorr_*sumNoPUjetOffsetEnCorr->mey
			 + sfUnclNeutralCands_*sumUnclNeutralCands->mey + sfPUunclChargedCands_*sumPUunclChargedCands->mey + sfPUjets_*sumPUjets->mey))
    + noPileUpScaleFactor*sfType0Correction_*type0Correction_output->mey;
  double noPileUpMEtPt = sqrt(noPileUpMEtPx*noPileUpMEtPx + noPileUpMEtPy*noPileUpMEtPy);		  
  reco::Candidate::LorentzVector noPileUpMEtP4(noPileUpMEtPx, noPileUpMEtPy, 0., noPileUpMEtPt);

  reco::PFMET noPileUpMEt(pfMEt_original);
  noPileUpMEt.setP4(noPileUpMEtP4);
  //noPileUpMEt.setSignificanceMatrix(pfMEtCov);

  std::vector<metsig::SigInputObj> metSignObjects_scaled;
  scaleAndAddPFMEtSignObjects(metSignObjects_scaled, metSignObjectsLeptons, 1.0, sfMEtCovMin_, sfMEtCovMax_);
  scaleAndAddPFMEtSignObjects(metSignObjects_scaled, metSignObjectsNoPUjetOffsetEnCorr, sfNoPUjetOffsetEnCorr_, sfMEtCovMin_, sfMEtCovMax_);
  scaleAndAddPFMEtSignObjects(metSignObjects_scaled, metSignObjectsNoPUjets, sfNoPUjets_, sfMEtCovMin_, sfMEtCovMax_);
  scaleAndAddPFMEtSignObjects(metSignObjects_scaled, metSignObjectsPUjets, noPileUpScaleFactor*sfPUjets_, sfMEtCovMin_, sfMEtCovMax_);
  scaleAndAddPFMEtSignObjects(metSignObjects_scaled, metSignObjectsNoPUunclChargedCands, sfNoPUunclChargedCands_, sfMEtCovMin_, sfMEtCovMax_);
  scaleAndAddPFMEtSignObjects(metSignObjects_scaled, metSignObjectsPUunclChargedCands, noPileUpScaleFactor*sfPUunclChargedCands_, sfMEtCovMin_, sfMEtCovMax_);
  scaleAndAddPFMEtSignObjects(metSignObjects_scaled, metSignObjectsUnclNeutralCands, noPileUpScaleFactor*sfUnclNeutralCands_, sfMEtCovMin_, sfMEtCovMax_);
  TMatrixD pfMEtCov_recomputed = computePFMEtSignificance(metSignObjects_scaled);
  noPileUpMEt.setSignificanceMatrix(pfMEtCov_recomputed);

  if ( verbosity_ ) {
    std::cout << "<NoPileUpPFMEtProducer::produce>:" << std::endl;
    std::cout << " moduleLabel = " << moduleLabel_ << std::endl;
    std::cout << " PFMET: Pt = " << pfMEt_original.pt() << ", phi = " << pfMEt_original.phi() << " "
	      << "(Px = " << pfMEt_original.px() << ", Py = " << pfMEt_original.py() << ")" << std::endl;
    std::cout << " Cov:" << std::endl;
    pfMEtCov.Print();
    std::cout << " no-PU MET: Pt = " << noPileUpMEt.pt() << ", phi = " << noPileUpMEt.phi() << " "
	      << "(Px = " << noPileUpMEt.px() << ", Py = " << noPileUpMEt.py() << ")" << std::endl;
    std::cout << " Cov:" << std::endl;
    noPileUpMEt.getSignificanceMatrix().Print();
    std::cout << std::endl;
  }
  
  // add no-PU MET object to the event
  std::auto_ptr<reco::PFMETCollection> noPileUpMEtCollection(new reco::PFMETCollection());
  noPileUpMEtCollection->push_back(noPileUpMEt);
  
  evt.put(noPileUpMEtCollection);
  if ( saveInputs_ ) {
    evt.put(sumLeptons, "sumLeptons");
    evt.put(sumNoPUjetOffsetEnCorr, "sumNoPUjetOffsetEnCorr");
    evt.put(sumNoPUjets, "sumNoPUjets");
    evt.put(sumPUjets, "sumPUjets");
    evt.put(sumNoPUunclChargedCands, "sumNoPUunclChargedCands");
    evt.put(sumPUunclChargedCands, "sumPUunclChargedCands");
    evt.put(sumUnclNeutralCands, "sumUnclNeutralCands");
    evt.put(type0Correction_output, "type0Correction");
  }

  std::auto_ptr<double> sfNoPU(new double(noPileUpScaleFactor));
  evt.put(sfNoPU, "sfNoPU");
}

#include "FWCore/Framework/interface/MakerMacros.h"

DEFINE_FWK_MODULE(NoPileUpPFMEtProducer);
