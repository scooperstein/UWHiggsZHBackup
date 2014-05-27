#include "JetMETCorrections/METPUSubtraction/plugins/NoPileUpPFMEtDataProducer.h"

#include "FWCore/Utilities/interface/Exception.h"
#include "FWCore/MessageLogger/interface/MessageLogger.h"

#include "DataFormats/JetReco/interface/PFJet.h"
#include "DataFormats/JetReco/interface/PFJetCollection.h"
#include "DataFormats/Common/interface/ValueMap.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidate.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidateFwd.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"
#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/METReco/interface/MVAMEtData.h"       
#include "DataFormats/METReco/interface/MVAMEtDataFwd.h"    
#include "RecoMET/METAlgorithms/interface/SigInputObj.h"    //PH: preserve 5_3_x dependence

#include "JetMETCorrections/Objects/interface/JetCorrector.h"

#include "JetMETCorrections/METPUSubtraction/interface/noPileUpMEtAuxFunctions.h"

#include <algorithm>
#include <math.h>

const int flag_isWithinFakeJet      = 1;
const int flag_isWithinSelectedJet  = 2;
const int flag_isWithinJetForMEtCov = 4;

NoPileUpPFMEtDataProducer::NoPileUpPFMEtDataProducer(const edm::ParameterSet& cfg)
  : moduleLabel_(cfg.getParameter<std::string>("@module_label")),
    looseJetIdAlgo_(0),
    pfMEtSignInterface_(0)
{
  srcJets_ = cfg.getParameter<edm::InputTag>("srcJets");
  srcJetIds_ = cfg.getParameter<edm::InputTag>("srcJetIds");
  minJetPt_ = cfg.getParameter<double>("minJetPt");
  std::string jetIdSelection_string = cfg.getParameter<std::string>("jetIdSelection");
  if      ( jetIdSelection_string == "loose"  ) jetIdSelection_ = PileupJetIdentifier::kLoose;
  else if ( jetIdSelection_string == "medium" ) jetIdSelection_ = PileupJetIdentifier::kMedium;
  else if ( jetIdSelection_string == "tight"  ) jetIdSelection_ = PileupJetIdentifier::kTight;
  else throw cms::Exception("NoPileUpPFMEtDataProducer")
    << "Invalid Configuration Parameter 'jetIdSelection' = " << jetIdSelection_string << " !!\n";
  jetEnOffsetCorrLabel_ = cfg.getParameter<std::string>("jetEnOffsetCorrLabel");

  srcPFCandidates_ = cfg.getParameter<edm::InputTag>("srcPFCandidates");
  srcPFCandToVertexAssociations_ = cfg.getParameter<edm::InputTag>("srcPFCandToVertexAssociations");
  srcJetsForMEtCov_ = cfg.getParameter<edm::InputTag>("srcJetsForMEtCov");
  minJetPtForMEtCov_ = cfg.getParameter<double>("minJetPtForMEtCov");
  srcHardScatterVertex_ = cfg.getParameter<edm::InputTag>("srcHardScatterVertex");
  dZcut_ = cfg.getParameter<double>("dZcut");

  edm::ParameterSet cfgPFJetIdAlgo;
  cfgPFJetIdAlgo.addParameter<std::string>("version", "FIRSTDATA");
  cfgPFJetIdAlgo.addParameter<std::string>("quality", "LOOSE");
  looseJetIdAlgo_ = new PFJetIDSelectionFunctor(cfgPFJetIdAlgo);

  pfMEtSignInterface_ = new PFMEtSignInterfaceBase(cfg.getParameter<edm::ParameterSet>("resolution"));

  maxWarnings_ = ( cfg.exists("maxWarnings") ) ?
    cfg.getParameter<int>("maxWarnings") : 1;
  numWarnings_ = 0;

  verbosity_ = ( cfg.exists("verbosity") ) ?
    cfg.getParameter<int>("verbosity") : 0;

  produces<reco::MVAMEtJetInfoCollection>();
  produces<reco::MVAMEtPFCandInfoCollection>();
}

NoPileUpPFMEtDataProducer::~NoPileUpPFMEtDataProducer()
{
  delete looseJetIdAlgo_;
  delete pfMEtSignInterface_;
}

namespace
{
  void setPFCandidateFlag(const reco::PFJet& pfJet, 
			  const edm::View<reco::PFCandidate>& pfCandidateCollection, 
			  std::vector<int>& flags, int value,
			  int& numWarnings, int maxWarnings,
			  std::vector<const reco::PFJet*>* pfCandidateToJetAssociations = 0)
  {
    std::vector<reco::PFCandidatePtr> pfJetConstituents = pfJet.getPFConstituents();
    for ( std::vector<reco::PFCandidatePtr>::const_iterator pfJetConstituent = pfJetConstituents.begin();
	  pfJetConstituent != pfJetConstituents.end(); ++pfJetConstituent ) {
      std::vector<int> idxs;
      if ( pfJetConstituent->id() == pfCandidateCollection.id() ) {
	idxs.push_back(pfJetConstituent->key());
      } else {	
	bool isMatched_fast = false;
	if ( pfJetConstituent->key() < pfCandidateCollection.size() ) {
	  edm::Ptr<reco::PFCandidate> pfCandidatePtr = pfCandidateCollection.ptrAt(pfJetConstituent->key());
	  double dR = deltaR((*pfJetConstituent)->p4(), pfCandidatePtr->p4());
	  if ( dR < 1.e-5 ) {
	    idxs.push_back(pfCandidatePtr.key());
	    isMatched_fast = true;
	  }
	}
	if ( !isMatched_fast ) {
	  size_t numPFCandidates = pfCandidateCollection.size();
	  for ( size_t iPFCandidate = 0; iPFCandidate < numPFCandidates; ++iPFCandidate ) {
	    edm::Ptr<reco::PFCandidate> pfCandidatePtr = pfCandidateCollection.ptrAt(iPFCandidate);
	    double dR = deltaR((*pfJetConstituent)->p4(), pfCandidatePtr->p4());
	    if ( dR < 1.e-3 ) {
	      idxs.push_back(pfCandidatePtr.key());
	    }
	  }
	  if ( numWarnings < maxWarnings ) {
	    edm::LogWarning ("setPFCandidateFlag") 
	      << " The productIDs of PFJetConstituent and PFCandidateCollection passed as function arguments don't match.\n" 
	      << "NOTE: The return value will be unaffected, but the code will run MUCH slower !!";
	    ++numWarnings;
	  }
	}
      }
      if ( idxs.size() >= 1 ) {
	for ( std::vector<int>::const_iterator idx = idxs.begin();
	      idx != idxs.end(); ++idx ) {
	  if ( (*idx) >= (int)flags.size() ) flags.resize(2*flags.size());
	  flags[*idx] |= value;
	  if ( pfCandidateToJetAssociations ) (*pfCandidateToJetAssociations)[*idx] = &pfJet;
	}
      } else {
	edm::LogError ("setPFCandidateFlag") 
	  << " Failed to associated PFJetConstituent with index = " << pfJetConstituent->key() << " to any PFCandidate !!";
      }
    }
  }

  std::string getPFCandidateType(const reco::PFCandidate& pfCandidate)
  {
    reco::PFCandidate::ParticleType pfCandidateType = pfCandidate.particleId();
    if      ( pfCandidateType == reco::PFCandidate::X         ) return "undefined";
    else if ( pfCandidateType == reco::PFCandidate::h         ) return "PFChargedHadron";
    else if ( pfCandidateType == reco::PFCandidate::e         ) return "PFElectron";
    else if ( pfCandidateType == reco::PFCandidate::mu        ) return "PFMuon";
    else if ( pfCandidateType == reco::PFCandidate::gamma     ) return "PFGamma";
    else if ( pfCandidateType == reco::PFCandidate::h0        ) return "PFNeutralHadron";
    else if ( pfCandidateType == reco::PFCandidate::h_HF      ) return "HF_had";
    else if ( pfCandidateType == reco::PFCandidate::egamma_HF ) return "HF_em";
    else assert(0);
  }
}

void NoPileUpPFMEtDataProducer::produce(edm::Event& evt, const edm::EventSetup& es)
{
  if ( verbosity_ ) {
    std::cout << "<NoPileUpPFMEtDataProducer::produce>:" << std::endl;
    std::cout << " moduleLabel = " << moduleLabel_ << std::endl;
  }
  
  // get jets 
  edm::Handle<reco::PFJetCollection> jets;
  evt.getByLabel(srcJets_, jets);

  typedef edm::ValueMap<int> jetIdMap;
  edm::Handle<jetIdMap> jetIds;
  evt.getByLabel(srcJetIds_, jetIds);

  // get jets for computing contributions to PFMEt significance matrix
  edm::Handle<reco::PFJetCollection> jetsForMEtCov;
  if ( srcJetsForMEtCov_.label() != "" ) evt.getByLabel(srcJetsForMEtCov_, jetsForMEtCov);

  // get PFCandidates
  typedef edm::View<reco::PFCandidate> PFCandidateView;
  edm::Handle<PFCandidateView> pfCandidates;
  evt.getByLabel(srcPFCandidates_, pfCandidates);

  std::vector<int> pfCandidateFlags(pfCandidates->size());
  std::vector<const reco::PFJet*> pfCandidateToJetAssociations(pfCandidates->size());

  edm::Handle<reco::PFCandidateCollection> pfCandidateHandle;
  evt.getByLabel(srcPFCandidates_, pfCandidateHandle);

  // get PFCandidate-to-vertex associations and "the" hard-scatter vertex
  edm::Handle<PFCandidateToVertexAssociationMap> pfCandToVertexAssociations;
  evt.getByLabel(srcPFCandToVertexAssociations_, pfCandToVertexAssociations);

  reversedPFCandidateToVertexAssociationMap pfCandToVertexAssociations_reversed = reversePFCandToVertexAssociation(*pfCandToVertexAssociations);

  edm::Handle<reco::VertexCollection> hardScatterVertex;
  evt.getByLabel(srcHardScatterVertex_, hardScatterVertex);
  if ( verbosity_ && hardScatterVertex->size() >= 1 ) {
    reco::Vertex::Point hardScatterVertexPos = hardScatterVertex->front().position();
    std::cout << "hard-scatter Vertex: x = " << hardScatterVertexPos.x() << ", y = " << hardScatterVertexPos.y() << ", z = " << hardScatterVertexPos.z() << std::endl;
  }

  std::auto_ptr<reco::MVAMEtJetInfoCollection> jetInfos(new reco::MVAMEtJetInfoCollection());
  std::auto_ptr<reco::MVAMEtPFCandInfoCollection> pfCandInfos(new reco::MVAMEtPFCandInfoCollection());

  const JetCorrector* jetEnOffsetCorrector = 0;
  if ( jetEnOffsetCorrLabel_ != "" ) {
    const JetCorrector* jetEnOffsetCorrector = JetCorrector::getJetCorrector(jetEnOffsetCorrLabel_, es);
    if ( !jetEnOffsetCorrector )  
      throw cms::Exception("NoPileUpPFMEtDataProducer::produce")
	<< "Failed to access Jet corrections for = " << jetEnOffsetCorrLabel_ << " !!\n";
  }

  size_t numJets = jets->size();
  for ( size_t iJet = 0; iJet < numJets; ++iJet ) {
    reco::PFJetRef jet(jets, iJet);

    if ( !(jet->pt() > minJetPt_)  ) continue;
    
    bool passesLooseJetId = (*looseJetIdAlgo_)(*jet);
    if ( !passesLooseJetId ) {
      setPFCandidateFlag(*jet, *pfCandidates, pfCandidateFlags, flag_isWithinFakeJet, numWarnings_, maxWarnings_);
    }
    setPFCandidateFlag(*jet, *pfCandidates, pfCandidateFlags, flag_isWithinSelectedJet, numWarnings_, maxWarnings_);

    reco::MVAMEtJetInfo jetInfo;
    jetInfo.p4_ = jet->p4();
    int jetId = (*jetIds)[jet];
    bool jetIdSelection_passed = PileupJetIdentifier::passJetId(jetId, jetIdSelection_);
    jetInfo.type_ = ( jetIdSelection_passed ) ?
      reco::MVAMEtJetInfo::kNoPileUp : reco::MVAMEtJetInfo::kPileUp;
    jetInfo.passesLooseJetId_ = passesLooseJetId;
    double jetEnergy_uncorrected = 
       jet->chargedHadronEnergy() 
     + jet->neutralHadronEnergy()
     + jet->photonEnergy()
     + jet->electronEnergy()
     + jet->muonEnergy()
     + jet->HFHadronEnergy()
     + jet->HFEMEnergy();
    double jetPx_uncorrected = TMath::Cos(jet->phi())*TMath::Sin(jet->theta())*jetEnergy_uncorrected;
    double jetPy_uncorrected = TMath::Sin(jet->phi())*TMath::Sin(jet->theta())*jetEnergy_uncorrected;
    double jetPz_uncorrected = TMath::Cos(jet->theta())*jetEnergy_uncorrected;
    reco::Candidate::LorentzVector rawJetP4(jetPx_uncorrected, jetPy_uncorrected, jetPz_uncorrected, jetEnergy_uncorrected);
    reco::PFJet rawJet(*jet);
    rawJet.setP4(rawJetP4);
    double jetNeutralEnFrac = ( jetEnergy_uncorrected > 0. ) ?
      (jet->neutralEmEnergy() + jet->neutralHadronEnergy())/jetEnergy_uncorrected : -1.;
    jetInfo.neutralEnFrac_ = jetNeutralEnFrac;
    jetInfo.offsetEnCorr_ = ( jetEnOffsetCorrector ) ?
      rawJet.energy()*(1. - jetEnOffsetCorrector->correction(rawJet, evt, es)) : 0.;
    jetInfo.pfMEtSignObj_ = pfMEtSignInterface_->compResolution(&(*jet));
    if ( verbosity_ ) {
      std::cout << " jet: Pt = " << jet->pt() << ", eta = " << jet->eta() << ", phi = " << jet->phi() << ":" 
    	        << " sigma(En)/En = " << (jetInfo.pfMEtSignObj_.get_sigma_e()/jet->energy()) << std::endl;
      std::cout << "(offsetEnCorr = " << jetInfo.offsetEnCorr_ << ")" << std::endl;
      std::cout << "  id. flags: PU = " << jetIdSelection_passed << ", anti-noise = " << passesLooseJetId << std::endl;
      std::vector<reco::PFCandidatePtr> pfJetConstituents = jet->getPFConstituents();
      size_t numPFJetConstituents = pfJetConstituents.size();
      std::cout << "numConstituents = " << numPFJetConstituents << std::endl;
      for ( size_t iPFJetConstituent = 0; iPFJetConstituent < numPFJetConstituents; ++iPFJetConstituent ) {
	const reco::PFCandidatePtr& pfJetConstituent = pfJetConstituents[iPFJetConstituent];
	std::cout << " constituent #" << iPFJetConstituent << ": Pt = " << pfJetConstituent->pt() << ", eta = " << pfJetConstituent->eta() << ", phi = " << pfJetConstituent->phi() << std::endl;
      }
    }

    jetInfos->push_back(jetInfo);    
  }
  if ( verbosity_ ) std::cout << "#jetInfos = " << jetInfos->size() << std::endl;

  for ( reco::PFJetCollection::const_iterator jet = jets->begin();
	jet != jets->end(); ++jet ) {
    if ( jet->pt() > minJetPtForMEtCov_ ) {
      setPFCandidateFlag(*jet, *pfCandidates, pfCandidateFlags, flag_isWithinJetForMEtCov, numWarnings_, maxWarnings_, &pfCandidateToJetAssociations);
    }
  }

  size_t numPFCandidates = pfCandidates->size();
  for ( size_t iPFCandidate = 0; iPFCandidate < numPFCandidates; ++iPFCandidate ) {
    reco::PFCandidatePtr pfCandidatePtr = pfCandidates->ptrAt(iPFCandidate);

    int idx = pfCandidatePtr.key();

    reco::MVAMEtPFCandInfo pfCandInfo;
    pfCandInfo.p4_ = pfCandidatePtr->p4();
    pfCandInfo.charge_ = pfCandidatePtr->charge();
    pfCandInfo.type_ = -1;
    // CV: need to call isVertexAssociated_fast instead of isVertexAssociated function
    //    (makes run-time of MVAPFMEtDataProducer::produce decrease from ~1s per event to ~0.35s per event)
    //int vtxAssociationType = isVertexAssociated(*pfCandidatePtr, *pfCandToVertexAssociations, *hardScatterVertex, dZcut_);
    reco::PFCandidateRef pfCandidateRef(pfCandidateHandle, iPFCandidate);
    int vtxAssociationType = isVertexAssociated_fast(pfCandidateRef, pfCandToVertexAssociations_reversed, *hardScatterVertex, dZcut_, numWarnings_, maxWarnings_);
    bool isHardScatterVertex_associated = (vtxAssociationType >= 3);
    if      ( fabs(pfCandidatePtr->charge()) < 0.5 ) pfCandInfo.type_ = reco::MVAMEtPFCandInfo::kNeutral;
    else if ( isHardScatterVertex_associated       ) pfCandInfo.type_ = reco::MVAMEtPFCandInfo::kNoPileUpCharged;
    else                                             pfCandInfo.type_ = reco::MVAMEtPFCandInfo::kPileUpCharged;
    pfCandInfo.isWithinJet_ = (pfCandidateFlags[idx] & flag_isWithinSelectedJet);
    if ( pfCandInfo.isWithinJet_ ) pfCandInfo.passesLooseJetId_ = (pfCandidateFlags[idx] & flag_isWithinFakeJet);
    else pfCandInfo.passesLooseJetId_ = true;
    // CV: for PFCandidates that are within PFJets (of Pt between 'minJetPtForMEtCov' and 'minJetPt'),
    //     take contribution to PFMEt significance matrix from associated PFJet.
    //    (energy uncertainty scaled by ratio of PFCandidate/PFJet energy)
    const reco::PFJet* jet_matched = pfCandidateToJetAssociations[idx];
    if ( jet_matched ) {
      metsig::SigInputObj pfCandResolution = pfMEtSignInterface_->compResolution(pfCandidatePtr.get());
      metsig::SigInputObj jetResolution = pfMEtSignInterface_->compResolution(jet_matched);
      //std::cout << " jet (matched): Pt = " << jet_matched->pt() << ", eta = " << jet_matched->eta() << ", phi = " << jet_matched->phi() << ":" 
      //	  << " sigma(En)/En = " << (jetResolution.get_sigma_e()/jet_matched->energy()) << std::endl;
      //std::cout << "(pfCand: type = " << getPFCandidateType(*pfCandidate) << "," 
      //	  << " Pt = " << pfCandidatePtr->pt() << ", eta = " << pfCandidatePtr->eta() << ", phi = " << pfCandidatePtr->phi() << ":"
      //	  << " sigma(En)/En = " << (pfCandResolution.get_sigma_e()/pfCandidatePtr->energy()) << ")" << std::endl;
      pfCandInfo.pfMEtSignObj_.set(pfCandResolution.get_type(),
				   pfCandResolution.get_energy(),
				   pfCandResolution.get_phi(),
				   jetResolution.get_sigma_e()*(pfCandidatePtr->energy()/jet_matched->energy()),
				   jetResolution.get_sigma_tan());
    } else {
      pfCandInfo.pfMEtSignObj_ = pfMEtSignInterface_->compResolution(pfCandidatePtr.get());
      //std::cout << " pfCand: type = " << getPFCandidateType(*pfCandidate) << "," 
      //	  << " Pt = " << pfCandidatePtr->pt() << ", eta = " << pfCandidatePtr->eta() << ", phi = " << pfCandidatePtr->phi() << ":"
      //	  << " sigma(En)/En = " << (pfCandInfo.pfMEtSignObj_.get_sigma_e()/pfCandidatePtr->energy()) << std::endl;
    }

    pfCandInfos->push_back(pfCandInfo);
  }
  if ( verbosity_ ) std::cout << "#pfCandInfos = " << pfCandInfos->size() << std::endl;

  evt.put(jetInfos);
  evt.put(pfCandInfos);
}

#include "FWCore/Framework/interface/MakerMacros.h"

DEFINE_FWK_MODULE(NoPileUpPFMEtDataProducer);
