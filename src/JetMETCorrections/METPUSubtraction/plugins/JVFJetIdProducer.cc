#include "JetMETCorrections/METPUSubtraction/plugins/JVFJetIdProducer.h"

#include "FWCore/Utilities/interface/Exception.h"

#include "DataFormats/JetReco/interface/PFJet.h"
#include "DataFormats/JetReco/interface/PFJetCollection.h"
#include "DataFormats/Common/interface/ValueMap.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidate.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidateFwd.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"
#include "DataFormats/TrackReco/interface/Track.h"
#include "DataFormats/GsfTrackReco/interface/GsfTrack.h"
#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/Math/interface/deltaR.h"

#include "JetMETCorrections/METPUSubtraction/interface/noPileUpMEtAuxFunctions.h"

enum { kNeutralJetPU, kNeutralJetNoPU };

JVFJetIdProducer::JVFJetIdProducer(const edm::ParameterSet& cfg)
{
  srcJets_ = cfg.getParameter<edm::InputTag>("srcJets");

  srcPFCandidates_ = cfg.getParameter<edm::InputTag>("srcPFCandidates");
  srcPFCandToVertexAssociations_ = cfg.getParameter<edm::InputTag>("srcPFCandToVertexAssociations");
  srcHardScatterVertex_ = cfg.getParameter<edm::InputTag>("srcHardScatterVertex");
  minTrackPt_ = cfg.getParameter<double>("minTrackPt");
  dZcut_ = cfg.getParameter<double>("dZcut");

  JVFcut_ = cfg.getParameter<double>("JVFcut");

  std::string neutralJetOption_string = cfg.getParameter<std::string>("neutralJetOption");
  if      ( neutralJetOption_string == "PU"   ) neutralJetOption_ = kNeutralJetPU;
  else if ( neutralJetOption_string == "noPU" ) neutralJetOption_ = kNeutralJetNoPU;
  else throw cms::Exception("JVFJetIdProducer")
    << "Invalid Configuration Parameter 'neutralJetOption' = " << neutralJetOption_string << " !!\n";

  verbosity_ = ( cfg.exists("verbosity") ) ?
    cfg.getParameter<int>("verbosity") : 0;

  produces<edm::ValueMap<double> >("Discriminant");
  produces<edm::ValueMap<int> >("Id");
}

JVFJetIdProducer::~JVFJetIdProducer()
{
// nothing to be done yet...
}

namespace
{
  double computeJVF(const reco::PFJet& jet, 
		    const PFCandidateToVertexAssociationMap& pfCandToVertexAssociations,
		    const reco::VertexCollection& vertices, double dZ, double minTrackPt,
		    int verbosity)
  {
    if ( verbosity ) {
      std::cout << "<computeJVF>:" << std::endl;
      std::cout << " jet: Pt = " << jet.pt() << ", eta = " << jet.eta() << ", phi = " << jet.phi() << std::endl;
    }

    double trackSum_isVtxAssociated    = 0.;
    double trackSum_isNotVtxAssociated = 0.;
    std::vector<reco::PFCandidatePtr> jetConstituents = jet.getPFConstituents();
    for ( std::vector<reco::PFCandidatePtr>::const_iterator jetConstituent = jetConstituents.begin();
	  jetConstituent != jetConstituents.end(); ++jetConstituent ) {
      if ( fabs((*jetConstituent)->charge()) > 0.5 ) {
	double trackPt = 0.;
	if ( (*jetConstituent)->gsfTrackRef().isNonnull() && (*jetConstituent)->gsfTrackRef().isAvailable() ) trackPt = (*jetConstituent)->gsfTrackRef()->pt();
	else if ( (*jetConstituent)->trackRef().isNonnull() && (*jetConstituent)->trackRef().isAvailable() ) trackPt = (*jetConstituent)->trackRef()->pt();
	else trackPt = (*jetConstituent)->pt();
	if ( trackPt > minTrackPt ) {
	  int jetConstituent_vtxAssociationType = isVertexAssociated(**jetConstituent, pfCandToVertexAssociations, vertices, dZ);
	  bool jetConstituent_isVtxAssociated = (jetConstituent_vtxAssociationType >= 3); 
	  double jetConstituentPt = (*jetConstituent)->pt();
	  if ( jetConstituent_isVtxAssociated ) {
	    if ( verbosity ) {
	      std::cout << "associated track: Pt = " << (*jetConstituent)->pt() << ", eta = " << (*jetConstituent)->eta() << ", phi = " << (*jetConstituent)->phi() << std::endl;
	      std::cout << " (vtxAssociationType = " << jetConstituent_vtxAssociationType << ")" << std::endl;
	    }
	    trackSum_isVtxAssociated += jetConstituentPt;
	  } else {
	    if ( verbosity ) {
	      std::cout << "unassociated track: Pt = " << (*jetConstituent)->pt() << ", eta = " << (*jetConstituent)->eta() << ", phi = " << (*jetConstituent)->phi() << std::endl;
	      std::cout << " (vtxAssociationType = " << jetConstituent_vtxAssociationType << ")" << std::endl;
	    }
	    trackSum_isNotVtxAssociated += jetConstituentPt;
	  }
	}
      }
    }
    
    double trackSum = trackSum_isVtxAssociated + trackSum_isNotVtxAssociated;
    
    double jvf = -1.;
    if ( TMath::Abs(jet.eta()) < 2.5 && trackSum > 5. ) {
      jvf = trackSum_isVtxAssociated/trackSum;
    }
    
    if ( verbosity ) {
      std::cout << "trackSum: associated = " << trackSum_isVtxAssociated << ", unassociated = " << trackSum_isNotVtxAssociated << std::endl;
      std::cout << " --> JVF = " << jvf << std::endl;
    }

    return jvf;
  }
}

void JVFJetIdProducer::produce(edm::Event& evt, const edm::EventSetup& es)
{
// get jets 
  edm::Handle<reco::PFJetCollection> jets;
  evt.getByLabel(srcJets_, jets);

  // get PFCandidates
  edm::Handle<reco::PFCandidateCollection> pfCandidates;
  evt.getByLabel(srcPFCandidates_, pfCandidates);

  // get PFCandidate-to-vertex associations and "the" hard-scatter vertex
  edm::Handle<PFCandidateToVertexAssociationMap> pfCandToVertexAssociations;
  evt.getByLabel(srcPFCandToVertexAssociations_, pfCandToVertexAssociations);

  edm::Handle<reco::VertexCollection> hardScatterVertex;
  evt.getByLabel(srcHardScatterVertex_, hardScatterVertex);

  std::vector<double> jetIdDiscriminants;
  std::vector<int> jetIdFlags;

  size_t numJets = jets->size();
  for ( size_t iJet = 0; iJet < numJets; ++iJet ) {
    reco::PFJetRef jet(jets, iJet);

    double jetJVF = computeJVF(*jet, *pfCandToVertexAssociations, *hardScatterVertex, dZcut_, minTrackPt_, verbosity_ && jet->pt() > 20.);
    jetIdDiscriminants.push_back(jetJVF);

    int jetIdFlag = 0;
    if ( jetJVF > JVFcut_ ) jetIdFlag = 255;
    else if ( jetJVF < -0.5 && neutralJetOption_ == kNeutralJetNoPU ) jetIdFlag = 255;
    jetIdFlags.push_back(jetIdFlag);
  }

  std::auto_ptr<edm::ValueMap<double> > jetIdDiscriminants_ptr(new edm::ValueMap<double>());
  edm::ValueMap<double>::Filler jetIdDiscriminantFiller(*jetIdDiscriminants_ptr);
  jetIdDiscriminantFiller.insert(jets, jetIdDiscriminants.begin(), jetIdDiscriminants.end());
  jetIdDiscriminantFiller.fill();

  std::auto_ptr<edm::ValueMap<int> > jetIdFlags_ptr(new edm::ValueMap<int>());
  edm::ValueMap<int>::Filler jetIdFlagFiller(*jetIdFlags_ptr);
  jetIdFlagFiller.insert(jets, jetIdFlags.begin(), jetIdFlags.end());
  jetIdFlagFiller.fill();

  evt.put(jetIdDiscriminants_ptr, "Discriminant");
  evt.put(jetIdFlags_ptr, "Id");
}

#include "FWCore/Framework/interface/MakerMacros.h"

DEFINE_FWK_MODULE(JVFJetIdProducer);
