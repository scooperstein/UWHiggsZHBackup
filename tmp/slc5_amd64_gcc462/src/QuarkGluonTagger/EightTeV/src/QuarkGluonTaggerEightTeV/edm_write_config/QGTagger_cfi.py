import FWCore.ParameterSet.Config as cms

QGTagger = cms.EDProducer('QGTagger',
  dataDir = cms.untracked.string('QuarkGluonTagger/EightTeV/data/'),
  jec = cms.untracked.string(''),
  useCHS = cms.untracked.bool(False),
  isPatJet = cms.untracked.bool(False)
)
