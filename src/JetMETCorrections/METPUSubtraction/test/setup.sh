#!/bin/bash 

#Setup script for MVA Met studies in CMSSW_5_3_3 
#Point of this script is to get the root files
#To start you must first
# cvs co -r METPU_5_3_X_v0 JetMETCorrections/METPUSubtraction
tag=METPU_5_3_X_v4

cd ../../../
cvs co -r HEAD -d pharrisTmp UserCode/pharris/MVAMet/data
cp  -d pharrisTmp/*Dec2012*.root           JetMETCorrections/METPUSubtraction/data/
#cp  -d pharrisTmp/*53_UnityResponse.root  JetMETCorrections/METPUSubtraction/data/
rm -rf pharrisTmp

cvs co -r $tag RecoJets/JetProducers
cvs up -r HEAD RecoJets/JetProducers/python/PileupJetIDCutParams_cfi.py                     
cvs up -r HEAD RecoJets/JetProducers/python/PileupJetIDParams_cfi.py                     
cvs up -r HEAD RecoJets/JetProducers/python/PileupJetID_cfi.py                     
#cvs up -r CMSSW_5_3_3 RecoJets/JetProducers/src/JetSpecific.cc

cvs co -r b5_3_X_cvMEtCorr_2013Feb22            DataFormats/METReco
cvs co -r V05-00-16                             DataFormats/JetReco
cvs co -r V03-04-07                             RecoMET/METAlgorithms
cd -