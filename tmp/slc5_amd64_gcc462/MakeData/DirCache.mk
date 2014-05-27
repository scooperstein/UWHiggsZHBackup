ALL_COMMONRULES += src_FinalStateAnalysis_StatTools_test
src_FinalStateAnalysis_StatTools_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_StatTools_test,src/FinalStateAnalysis/StatTools/test,TEST))
src_HiggsAnalysis_HiggsToTauTau_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/HiggsAnalysis/HiggsToTauTau/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_HiggsAnalysis_HiggsToTauTau_scripts,src/HiggsAnalysis/HiggsToTauTau/scripts,$(SCRAMSTORENAME_BIN),*))
ifeq ($(strip $(PyRecoEgammaEgammaTools)),)
PyRecoEgammaEgammaTools := self/src/RecoEgamma/EgammaTools/python
PyRecoEgammaEgammaTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoEgamma/EgammaTools/python)
ALL_PRODS += PyRecoEgammaEgammaTools
PyRecoEgammaEgammaTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoEgammaEgammaTools,src/RecoEgamma/EgammaTools/python,src_RecoEgamma_EgammaTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoEgammaEgammaTools,src/RecoEgamma/EgammaTools/python))
endif
ALL_COMMONRULES += src_RecoEgamma_EgammaTools_python
src_RecoEgamma_EgammaTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoEgamma_EgammaTools_python,src/RecoEgamma/EgammaTools/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/test_setup/setup)
subdirs_src_test_setup_setup := 
ALL_PACKAGES += $(patsubst src/%,%,src/ZZMatrixElement/MEMCalculators)
subdirs_src_ZZMatrixElement_MEMCalculators := src_ZZMatrixElement_MEMCalculators_test src_ZZMatrixElement_MEMCalculators_src
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/PatTools)
subdirs_src_FinalStateAnalysis_PatTools := src_FinalStateAnalysis_PatTools_test src_FinalStateAnalysis_PatTools_python src_FinalStateAnalysis_PatTools_plugins src_FinalStateAnalysis_PatTools_src
ifeq ($(strip $(PyPhysicsToolsPatAlgos)),)
PyPhysicsToolsPatAlgos := self/src/PhysicsTools/PatAlgos/python
PyPhysicsToolsPatAlgos_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/PhysicsTools/PatAlgos/python)
ALL_PRODS += PyPhysicsToolsPatAlgos
PyPhysicsToolsPatAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/python,src_PhysicsTools_PatAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/python))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_python
src_PhysicsTools_PatAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_python,src/PhysicsTools/PatAlgos/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoEgamma/EgammaTools)
subdirs_src_RecoEgamma_EgammaTools := src_RecoEgamma_EgammaTools_plugins src_RecoEgamma_EgammaTools_test src_RecoEgamma_EgammaTools_src src_RecoEgamma_EgammaTools_python
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/lfvmutau)
subdirs_src_UWHiggs_lfvmutau := 
ifeq ($(strip $(testCaloCluster)),)
testCaloCluster_files := $(patsubst src/DataFormats/CaloRecHit/test/%,%,$(foreach file,testRunner.cpp testCaloCluster.cppunit.cc,$(eval xfile:=$(wildcard src/DataFormats/CaloRecHit/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/DataFormats/CaloRecHit/test/$(file). Please fix src/DataFormats/CaloRecHit/test/BuildFile.))))
testCaloCluster := self/src/DataFormats/CaloRecHit/test
testCaloCluster_TEST_RUNNER_CMD :=  testCaloCluster 
testCaloCluster_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/CaloRecHit/test/BuildFile
testCaloCluster_LOC_USE   := self DataFormats/CaloRecHit DataFormats/Math cppunit
testCaloCluster_PACKAGE := self/src/DataFormats/CaloRecHit/test
ALL_PRODS += testCaloCluster
testCaloCluster_INIT_FUNC        += $$(eval $$(call Binary,testCaloCluster,src/DataFormats/CaloRecHit/test,src_DataFormats_CaloRecHit_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(testCaloCluster_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,testCaloCluster,src/DataFormats/CaloRecHit/test))
endif
ALL_COMMONRULES += src_DataFormats_CaloRecHit_test
src_DataFormats_CaloRecHit_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DataFormats_CaloRecHit_test,src/DataFormats/CaloRecHit/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/CommonTools/ParticleFlow)
subdirs_src_CommonTools_ParticleFlow := src_CommonTools_ParticleFlow_python src_CommonTools_ParticleFlow_src src_CommonTools_ParticleFlow_test src_CommonTools_ParticleFlow_plugins
ifeq ($(strip $(PyRecoBTagSecondaryVertex)),)
PyRecoBTagSecondaryVertex := self/src/RecoBTag/SecondaryVertex/python
PyRecoBTagSecondaryVertex_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoBTag/SecondaryVertex/python)
ALL_PRODS += PyRecoBTagSecondaryVertex
PyRecoBTagSecondaryVertex_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoBTagSecondaryVertex,src/RecoBTag/SecondaryVertex/python,src_RecoBTag_SecondaryVertex_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoBTagSecondaryVertex,src/RecoBTag/SecondaryVertex/python))
endif
ALL_COMMONRULES += src_RecoBTag_SecondaryVertex_python
src_RecoBTag_SecondaryVertex_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoBTag_SecondaryVertex_python,src/RecoBTag/SecondaryVertex/python,PYTHON))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoLuminosity)
subdirs_src_RecoLuminosity = src_RecoLuminosity_LumiDB
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoBTag)
subdirs_src_RecoBTag = src_RecoBTag_SecondaryVertex
ifeq ($(strip $(PyFinalStateAnalysisPatTools)),)
PyFinalStateAnalysisPatTools := self/src/FinalStateAnalysis/PatTools/python
PyFinalStateAnalysisPatTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/PatTools/python)
ALL_PRODS += PyFinalStateAnalysisPatTools
PyFinalStateAnalysisPatTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisPatTools,src/FinalStateAnalysis/PatTools/python,src_FinalStateAnalysis_PatTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisPatTools,src/FinalStateAnalysis/PatTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_PatTools_python
src_FinalStateAnalysis_PatTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PatTools_python,src/FinalStateAnalysis/PatTools/python,PYTHON))
ifeq ($(strip $(PyFinalStateAnalysisMetaData)),)
PyFinalStateAnalysisMetaData := self/src/FinalStateAnalysis/MetaData/python
PyFinalStateAnalysisMetaData_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/MetaData/python)
ALL_PRODS += PyFinalStateAnalysisMetaData
PyFinalStateAnalysisMetaData_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisMetaData,src/FinalStateAnalysis/MetaData/python,src_FinalStateAnalysis_MetaData_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisMetaData,src/FinalStateAnalysis/MetaData/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_MetaData_python
src_FinalStateAnalysis_MetaData_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_MetaData_python,src/FinalStateAnalysis/MetaData/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/TagAndProbe)
subdirs_src_FinalStateAnalysis_TagAndProbe := src_FinalStateAnalysis_TagAndProbe_src src_FinalStateAnalysis_TagAndProbe_test src_FinalStateAnalysis_TagAndProbe_python
ifeq ($(strip $(PyFinalStateAnalysisTagAndProbe)),)
PyFinalStateAnalysisTagAndProbe := self/src/FinalStateAnalysis/TagAndProbe/python
PyFinalStateAnalysisTagAndProbe_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/TagAndProbe/python)
ALL_PRODS += PyFinalStateAnalysisTagAndProbe
PyFinalStateAnalysisTagAndProbe_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisTagAndProbe,src/FinalStateAnalysis/TagAndProbe/python,src_FinalStateAnalysis_TagAndProbe_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisTagAndProbe,src/FinalStateAnalysis/TagAndProbe/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_TagAndProbe_python
src_FinalStateAnalysis_TagAndProbe_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_TagAndProbe_python,src/FinalStateAnalysis/TagAndProbe/python,PYTHON))
ifeq ($(strip $(nsvfitStandalone)),)
nsvfitStandalone_files := $(patsubst src/TauAnalysis/CandidateTools/bin/%,%,$(foreach file,nsvfitStandalone.cc,$(eval xfile:=$(wildcard src/TauAnalysis/CandidateTools/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/TauAnalysis/CandidateTools/bin/$(file). Please fix src/TauAnalysis/CandidateTools/bin/BuildFile.))))
nsvfitStandalone := self/src/TauAnalysis/CandidateTools/bin
nsvfitStandalone_BuildFile    := $(WORKINGDIR)/cache/bf/src/TauAnalysis/CandidateTools/bin/BuildFile
nsvfitStandalone_LOC_USE   := self TauAnalysis/CandidateTools FWCore/PythonParameterSet FWCore/ParameterSet rootcintex root
nsvfitStandalone_PACKAGE := self/src/TauAnalysis/CandidateTools/bin
ALL_PRODS += nsvfitStandalone
nsvfitStandalone_INIT_FUNC        += $$(eval $$(call Binary,nsvfitStandalone,src/TauAnalysis/CandidateTools/bin,src_TauAnalysis_CandidateTools_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(nsvfitStandalone_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,nsvfitStandalone,src/TauAnalysis/CandidateTools/bin))
endif
ALL_COMMONRULES += src_TauAnalysis_CandidateTools_bin
src_TauAnalysis_CandidateTools_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_TauAnalysis_CandidateTools_bin,src/TauAnalysis/CandidateTools/bin,BINARY))
ALL_COMMONRULES += src_FinalStateAnalysis_PatTools_test
src_FinalStateAnalysis_PatTools_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PatTools_test,src/FinalStateAnalysis/PatTools/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/CaloRecHit)
subdirs_src_DataFormats_CaloRecHit := src_DataFormats_CaloRecHit_src src_DataFormats_CaloRecHit_test
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/RecoTools)
subdirs_src_FinalStateAnalysis_RecoTools := src_FinalStateAnalysis_RecoTools_test src_FinalStateAnalysis_RecoTools_bin src_FinalStateAnalysis_RecoTools_plugins src_FinalStateAnalysis_RecoTools_python src_FinalStateAnalysis_RecoTools_scripts
ALL_COMMONRULES += src_ZZMatrixElement_MELA_test
src_ZZMatrixElement_MELA_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_ZZMatrixElement_MELA_test,src/ZZMatrixElement/MELA/test,TEST))
ifeq ($(strip $(PyJetMETCorrectionsMETPUSubtraction)),)
PyJetMETCorrectionsMETPUSubtraction := self/src/JetMETCorrections/METPUSubtraction/python
PyJetMETCorrectionsMETPUSubtraction_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/JetMETCorrections/METPUSubtraction/python)
ALL_PRODS += PyJetMETCorrectionsMETPUSubtraction
PyJetMETCorrectionsMETPUSubtraction_INIT_FUNC        += $$(eval $$(call PythonProduct,PyJetMETCorrectionsMETPUSubtraction,src/JetMETCorrections/METPUSubtraction/python,src_JetMETCorrections_METPUSubtraction_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyJetMETCorrectionsMETPUSubtraction,src/JetMETCorrections/METPUSubtraction/python))
endif
ALL_COMMONRULES += src_JetMETCorrections_METPUSubtraction_python
src_JetMETCorrections_METPUSubtraction_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_METPUSubtraction_python,src/JetMETCorrections/METPUSubtraction/python,PYTHON))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoJets)
subdirs_src_RecoJets = src_RecoJets_JetProducers
ALL_PACKAGES += $(patsubst src/%,%,src/TauAnalysis/CandidateTools)
subdirs_src_TauAnalysis_CandidateTools := src_TauAnalysis_CandidateTools_src src_TauAnalysis_CandidateTools_bin
ALL_PACKAGES += $(patsubst src/%,%,src/RecoMET/METAlgorithms)
subdirs_src_RecoMET_METAlgorithms := src_RecoMET_METAlgorithms_src
ALL_COMMONRULES += src_CommonTools_RecoUtils_test
src_CommonTools_RecoUtils_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_RecoUtils_test,src/CommonTools/RecoUtils/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/recipe)
subdirs_src_FinalStateAnalysis_recipe := 
ifeq ($(strip $(slimAndMergeNtuple)),)
slimAndMergeNtuple_files := $(patsubst src/FinalStateAnalysis/NtupleTools/bin/%,%,$(foreach file,slimAndMergeNtuple.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/NtupleTools/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/NtupleTools/bin/$(file). Please fix src/FinalStateAnalysis/NtupleTools/bin/BuildFile.))))
slimAndMergeNtuple := self/src/FinalStateAnalysis/NtupleTools/bin
slimAndMergeNtuple_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/NtupleTools/bin/BuildFile
slimAndMergeNtuple_LOC_USE   := self root boost_program_options PhysicsTools/FWLite PhysicsTools/UtilAlgos FWCore/Utilities FinalStateAnalysis/DataFormats FinalStateAnalysis/NtupleTools
slimAndMergeNtuple_PACKAGE := self/src/FinalStateAnalysis/NtupleTools/bin
ALL_PRODS += slimAndMergeNtuple
slimAndMergeNtuple_INIT_FUNC        += $$(eval $$(call Binary,slimAndMergeNtuple,src/FinalStateAnalysis/NtupleTools/bin,src_FinalStateAnalysis_NtupleTools_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(slimAndMergeNtuple_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,slimAndMergeNtuple,src/FinalStateAnalysis/NtupleTools/bin))
endif
ifeq ($(strip $(analyzeFinalStates)),)
analyzeFinalStates_files := $(patsubst src/FinalStateAnalysis/NtupleTools/bin/%,%,$(foreach file,analyzeFinalStates.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/NtupleTools/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/NtupleTools/bin/$(file). Please fix src/FinalStateAnalysis/NtupleTools/bin/BuildFile.))))
analyzeFinalStates := self/src/FinalStateAnalysis/NtupleTools/bin
analyzeFinalStates_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/NtupleTools/bin/BuildFile
analyzeFinalStates_LOC_USE   := self root boost_program_options PhysicsTools/FWLite PhysicsTools/UtilAlgos FWCore/Utilities FinalStateAnalysis/DataFormats FinalStateAnalysis/NtupleTools
analyzeFinalStates_PACKAGE := self/src/FinalStateAnalysis/NtupleTools/bin
ALL_PRODS += analyzeFinalStates
analyzeFinalStates_INIT_FUNC        += $$(eval $$(call Binary,analyzeFinalStates,src/FinalStateAnalysis/NtupleTools/bin,src_FinalStateAnalysis_NtupleTools_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(analyzeFinalStates_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,analyzeFinalStates,src/FinalStateAnalysis/NtupleTools/bin))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_NtupleTools_bin
src_FinalStateAnalysis_NtupleTools_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_NtupleTools_bin,src/FinalStateAnalysis/NtupleTools/bin,BINARY))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoEgamma)
subdirs_src_RecoEgamma = src_RecoEgamma_EgammaTools
ifeq ($(strip $(test-large-voronoi-area)),)
test-large-voronoi-area_files := $(patsubst src/RecoJets/JetProducers/test/%,%,$(foreach file,test-large-voronoi-area.cc,$(eval xfile:=$(wildcard src/RecoJets/JetProducers/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoJets/JetProducers/test/$(file). Please fix src/RecoJets/JetProducers/test/BuildFile.))))
test-large-voronoi-area := self/src/RecoJets/JetProducers/test
test-large-voronoi-area_TEST_RUNNER_CMD :=  test-large-voronoi-area 
test-large-voronoi-area_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoJets/JetProducers/test/BuildFile
test-large-voronoi-area_LOC_USE   := self RecoJets/JetProducers RecoJets/JetAlgorithms FWCore/Framework DataFormats/JetReco DataFormats/VertexReco Geometry/CaloGeometry Geometry/Records CommonTools/UtilAlgos fastjet
test-large-voronoi-area_PACKAGE := self/src/RecoJets/JetProducers/test
ALL_PRODS += test-large-voronoi-area
test-large-voronoi-area_INIT_FUNC        += $$(eval $$(call Binary,test-large-voronoi-area,src/RecoJets/JetProducers/test,src_RecoJets_JetProducers_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(test-large-voronoi-area_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,test-large-voronoi-area,src/RecoJets/JetProducers/test))
endif
ALL_COMMONRULES += src_RecoJets_JetProducers_test
src_RecoJets_JetProducers_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoJets_JetProducers_test,src/RecoJets/JetProducers/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/wh)
subdirs_src_UWHiggs_wh := 
ifeq ($(strip $(PyPhysicsToolsPatUtils)),)
PyPhysicsToolsPatUtils := self/src/PhysicsTools/PatUtils/python
PyPhysicsToolsPatUtils_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/PhysicsTools/PatUtils/python)
ALL_PRODS += PyPhysicsToolsPatUtils
PyPhysicsToolsPatUtils_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPhysicsToolsPatUtils,src/PhysicsTools/PatUtils/python,src_PhysicsTools_PatUtils_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPhysicsToolsPatUtils,src/PhysicsTools/PatUtils/python))
endif
ALL_COMMONRULES += src_PhysicsTools_PatUtils_python
src_PhysicsTools_PatUtils_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatUtils_python,src/PhysicsTools/PatUtils/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/DataFormats)
subdirs_src_FinalStateAnalysis_DataFormats := src_FinalStateAnalysis_DataFormats_test src_FinalStateAnalysis_DataFormats_src
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/JetMETCorrections)
subdirs_src_JetMETCorrections = src_JetMETCorrections_METPUSubtraction src_JetMETCorrections_Type1MET
ifeq ($(strip $(RecoParticleFlowPFSuperClusterReader)),)
RecoParticleFlowPFSuperClusterReader_files := $(patsubst src/RecoParticleFlow/PFProducer/test/%,%,$(foreach file,PFSuperClusterReader.cc,$(eval xfile:=$(wildcard src/RecoParticleFlow/PFProducer/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoParticleFlow/PFProducer/test/$(file). Please fix src/RecoParticleFlow/PFProducer/test/BuildFile.))))
RecoParticleFlowPFSuperClusterReader_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoParticleFlowPFSuperClusterReader_files))))
RecoParticleFlowPFSuperClusterReader := self/src/RecoParticleFlow/PFProducer/test
RecoParticleFlowPFSuperClusterReader_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoParticleFlow/PFProducer/test/BuildFile
RecoParticleFlowPFSuperClusterReader_LOC_USE   := self DataFormats/Common DataFormats/EgammaReco DataFormats/GsfTrackReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet
RecoParticleFlowPFSuperClusterReader_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoParticleFlowPFSuperClusterReader,RecoParticleFlowPFSuperClusterReader,$(SCRAMSTORENAME_LIB)))
RecoParticleFlowPFSuperClusterReader_PACKAGE := self/src/RecoParticleFlow/PFProducer/test
ALL_PRODS += RecoParticleFlowPFSuperClusterReader
RecoParticleFlowPFSuperClusterReader_INIT_FUNC        += $$(eval $$(call Library,RecoParticleFlowPFSuperClusterReader,src/RecoParticleFlow/PFProducer/test,src_RecoParticleFlow_PFProducer_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoParticleFlowPFSuperClusterReader_files_exts),$(RecoParticleFlowPFSuperClusterReader_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoParticleFlowPFSuperClusterReader,src/RecoParticleFlow/PFProducer/test))
endif
ifeq ($(strip $(RecoParticleFlowPFIsoReader)),)
RecoParticleFlowPFIsoReader_files := $(patsubst src/RecoParticleFlow/PFProducer/test/%,%,$(foreach file,PFIsoReader.cc,$(eval xfile:=$(wildcard src/RecoParticleFlow/PFProducer/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoParticleFlow/PFProducer/test/$(file). Please fix src/RecoParticleFlow/PFProducer/test/BuildFile.))))
RecoParticleFlowPFIsoReader_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoParticleFlowPFIsoReader_files))))
RecoParticleFlowPFIsoReader := self/src/RecoParticleFlow/PFProducer/test
RecoParticleFlowPFIsoReader_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoParticleFlow/PFProducer/test/BuildFile
RecoParticleFlowPFIsoReader_LOC_USE   := self DataFormats/Common DataFormats/EgammaReco DataFormats/GsfTrackReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet
RecoParticleFlowPFIsoReader_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoParticleFlowPFIsoReader,RecoParticleFlowPFIsoReader,$(SCRAMSTORENAME_LIB)))
RecoParticleFlowPFIsoReader_PACKAGE := self/src/RecoParticleFlow/PFProducer/test
ALL_PRODS += RecoParticleFlowPFIsoReader
RecoParticleFlowPFIsoReader_INIT_FUNC        += $$(eval $$(call Library,RecoParticleFlowPFIsoReader,src/RecoParticleFlow/PFProducer/test,src_RecoParticleFlow_PFProducer_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoParticleFlowPFIsoReader_files_exts),$(RecoParticleFlowPFIsoReader_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoParticleFlowPFIsoReader,src/RecoParticleFlow/PFProducer/test))
endif
ALL_COMMONRULES += src_RecoParticleFlow_PFProducer_test
src_RecoParticleFlow_PFProducer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoParticleFlow_PFProducer_test,src/RecoParticleFlow/PFProducer/test,TEST))
ifeq ($(strip $(PyFinalStateAnalysisPlotTools)),)
PyFinalStateAnalysisPlotTools := self/src/FinalStateAnalysis/PlotTools/python
PyFinalStateAnalysisPlotTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/PlotTools/python)
ALL_PRODS += PyFinalStateAnalysisPlotTools
PyFinalStateAnalysisPlotTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisPlotTools,src/FinalStateAnalysis/PlotTools/python,src_FinalStateAnalysis_PlotTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisPlotTools,src/FinalStateAnalysis/PlotTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_PlotTools_python
src_FinalStateAnalysis_PlotTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PlotTools_python,src/FinalStateAnalysis/PlotTools/python,PYTHON))
ifeq ($(strip $(PhysicsToolsPatUtils_plugins)),)
PhysicsToolsPatUtils_plugins_files := $(patsubst src/PhysicsTools/PatUtils/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatUtils/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatUtils/plugins/$(file). Please fix src/PhysicsTools/PatUtils/plugins/BuildFile.))))
PhysicsToolsPatUtils_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(PhysicsToolsPatUtils_plugins_files))))
PhysicsToolsPatUtils_plugins := self/src/PhysicsTools/PatUtils/plugins
PhysicsToolsPatUtils_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatUtils/plugins/BuildFile
PhysicsToolsPatUtils_plugins_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities CommonTools/Utils CondFormats/JetMETObjects DataFormats/Candidate DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/PatCandidates JetMETCorrections/Objects JetMETCorrections/Type1MET RecoMET/METAlgorithms
PhysicsToolsPatUtils_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatUtils_plugins,PhysicsToolsPatUtils_plugins,$(SCRAMSTORENAME_LIB)))
PhysicsToolsPatUtils_plugins_PACKAGE := self/src/PhysicsTools/PatUtils/plugins
ALL_PRODS += PhysicsToolsPatUtils_plugins
PhysicsToolsPatUtils_plugins_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatUtils_plugins,src/PhysicsTools/PatUtils/plugins,src_PhysicsTools_PatUtils_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(PhysicsToolsPatUtils_plugins_files_exts),$(PhysicsToolsPatUtils_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatUtils_plugins,src/PhysicsTools/PatUtils/plugins))
endif
ALL_COMMONRULES += src_PhysicsTools_PatUtils_plugins
src_PhysicsTools_PatUtils_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatUtils_plugins,src/PhysicsTools/PatUtils/plugins,PLUGINS))
ifeq ($(strip $(PFPUAssoMapPlugins)),)
PFPUAssoMapPlugins_files := $(patsubst src/CommonTools/RecoUtils/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/CommonTools/RecoUtils/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/CommonTools/RecoUtils/plugins/$(file). Please fix src/CommonTools/RecoUtils/plugins/BuildFile.))))
PFPUAssoMapPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(PFPUAssoMapPlugins_files))))
PFPUAssoMapPlugins := self/src/CommonTools/RecoUtils/plugins
PFPUAssoMapPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/CommonTools/RecoUtils/plugins/BuildFile
PFPUAssoMapPlugins_LOC_USE   := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry CommonTools/UtilAlgos CommonTools/RecoUtils DataFormats/BeamSpot DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/EgammaCandidates DataFormats/RecoCandidate DataFormats/ParticleFlowReco DQMServices/Core MagneticField/Records MagneticField/Engine SimDataFormats/TrackingAnalysis SimDataFormats/PileupSummaryInfo SimDataFormats/GeneratorProducts SimTracker/TrackAssociation SimTracker/Records TrackingTools/TransientTrack TrackingTools/IPTools
PFPUAssoMapPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PFPUAssoMapPlugins,PFPUAssoMapPlugins,$(SCRAMSTORENAME_LIB)))
PFPUAssoMapPlugins_PACKAGE := self/src/CommonTools/RecoUtils/plugins
ALL_PRODS += PFPUAssoMapPlugins
PFPUAssoMapPlugins_INIT_FUNC        += $$(eval $$(call Library,PFPUAssoMapPlugins,src/CommonTools/RecoUtils/plugins,src_CommonTools_RecoUtils_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(PFPUAssoMapPlugins_files_exts),$(PFPUAssoMapPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,PFPUAssoMapPlugins,src/CommonTools/RecoUtils/plugins))
endif
ALL_COMMONRULES += src_CommonTools_RecoUtils_plugins
src_CommonTools_RecoUtils_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_RecoUtils_plugins,src/CommonTools/RecoUtils/plugins,PLUGINS))
ifeq ($(strip $(PyRecoMETMETProducers)),)
PyRecoMETMETProducers := self/src/RecoMET/METProducers/python
PyRecoMETMETProducers_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoMET/METProducers/python)
ALL_PRODS += PyRecoMETMETProducers
PyRecoMETMETProducers_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoMETMETProducers,src/RecoMET/METProducers/python,src_RecoMET_METProducers_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoMETMETProducers,src/RecoMET/METProducers/python))
endif
ALL_COMMONRULES += src_RecoMET_METProducers_python
src_RecoMET_METProducers_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoMET_METProducers_python,src/RecoMET/METProducers/python,PYTHON))
ALL_COMMONRULES += src_RecoLuminosity_LumiDB_plugins
src_RecoLuminosity_LumiDB_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoLuminosity_LumiDB_plugins,src/RecoLuminosity/LumiDB/plugins,PLUGINS))
ifeq ($(strip $(PyFinalStateAnalysisRecoTools)),)
PyFinalStateAnalysisRecoTools := self/src/FinalStateAnalysis/RecoTools/python
PyFinalStateAnalysisRecoTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/RecoTools/python)
ALL_PRODS += PyFinalStateAnalysisRecoTools
PyFinalStateAnalysisRecoTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisRecoTools,src/FinalStateAnalysis/RecoTools/python,src_FinalStateAnalysis_RecoTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisRecoTools,src/FinalStateAnalysis/RecoTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_RecoTools_python
src_FinalStateAnalysis_RecoTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_RecoTools_python,src/FinalStateAnalysis/RecoTools/python,PYTHON))
ifeq ($(strip $(PyFinalStateAnalysisUtilities)),)
PyFinalStateAnalysisUtilities := self/src/FinalStateAnalysis/Utilities/python
PyFinalStateAnalysisUtilities_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/Utilities/python)
ALL_PRODS += PyFinalStateAnalysisUtilities
PyFinalStateAnalysisUtilities_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisUtilities,src/FinalStateAnalysis/Utilities/python,src_FinalStateAnalysis_Utilities_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisUtilities,src/FinalStateAnalysis/Utilities/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_Utilities_python
src_FinalStateAnalysis_Utilities_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_Utilities_python,src/FinalStateAnalysis/Utilities/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoTauTag/Configuration)
subdirs_src_RecoTauTag_Configuration := src_RecoTauTag_Configuration_python
ALL_PACKAGES += $(patsubst src/%,%,src/RecoJets/JetProducers)
subdirs_src_RecoJets_JetProducers := src_RecoJets_JetProducers_test src_RecoJets_JetProducers_python src_RecoJets_JetProducers_src src_RecoJets_JetProducers_plugins
ALL_COMMONRULES += src_FinalStateAnalysis_RecoTools_test
src_FinalStateAnalysis_RecoTools_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_RecoTools_test,src/FinalStateAnalysis/RecoTools/test,TEST))
ifeq ($(strip $(PyFinalStateAnalysisNtupleTools)),)
PyFinalStateAnalysisNtupleTools := self/src/FinalStateAnalysis/NtupleTools/python
PyFinalStateAnalysisNtupleTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/NtupleTools/python)
ALL_PRODS += PyFinalStateAnalysisNtupleTools
PyFinalStateAnalysisNtupleTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisNtupleTools,src/FinalStateAnalysis/NtupleTools/python,src_FinalStateAnalysis_NtupleTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisNtupleTools,src/FinalStateAnalysis/NtupleTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_NtupleTools_python
src_FinalStateAnalysis_NtupleTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_NtupleTools_python,src/FinalStateAnalysis/NtupleTools/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/HiggsAnalysis/CombinedLimit)
subdirs_src_HiggsAnalysis_CombinedLimit := src_HiggsAnalysis_CombinedLimit_bin src_HiggsAnalysis_CombinedLimit_test src_HiggsAnalysis_CombinedLimit_python src_HiggsAnalysis_CombinedLimit_src src_HiggsAnalysis_CombinedLimit_scripts
ifeq ($(strip $(FinalStateAnalysisPatToolsPlugins)),)
FinalStateAnalysisPatToolsPlugins_files := $(patsubst src/FinalStateAnalysis/PatTools/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/PatTools/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/PatTools/plugins/$(file). Please fix src/FinalStateAnalysis/PatTools/plugins/BuildFile.))))
FinalStateAnalysisPatToolsPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(FinalStateAnalysisPatToolsPlugins_files))))
FinalStateAnalysisPatToolsPlugins := self/src/FinalStateAnalysis/PatTools/plugins
FinalStateAnalysisPatToolsPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/PatTools/plugins/BuildFile
FinalStateAnalysisPatToolsPlugins_LOC_USE   := self DataFormats/Candidate DataFormats/Common DataFormats/PatCandidates FinalStateAnalysis/DataFormats FinalStateAnalysis/PatTools FinalStateAnalysis/NtupleTools RecoTauTag/RecoTau CommonTools/Utils CommonTools/UtilAlgos PhysicsTools/Utilities PhysicsTools/PatAlgos ZZMatrixElement/MELA ZZMatrixElement/MEMCalculators CondFormats/JetMETObjects JetMETCorrections/Objects MuonAnalysis/MomentumScaleCalibration RecoVertex/KinematicFitPrimitives RecoEgamma/EgammaTools
FinalStateAnalysisPatToolsPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,FinalStateAnalysisPatToolsPlugins,FinalStateAnalysisPatToolsPlugins,$(SCRAMSTORENAME_LIB)))
FinalStateAnalysisPatToolsPlugins_PACKAGE := self/src/FinalStateAnalysis/PatTools/plugins
ALL_PRODS += FinalStateAnalysisPatToolsPlugins
FinalStateAnalysisPatToolsPlugins_INIT_FUNC        += $$(eval $$(call Library,FinalStateAnalysisPatToolsPlugins,src/FinalStateAnalysis/PatTools/plugins,src_FinalStateAnalysis_PatTools_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(FinalStateAnalysisPatToolsPlugins_files_exts),$(FinalStateAnalysisPatToolsPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,FinalStateAnalysisPatToolsPlugins,src/FinalStateAnalysis/PatTools/plugins))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_PatTools_plugins
src_FinalStateAnalysis_PatTools_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PatTools_plugins,src/FinalStateAnalysis/PatTools/plugins,PLUGINS))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/EgammaAnalysis)
subdirs_src_EgammaAnalysis = src_EgammaAnalysis_ElectronTools
ifeq ($(strip $(PyHiggsAnalysisHiggsToTauTau)),)
PyHiggsAnalysisHiggsToTauTau := self/src/HiggsAnalysis/HiggsToTauTau/python
PyHiggsAnalysisHiggsToTauTau_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HiggsAnalysis/HiggsToTauTau/python)
ALL_PRODS += PyHiggsAnalysisHiggsToTauTau
PyHiggsAnalysisHiggsToTauTau_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHiggsAnalysisHiggsToTauTau,src/HiggsAnalysis/HiggsToTauTau/python,src_HiggsAnalysis_HiggsToTauTau_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHiggsAnalysisHiggsToTauTau,src/HiggsAnalysis/HiggsToTauTau/python))
endif
ALL_COMMONRULES += src_HiggsAnalysis_HiggsToTauTau_python
src_HiggsAnalysis_HiggsToTauTau_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_HiggsToTauTau_python,src/HiggsAnalysis/HiggsToTauTau/python,PYTHON))
ifeq ($(strip $(TestRecoTauTagCombinatoricGenerator)),)
TestRecoTauTagCombinatoricGenerator_files := $(patsubst src/RecoTauTag/RecoTau/test/%,%,$(foreach file,CombinatoricGenerator_t.cppunit.cc,$(eval xfile:=$(wildcard src/RecoTauTag/RecoTau/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoTauTag/RecoTau/test/$(file). Please fix src/RecoTauTag/RecoTau/test/BuildFile.))))
TestRecoTauTagCombinatoricGenerator := self/src/RecoTauTag/RecoTau/test
TestRecoTauTagCombinatoricGenerator_TEST_RUNNER_CMD :=  TestRecoTauTagCombinatoricGenerator 
TestRecoTauTagCombinatoricGenerator_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoTauTag/RecoTau/test/BuildFile
TestRecoTauTagCombinatoricGenerator_LOC_USE   := self RecoTauTag/RecoTau cppunit
TestRecoTauTagCombinatoricGenerator_PACKAGE := self/src/RecoTauTag/RecoTau/test
ALL_PRODS += TestRecoTauTagCombinatoricGenerator
TestRecoTauTagCombinatoricGenerator_INIT_FUNC        += $$(eval $$(call Binary,TestRecoTauTagCombinatoricGenerator,src/RecoTauTag/RecoTau/test,src_RecoTauTag_RecoTau_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(TestRecoTauTagCombinatoricGenerator_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestRecoTauTagCombinatoricGenerator,src/RecoTauTag/RecoTau/test))
endif
ALL_COMMONRULES += src_RecoTauTag_RecoTau_test
src_RecoTauTag_RecoTau_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoTauTag_RecoTau_test,src/RecoTauTag/RecoTau/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/NtupleTools)
subdirs_src_FinalStateAnalysis_NtupleTools := src_FinalStateAnalysis_NtupleTools_bin src_FinalStateAnalysis_NtupleTools_python src_FinalStateAnalysis_NtupleTools_src src_FinalStateAnalysis_NtupleTools_scripts src_FinalStateAnalysis_NtupleTools_test
ALL_PACKAGES += $(patsubst src/%,%,src/RecoTauTag/RecoTau)
subdirs_src_RecoTauTag_RecoTau := src_RecoTauTag_RecoTau_test src_RecoTauTag_RecoTau_plugins src_RecoTauTag_RecoTau_src src_RecoTauTag_RecoTau_python
ifeq ($(strip $(EgammaAnalysisElectronToolsPlugins)),)
EgammaAnalysisElectronToolsPlugins_files := $(patsubst src/EgammaAnalysis/ElectronTools/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/EgammaAnalysis/ElectronTools/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/EgammaAnalysis/ElectronTools/plugins/$(file). Please fix src/EgammaAnalysis/ElectronTools/plugins/BuildFile.))))
EgammaAnalysisElectronToolsPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(EgammaAnalysisElectronToolsPlugins_files))))
EgammaAnalysisElectronToolsPlugins := self/src/EgammaAnalysis/ElectronTools/plugins
EgammaAnalysisElectronToolsPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/EgammaAnalysis/ElectronTools/plugins/BuildFile
EgammaAnalysisElectronToolsPlugins_LOC_USE   := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/PatCandidates DataFormats/Common DataFormats/VertexReco PhysicsTools/UtilAlgos FWCore/ServiceRegistry Geometry/CaloTopology Geometry/Records EgammaAnalysis/ElectronTools RecoEcal/EgammaCoreTools
EgammaAnalysisElectronToolsPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,EgammaAnalysisElectronToolsPlugins,EgammaAnalysisElectronToolsPlugins,$(SCRAMSTORENAME_LIB)))
EgammaAnalysisElectronToolsPlugins_PACKAGE := self/src/EgammaAnalysis/ElectronTools/plugins
ALL_PRODS += EgammaAnalysisElectronToolsPlugins
EgammaAnalysisElectronToolsPlugins_INIT_FUNC        += $$(eval $$(call Library,EgammaAnalysisElectronToolsPlugins,src/EgammaAnalysis/ElectronTools/plugins,src_EgammaAnalysis_ElectronTools_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(EgammaAnalysisElectronToolsPlugins_files_exts),$(EgammaAnalysisElectronToolsPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,EgammaAnalysisElectronToolsPlugins,src/EgammaAnalysis/ElectronTools/plugins))
endif
ALL_COMMONRULES += src_EgammaAnalysis_ElectronTools_plugins
src_EgammaAnalysis_ElectronTools_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EgammaAnalysis_ElectronTools_plugins,src/EgammaAnalysis/ElectronTools/plugins,PLUGINS))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/FWCore)
subdirs_src_FWCore = src_FWCore_GuiBrowsers
ifeq ($(strip $(feyn-higgs-mssm)),)
feyn-higgs-mssm_files := $(patsubst src/HiggsAnalysis/HiggsToTauTau/bin/%,%,$(foreach file,feyn-higgs-mssm.cc,$(eval xfile:=$(wildcard src/HiggsAnalysis/HiggsToTauTau/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/HiggsAnalysis/HiggsToTauTau/bin/$(file). Please fix src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile.))))
feyn-higgs-mssm := self/src/HiggsAnalysis/HiggsToTauTau/bin
feyn-higgs-mssm_BuildFile    := $(WORKINGDIR)/cache/bf/src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile
feyn-higgs-mssm_LOC_USE   := self FWCore/Utilities DataFormats/FWLite FWCore/ParameterSet FWCore/MessageLogger FWCore/PythonParameterSet HiggsAnalysis/HiggsToTauTau rootcintex root
feyn-higgs-mssm_PACKAGE := self/src/HiggsAnalysis/HiggsToTauTau/bin
ALL_PRODS += feyn-higgs-mssm
feyn-higgs-mssm_INIT_FUNC        += $$(eval $$(call Binary,feyn-higgs-mssm,src/HiggsAnalysis/HiggsToTauTau/bin,src_HiggsAnalysis_HiggsToTauTau_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(feyn-higgs-mssm_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,feyn-higgs-mssm,src/HiggsAnalysis/HiggsToTauTau/bin))
endif
ifeq ($(strip $(feyn-higgs-sm)),)
feyn-higgs-sm_files := $(patsubst src/HiggsAnalysis/HiggsToTauTau/bin/%,%,$(foreach file,feyn-higgs-sm.cc,$(eval xfile:=$(wildcard src/HiggsAnalysis/HiggsToTauTau/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/HiggsAnalysis/HiggsToTauTau/bin/$(file). Please fix src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile.))))
feyn-higgs-sm := self/src/HiggsAnalysis/HiggsToTauTau/bin
feyn-higgs-sm_BuildFile    := $(WORKINGDIR)/cache/bf/src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile
feyn-higgs-sm_LOC_USE   := self FWCore/Utilities DataFormats/FWLite FWCore/ParameterSet FWCore/MessageLogger FWCore/PythonParameterSet HiggsAnalysis/HiggsToTauTau rootcintex root
feyn-higgs-sm_PACKAGE := self/src/HiggsAnalysis/HiggsToTauTau/bin
ALL_PRODS += feyn-higgs-sm
feyn-higgs-sm_INIT_FUNC        += $$(eval $$(call Binary,feyn-higgs-sm,src/HiggsAnalysis/HiggsToTauTau/bin,src_HiggsAnalysis_HiggsToTauTau_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(feyn-higgs-sm_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,feyn-higgs-sm,src/HiggsAnalysis/HiggsToTauTau/bin))
endif
ifeq ($(strip $(plot)),)
plot_files := $(patsubst src/HiggsAnalysis/HiggsToTauTau/bin/%,%,$(foreach file,plot.cc,$(eval xfile:=$(wildcard src/HiggsAnalysis/HiggsToTauTau/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/HiggsAnalysis/HiggsToTauTau/bin/$(file). Please fix src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile.))))
plot := self/src/HiggsAnalysis/HiggsToTauTau/bin
plot_BuildFile    := $(WORKINGDIR)/cache/bf/src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile
plot_LOC_USE   := self FWCore/Utilities DataFormats/FWLite FWCore/ParameterSet FWCore/MessageLogger FWCore/PythonParameterSet HiggsAnalysis/HiggsToTauTau rootcintex root
plot_PACKAGE := self/src/HiggsAnalysis/HiggsToTauTau/bin
ALL_PRODS += plot
plot_INIT_FUNC        += $$(eval $$(call Binary,plot,src/HiggsAnalysis/HiggsToTauTau/bin,src_HiggsAnalysis_HiggsToTauTau_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(plot_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,plot,src/HiggsAnalysis/HiggsToTauTau/bin))
endif
ifeq ($(strip $(xsec-sm)),)
xsec-sm_files := $(patsubst src/HiggsAnalysis/HiggsToTauTau/bin/%,%,$(foreach file,xsec-sm.cc,$(eval xfile:=$(wildcard src/HiggsAnalysis/HiggsToTauTau/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/HiggsAnalysis/HiggsToTauTau/bin/$(file). Please fix src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile.))))
xsec-sm := self/src/HiggsAnalysis/HiggsToTauTau/bin
xsec-sm_BuildFile    := $(WORKINGDIR)/cache/bf/src/HiggsAnalysis/HiggsToTauTau/bin/BuildFile
xsec-sm_LOC_USE   := self FWCore/Utilities DataFormats/FWLite FWCore/ParameterSet FWCore/MessageLogger FWCore/PythonParameterSet HiggsAnalysis/HiggsToTauTau rootcintex root
xsec-sm_PACKAGE := self/src/HiggsAnalysis/HiggsToTauTau/bin
ALL_PRODS += xsec-sm
xsec-sm_INIT_FUNC        += $$(eval $$(call Binary,xsec-sm,src/HiggsAnalysis/HiggsToTauTau/bin,src_HiggsAnalysis_HiggsToTauTau_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(xsec-sm_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,xsec-sm,src/HiggsAnalysis/HiggsToTauTau/bin))
endif
ALL_COMMONRULES += src_HiggsAnalysis_HiggsToTauTau_bin
src_HiggsAnalysis_HiggsToTauTau_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_HiggsToTauTau_bin,src/HiggsAnalysis/HiggsToTauTau/bin,BINARY))
ifeq ($(strip $(JetMETCorrectionsMETPUSubtraction_plugins)),)
JetMETCorrectionsMETPUSubtraction_plugins_files := $(patsubst src/JetMETCorrections/METPUSubtraction/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/JetMETCorrections/METPUSubtraction/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/JetMETCorrections/METPUSubtraction/plugins/$(file). Please fix src/JetMETCorrections/METPUSubtraction/plugins/BuildFile.))))
JetMETCorrectionsMETPUSubtraction_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(JetMETCorrectionsMETPUSubtraction_plugins_files))))
JetMETCorrectionsMETPUSubtraction_plugins := self/src/JetMETCorrections/METPUSubtraction/plugins
JetMETCorrectionsMETPUSubtraction_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/JetMETCorrections/METPUSubtraction/plugins/BuildFile
JetMETCorrectionsMETPUSubtraction_plugins_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities CommonTools/Utils DataFormats/Candidate DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/PatCandidates DataFormats/TauReco DataFormats/VertexReco JetMETCorrections/Objects JetMETCorrections/METPUSubtraction RecoJets/JetProducers
JetMETCorrectionsMETPUSubtraction_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,JetMETCorrectionsMETPUSubtraction_plugins,JetMETCorrectionsMETPUSubtraction_plugins,$(SCRAMSTORENAME_LIB)))
JetMETCorrectionsMETPUSubtraction_plugins_PACKAGE := self/src/JetMETCorrections/METPUSubtraction/plugins
ALL_PRODS += JetMETCorrectionsMETPUSubtraction_plugins
JetMETCorrectionsMETPUSubtraction_plugins_INIT_FUNC        += $$(eval $$(call Library,JetMETCorrectionsMETPUSubtraction_plugins,src/JetMETCorrections/METPUSubtraction/plugins,src_JetMETCorrections_METPUSubtraction_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(JetMETCorrectionsMETPUSubtraction_plugins_files_exts),$(JetMETCorrectionsMETPUSubtraction_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,JetMETCorrectionsMETPUSubtraction_plugins,src/JetMETCorrections/METPUSubtraction/plugins))
endif
ALL_COMMONRULES += src_JetMETCorrections_METPUSubtraction_plugins
src_JetMETCorrections_METPUSubtraction_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_METPUSubtraction_plugins,src/JetMETCorrections/METPUSubtraction/plugins,PLUGINS))
ifeq ($(strip $(RecoEgammaEgammaToolsPlugins)),)
RecoEgammaEgammaToolsPlugins_files := $(patsubst src/RecoEgamma/EgammaTools/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoEgamma/EgammaTools/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoEgamma/EgammaTools/plugins/$(file). Please fix src/RecoEgamma/EgammaTools/plugins/BuildFile.))))
RecoEgammaEgammaToolsPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoEgammaEgammaToolsPlugins_files))))
RecoEgammaEgammaToolsPlugins := self/src/RecoEgamma/EgammaTools/plugins
RecoEgammaEgammaToolsPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoEgamma/EgammaTools/plugins/BuildFile
RecoEgammaEgammaToolsPlugins_LOC_USE   := self FWCore/Framework PhysicsTools/MVAComputer PhysicsTools/MVATrainer CondCore/PluginSystem CondCore/DBOutputService CondFormats/DataRecord CondFormats/EgammaObjects DataFormats/EgammaCandidates RecoEgamma/EgammaTools
RecoEgammaEgammaToolsPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoEgammaEgammaToolsPlugins,RecoEgammaEgammaToolsPlugins,$(SCRAMSTORENAME_LIB)))
RecoEgammaEgammaToolsPlugins_PACKAGE := self/src/RecoEgamma/EgammaTools/plugins
ALL_PRODS += RecoEgammaEgammaToolsPlugins
RecoEgammaEgammaToolsPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoEgammaEgammaToolsPlugins,src/RecoEgamma/EgammaTools/plugins,src_RecoEgamma_EgammaTools_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoEgammaEgammaToolsPlugins_files_exts),$(RecoEgammaEgammaToolsPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoEgammaEgammaToolsPlugins,src/RecoEgamma/EgammaTools/plugins))
endif
ALL_COMMONRULES += src_RecoEgamma_EgammaTools_plugins
src_RecoEgamma_EgammaTools_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoEgamma_EgammaTools_plugins,src/RecoEgamma/EgammaTools/plugins,PLUGINS))
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/HLTReco)
subdirs_src_DataFormats_HLTReco := src_DataFormats_HLTReco_test src_DataFormats_HLTReco_src
ifeq ($(strip $(testDataFormatsHLTReco)),)
testDataFormatsHLTReco_files := $(patsubst src/DataFormats/HLTReco/test/%,%,$(foreach file,testHLTResult.cc testRunner.cpp,$(eval xfile:=$(wildcard src/DataFormats/HLTReco/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/DataFormats/HLTReco/test/$(file). Please fix src/DataFormats/HLTReco/test/BuildFile.))))
testDataFormatsHLTReco := self/src/DataFormats/HLTReco/test
testDataFormatsHLTReco_TEST_RUNNER_CMD :=  testDataFormatsHLTReco 
testDataFormatsHLTReco_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/HLTReco/test/BuildFile
testDataFormatsHLTReco_LOC_USE   := self DataFormats/HLTReco cppunit
testDataFormatsHLTReco_PACKAGE := self/src/DataFormats/HLTReco/test
ALL_PRODS += testDataFormatsHLTReco
testDataFormatsHLTReco_INIT_FUNC        += $$(eval $$(call Binary,testDataFormatsHLTReco,src/DataFormats/HLTReco/test,src_DataFormats_HLTReco_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(testDataFormatsHLTReco_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,testDataFormatsHLTReco,src/DataFormats/HLTReco/test))
endif
ALL_COMMONRULES += src_DataFormats_HLTReco_test
src_DataFormats_HLTReco_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DataFormats_HLTReco_test,src/DataFormats/HLTReco/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/PhysicsTools/PatUtils)
subdirs_src_PhysicsTools_PatUtils := src_PhysicsTools_PatUtils_plugins src_PhysicsTools_PatUtils_python src_PhysicsTools_PatUtils_src
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/Utilities)
subdirs_src_FinalStateAnalysis_Utilities := src_FinalStateAnalysis_Utilities_python src_FinalStateAnalysis_Utilities_scripts src_FinalStateAnalysis_Utilities_bin src_FinalStateAnalysis_Utilities_src src_FinalStateAnalysis_Utilities_test
ALL_PACKAGES += $(patsubst src/%,%,src/RecoLuminosity/LumiDB)
subdirs_src_RecoLuminosity_LumiDB := src_RecoLuminosity_LumiDB_scripts src_RecoLuminosity_LumiDB_src src_RecoLuminosity_LumiDB_plugins src_RecoLuminosity_LumiDB_python src_RecoLuminosity_LumiDB_test
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/hzg)
subdirs_src_UWHiggs_hzg := src_UWHiggs_hzg_python src_UWHiggs_hzg_test src_UWHiggs_hzg_src src_UWHiggs_hzg_scripts
ifeq ($(strip $(PyFinalStateAnalysisStatTools)),)
PyFinalStateAnalysisStatTools := self/src/FinalStateAnalysis/StatTools/python
PyFinalStateAnalysisStatTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/StatTools/python)
ALL_PRODS += PyFinalStateAnalysisStatTools
PyFinalStateAnalysisStatTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisStatTools,src/FinalStateAnalysis/StatTools/python,src_FinalStateAnalysis_StatTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisStatTools,src/FinalStateAnalysis/StatTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_StatTools_python
src_FinalStateAnalysis_StatTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_StatTools_python,src/FinalStateAnalysis/StatTools/python,PYTHON))
src_UWHiggs_hzg_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/UWHiggs/hzg/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_UWHiggs_hzg_scripts,src/UWHiggs/hzg/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_COMMONRULES += src_RecoVertex_AdaptiveVertexFinder_test
src_RecoVertex_AdaptiveVertexFinder_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoVertex_AdaptiveVertexFinder_test,src/RecoVertex/AdaptiveVertexFinder/test,TEST))
ALL_COMMONRULES += src_RecoMET_METProducers_test
src_RecoMET_METProducers_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoMET_METProducers_test,src/RecoMET/METProducers/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/DataAlgos)
subdirs_src_FinalStateAnalysis_DataAlgos := src_FinalStateAnalysis_DataAlgos_src src_FinalStateAnalysis_DataAlgos_test
ifeq ($(strip $(RecoTauTagRecoTauPlugins)),)
RecoTauTagRecoTauPlugins_files := $(patsubst src/RecoTauTag/RecoTau/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoTauTag/RecoTau/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoTauTag/RecoTau/plugins/$(file). Please fix src/RecoTauTag/RecoTau/plugins/BuildFile.))))
RecoTauTagRecoTauPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoTauTagRecoTauPlugins_files))))
RecoTauTagRecoTauPlugins := self/src/RecoTauTag/RecoTau/plugins
RecoTauTagRecoTauPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoTauTag/RecoTau/plugins/BuildFile
RecoTauTagRecoTauPlugins_LOC_USE   := self TrackingTools/Records RecoVertex/KalmanVertexFit CommonTools/CandUtils DataFormats/Candidate DataFormats/MuonReco TrackingTools/TransientTrack RecoVertex/VertexPrimitives PhysicsTools/IsolationUtils PhysicsTools/MVAComputer PhysicsTools/MVATrainer FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/TauReco DataFormats/WrappedStdDictionaries CommonTools/UtilAlgos CommonTools/CandAlgos PhysicsTools/HepMCCandAlgos RecoTauTag/TauTagTools RecoTauTag/RecoTau DataFormats/JetReco DataFormats/ParticleFlowReco RecoBTag/SecondaryVertex DataFormats/VertexReco CondFormats/EgammaObjects CondFormats/DataRecord CondFormats/EcalObjects Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records root
RecoTauTagRecoTauPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoTauTagRecoTauPlugins,RecoTauTagRecoTauPlugins,$(SCRAMSTORENAME_LIB)))
RecoTauTagRecoTauPlugins_PACKAGE := self/src/RecoTauTag/RecoTau/plugins
ALL_PRODS += RecoTauTagRecoTauPlugins
RecoTauTagRecoTauPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoTauTagRecoTauPlugins,src/RecoTauTag/RecoTau/plugins,src_RecoTauTag_RecoTau_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoTauTagRecoTauPlugins_files_exts),$(RecoTauTagRecoTauPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoTauTagRecoTauPlugins,src/RecoTauTag/RecoTau/plugins))
endif
ALL_COMMONRULES += src_RecoTauTag_RecoTau_plugins
src_RecoTauTag_RecoTau_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoTauTag_RecoTau_plugins,src/RecoTauTag/RecoTau/plugins,PLUGINS))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/HZZ4L_Combination)
subdirs_src_HZZ4L_Combination = src_HZZ4L_Combination_CombinationPy
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/ZZMatrixElement)
subdirs_src_ZZMatrixElement = src_ZZMatrixElement_MEMCalculators src_ZZMatrixElement_MEKD src_ZZMatrixElement_MELA
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoParticleFlow)
subdirs_src_RecoParticleFlow = src_RecoParticleFlow_PFProducer
ifeq ($(strip $(PyHiggsAnalysisCombinedLimit)),)
PyHiggsAnalysisCombinedLimit := self/src/HiggsAnalysis/CombinedLimit/python
PyHiggsAnalysisCombinedLimit_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HiggsAnalysis/CombinedLimit/python)
ALL_PRODS += PyHiggsAnalysisCombinedLimit
PyHiggsAnalysisCombinedLimit_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHiggsAnalysisCombinedLimit,src/HiggsAnalysis/CombinedLimit/python,src_HiggsAnalysis_CombinedLimit_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHiggsAnalysisCombinedLimit,src/HiggsAnalysis/CombinedLimit/python))
endif
ALL_COMMONRULES += src_HiggsAnalysis_CombinedLimit_python
src_HiggsAnalysis_CombinedLimit_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_CombinedLimit_python,src/HiggsAnalysis/CombinedLimit/python,PYTHON))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Higgs)
subdirs_src_Higgs = src_Higgs_Higgs_CS_and_Width
ifeq ($(strip $(PyRecoVertexAdaptiveVertexFinder)),)
PyRecoVertexAdaptiveVertexFinder := self/src/RecoVertex/AdaptiveVertexFinder/python
PyRecoVertexAdaptiveVertexFinder_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoVertex/AdaptiveVertexFinder/python)
ALL_PRODS += PyRecoVertexAdaptiveVertexFinder
PyRecoVertexAdaptiveVertexFinder_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoVertexAdaptiveVertexFinder,src/RecoVertex/AdaptiveVertexFinder/python,src_RecoVertex_AdaptiveVertexFinder_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoVertexAdaptiveVertexFinder,src/RecoVertex/AdaptiveVertexFinder/python))
endif
ALL_COMMONRULES += src_RecoVertex_AdaptiveVertexFinder_python
src_RecoVertex_AdaptiveVertexFinder_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoVertex_AdaptiveVertexFinder_python,src/RecoVertex/AdaptiveVertexFinder/python,PYTHON))
ifeq ($(strip $(PyRecoTauTagRecoTau)),)
PyRecoTauTagRecoTau := self/src/RecoTauTag/RecoTau/python
PyRecoTauTagRecoTau_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoTauTag/RecoTau/python)
ALL_PRODS += PyRecoTauTagRecoTau
PyRecoTauTagRecoTau_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoTauTagRecoTau,src/RecoTauTag/RecoTau/python,src_RecoTauTag_RecoTau_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoTauTagRecoTau,src/RecoTauTag/RecoTau/python))
endif
ALL_COMMONRULES += src_RecoTauTag_RecoTau_python
src_RecoTauTag_RecoTau_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoTauTag_RecoTau_python,src/RecoTauTag/RecoTau/python,PYTHON))
ifeq ($(strip $(RecoBTagSecondaryVertexESProducers)),)
RecoBTagSecondaryVertexESProducers_files := $(patsubst src/RecoBTag/SecondaryVertex/plugins/%,%,$(foreach file,JetTagESProducers.cc,$(eval xfile:=$(wildcard src/RecoBTag/SecondaryVertex/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoBTag/SecondaryVertex/plugins/$(file). Please fix src/RecoBTag/SecondaryVertex/plugins/BuildFile.))))
RecoBTagSecondaryVertexESProducers_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoBTagSecondaryVertexESProducers_files))))
RecoBTagSecondaryVertexESProducers := self/src/RecoBTag/SecondaryVertex/plugins
RecoBTagSecondaryVertexESProducers_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoBTag/SecondaryVertex/plugins/BuildFile
RecoBTagSecondaryVertexESProducers_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/GeometryCommonDetAlgo DataFormats/TrackReco DataFormats/VertexReco DataFormats/BTauReco RecoBTag/SecondaryVertex boost RecoBTau/JetTagComputer
RecoBTagSecondaryVertexESProducers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoBTagSecondaryVertexESProducers,RecoBTagSecondaryVertexESProducers,$(SCRAMSTORENAME_LIB)))
RecoBTagSecondaryVertexESProducers_PACKAGE := self/src/RecoBTag/SecondaryVertex/plugins
ALL_PRODS += RecoBTagSecondaryVertexESProducers
RecoBTagSecondaryVertexESProducers_INIT_FUNC        += $$(eval $$(call Library,RecoBTagSecondaryVertexESProducers,src/RecoBTag/SecondaryVertex/plugins,src_RecoBTag_SecondaryVertex_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoBTagSecondaryVertexESProducers_files_exts),$(RecoBTagSecondaryVertexESProducers_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoBTagSecondaryVertexESProducers,src/RecoBTag/SecondaryVertex/plugins))
endif
ifeq ($(strip $(RecoBTagSecondaryVertexProducer)),)
RecoBTagSecondaryVertexProducer_files := $(patsubst src/RecoBTag/SecondaryVertex/plugins/%,%,$(foreach file,SecondaryVertexProducer.cc,$(eval xfile:=$(wildcard src/RecoBTag/SecondaryVertex/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoBTag/SecondaryVertex/plugins/$(file). Please fix src/RecoBTag/SecondaryVertex/plugins/BuildFile.))))
RecoBTagSecondaryVertexProducer_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoBTagSecondaryVertexProducer_files))))
RecoBTagSecondaryVertexProducer := self/src/RecoBTag/SecondaryVertex/plugins
RecoBTagSecondaryVertexProducer_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoBTag/SecondaryVertex/plugins/BuildFile
RecoBTagSecondaryVertexProducer_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/GeometryCommonDetAlgo DataFormats/TrackReco DataFormats/VertexReco DataFormats/BTauReco RecoBTag/SecondaryVertex boost DataFormats/BeamSpot TrackingTools/Records TrackingTools/TransientTrack RecoVertex/ConfigurableVertexReco RecoVertex/GhostTrackFitter
RecoBTagSecondaryVertexProducer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoBTagSecondaryVertexProducer,RecoBTagSecondaryVertexProducer,$(SCRAMSTORENAME_LIB)))
RecoBTagSecondaryVertexProducer_PACKAGE := self/src/RecoBTag/SecondaryVertex/plugins
ALL_PRODS += RecoBTagSecondaryVertexProducer
RecoBTagSecondaryVertexProducer_INIT_FUNC        += $$(eval $$(call Library,RecoBTagSecondaryVertexProducer,src/RecoBTag/SecondaryVertex/plugins,src_RecoBTag_SecondaryVertex_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoBTagSecondaryVertexProducer_files_exts),$(RecoBTagSecondaryVertexProducer_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoBTagSecondaryVertexProducer,src/RecoBTag/SecondaryVertex/plugins))
endif
ALL_COMMONRULES += src_RecoBTag_SecondaryVertex_plugins
src_RecoBTag_SecondaryVertex_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoBTag_SecondaryVertex_plugins,src/RecoBTag/SecondaryVertex/plugins,PLUGINS))
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/h2tau)
subdirs_src_UWHiggs_h2tau := 
ALL_PACKAGES += $(patsubst src/%,%,src/JetMETCorrections/METPUSubtraction)
subdirs_src_JetMETCorrections_METPUSubtraction := src_JetMETCorrections_METPUSubtraction_python src_JetMETCorrections_METPUSubtraction_plugins src_JetMETCorrections_METPUSubtraction_test src_JetMETCorrections_METPUSubtraction_src
ifeq ($(strip $(PyRecoTauTagConfiguration)),)
PyRecoTauTagConfiguration := self/src/RecoTauTag/Configuration/python
PyRecoTauTagConfiguration_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoTauTag/Configuration/python)
ALL_PRODS += PyRecoTauTagConfiguration
PyRecoTauTagConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoTauTagConfiguration,src/RecoTauTag/Configuration/python,src_RecoTauTag_Configuration_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoTauTagConfiguration,src/RecoTauTag/Configuration/python))
endif
ALL_COMMONRULES += src_RecoTauTag_Configuration_python
src_RecoTauTag_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoTauTag_Configuration_python,src/RecoTauTag/Configuration/python,PYTHON))
src_FinalStateAnalysis_StatTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/StatTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_StatTools_scripts,src/FinalStateAnalysis/StatTools/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_PACKAGES += $(patsubst src/%,%,src/CondFormats/EgammaObjects)
subdirs_src_CondFormats_EgammaObjects := src_CondFormats_EgammaObjects_src
ALL_PACKAGES += $(patsubst src/%,%,src/RecoMET/METProducers)
subdirs_src_RecoMET_METProducers := src_RecoMET_METProducers_test src_RecoMET_METProducers_src src_RecoMET_METProducers_python
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/CommonTools)
subdirs_src_CommonTools = src_CommonTools_RecoUtils src_CommonTools_ParticleFlow
ALL_COMMONRULES += src_ZZMatrixElement_MEMCalculators_test
src_ZZMatrixElement_MEMCalculators_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_ZZMatrixElement_MEMCalculators_test,src/ZZMatrixElement/MEMCalculators/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/UWHiggs)
subdirs_src_UWHiggs = src_UWHiggs_wh src_UWHiggs_tth src_UWHiggs_dependencies src_UWHiggs_test src_UWHiggs_lfvmutau src_UWHiggs_hzg src_UWHiggs_h2tau src_UWHiggs_zh
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/tth)
subdirs_src_UWHiggs_tth := 
ifeq ($(strip $(PyFWCoreGuiBrowsers)),)
PyFWCoreGuiBrowsers := self/src/FWCore/GuiBrowsers/python
PyFWCoreGuiBrowsers_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FWCore/GuiBrowsers/python)
ALL_PRODS += PyFWCoreGuiBrowsers
PyFWCoreGuiBrowsers_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFWCoreGuiBrowsers,src/FWCore/GuiBrowsers/python,src_FWCore_GuiBrowsers_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFWCoreGuiBrowsers,src/FWCore/GuiBrowsers/python))
endif
ALL_COMMONRULES += src_FWCore_GuiBrowsers_python
src_FWCore_GuiBrowsers_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FWCore_GuiBrowsers_python,src/FWCore/GuiBrowsers/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/test)
subdirs_src_UWHiggs_test := 
ALL_COMMONRULES += src_RecoEgamma_EgammaTools_test
src_RecoEgamma_EgammaTools_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoEgamma_EgammaTools_test,src/RecoEgamma/EgammaTools/test,TEST))
ALL_COMMONRULES += src_Higgs_Higgs_CS_and_Width_test
src_Higgs_Higgs_CS_and_Width_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Higgs_Higgs_CS_and_Width_test,src/Higgs/Higgs_CS_and_Width/test,TEST))
ALL_COMMONRULES += src_FinalStateAnalysis_NtupleTools_test
src_FinalStateAnalysis_NtupleTools_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_NtupleTools_test,src/FinalStateAnalysis/NtupleTools/test,TEST))
ifeq ($(strip $(RecoJetsJetProducers_plugins)),)
RecoJetsJetProducers_plugins_files := $(patsubst src/RecoJets/JetProducers/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoJets/JetProducers/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoJets/JetProducers/plugins/$(file). Please fix src/RecoJets/JetProducers/plugins/BuildFile.))))
RecoJetsJetProducers_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoJetsJetProducers_plugins_files))))
RecoJetsJetProducers_plugins := self/src/RecoJets/JetProducers/plugins
RecoJetsJetProducers_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoJets/JetProducers/plugins/BuildFile
RecoJetsJetProducers_plugins_LOC_USE   := self RecoJets/JetProducers RecoJets/JetAlgorithms FWCore/Framework DataFormats/JetReco DataFormats/VertexReco Geometry/CaloGeometry Geometry/Records CommonTools/UtilAlgos CondFormats/JetMETObjects JetMETCorrections/Objects fastjet
RecoJetsJetProducers_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoJetsJetProducers_plugins,RecoJetsJetProducers_plugins,$(SCRAMSTORENAME_LIB)))
RecoJetsJetProducers_plugins_PACKAGE := self/src/RecoJets/JetProducers/plugins
ALL_PRODS += RecoJetsJetProducers_plugins
RecoJetsJetProducers_plugins_INIT_FUNC        += $$(eval $$(call Library,RecoJetsJetProducers_plugins,src/RecoJets/JetProducers/plugins,src_RecoJets_JetProducers_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoJetsJetProducers_plugins_files_exts),$(RecoJetsJetProducers_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoJetsJetProducers_plugins,src/RecoJets/JetProducers/plugins))
endif
ALL_COMMONRULES += src_RecoJets_JetProducers_plugins
src_RecoJets_JetProducers_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoJets_JetProducers_plugins,src/RecoJets/JetProducers/plugins,PLUGINS))
ALL_COMMONRULES += src_ZZMatrixElement_MEKD_test
src_ZZMatrixElement_MEKD_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_ZZMatrixElement_MEKD_test,src/ZZMatrixElement/MEKD/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/test_setup)
subdirs_src_test_setup = src_test_setup_aux src_test_setup_setup
ALL_PACKAGES += $(patsubst src/%,%,src/RecoBTag/SecondaryVertex)
subdirs_src_RecoBTag_SecondaryVertex := src_RecoBTag_SecondaryVertex_python src_RecoBTag_SecondaryVertex_src src_RecoBTag_SecondaryVertex_plugins
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/dependencies)
subdirs_src_UWHiggs_dependencies := 
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/StatTools)
subdirs_src_FinalStateAnalysis_StatTools := src_FinalStateAnalysis_StatTools_src src_FinalStateAnalysis_StatTools_scripts src_FinalStateAnalysis_StatTools_test src_FinalStateAnalysis_StatTools_python
ALL_PACKAGES += $(patsubst src/%,%,src/JetMETCorrections/Type1MET)
subdirs_src_JetMETCorrections_Type1MET := src_JetMETCorrections_Type1MET_src src_JetMETCorrections_Type1MET_plugins src_JetMETCorrections_Type1MET_python
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoVertex)
subdirs_src_RecoVertex = src_RecoVertex_AdaptiveVertexFinder
ALL_PACKAGES += $(patsubst src/%,%,src/Higgs/Higgs_CS_and_Width)
subdirs_src_Higgs_Higgs_CS_and_Width := src_Higgs_Higgs_CS_and_Width_src src_Higgs_Higgs_CS_and_Width_test
src_HiggsAnalysis_CombinedLimit_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/HiggsAnalysis/CombinedLimit/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_HiggsAnalysis_CombinedLimit_scripts,src/HiggsAnalysis/CombinedLimit/scripts,$(SCRAMSTORENAME_BIN),*))
ifeq ($(strip $(PhysicsToolsPatAlgos_plugins)),)
PhysicsToolsPatAlgos_plugins_files := $(patsubst src/PhysicsTools/PatAlgos/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/plugins/$(file). Please fix src/PhysicsTools/PatAlgos/plugins/BuildFile.))))
PhysicsToolsPatAlgos_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(PhysicsToolsPatAlgos_plugins_files))))
PhysicsToolsPatAlgos_plugins := self/src/PhysicsTools/PatAlgos/plugins
PhysicsToolsPatAlgos_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/plugins/BuildFile
PhysicsToolsPatAlgos_plugins_LOC_USE   := self PhysicsTools/PatAlgos FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/MessageService L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore DataFormats/PatCandidates DataFormats/BTauReco DataFormats/JetReco DataFormats/TrackReco DataFormats/Candidate DataFormats/HeavyIonEvent PhysicsTools/PatUtils CondFormats/JetMETObjects JetMETCorrections/Objects TrackingTools/TransientTrack SimDataFormats/Track SimDataFormats/Vertex SimGeneral/HepPDTRecord RecoMET/METAlgorithms RecoEgamma/EgammaTools TrackingTools/IPTools root
PhysicsToolsPatAlgos_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatAlgos_plugins,PhysicsToolsPatAlgos_plugins,$(SCRAMSTORENAME_LIB)))
PhysicsToolsPatAlgos_plugins_PACKAGE := self/src/PhysicsTools/PatAlgos/plugins
ALL_PRODS += PhysicsToolsPatAlgos_plugins
PhysicsToolsPatAlgos_plugins_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins,src_PhysicsTools_PatAlgos_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(PhysicsToolsPatAlgos_plugins_files_exts),$(PhysicsToolsPatAlgos_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_plugins
src_PhysicsTools_PatAlgos_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins,PLUGINS))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/CondFormats)
subdirs_src_CondFormats = src_CondFormats_EgammaObjects
ifeq ($(strip $(combine)),)
combine_files := $(patsubst src/HiggsAnalysis/CombinedLimit/bin/%,%,$(foreach file,combine.cpp,$(eval xfile:=$(wildcard src/HiggsAnalysis/CombinedLimit/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/HiggsAnalysis/CombinedLimit/bin/$(file). Please fix src/HiggsAnalysis/CombinedLimit/bin/BuildFile.))))
combine := self/src/HiggsAnalysis/CombinedLimit/bin
combine_BuildFile    := $(WORKINGDIR)/cache/bf/src/HiggsAnalysis/CombinedLimit/bin/BuildFile
combine_LOC_USE   := self HiggsAnalysis/CombinedLimit boost_program_options
combine_PACKAGE := self/src/HiggsAnalysis/CombinedLimit/bin
ALL_PRODS += combine
combine_INIT_FUNC        += $$(eval $$(call Binary,combine,src/HiggsAnalysis/CombinedLimit/bin,src_HiggsAnalysis_CombinedLimit_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(combine_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,combine,src/HiggsAnalysis/CombinedLimit/bin))
endif
ALL_COMMONRULES += src_HiggsAnalysis_CombinedLimit_bin
src_HiggsAnalysis_CombinedLimit_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_CombinedLimit_bin,src/HiggsAnalysis/CombinedLimit/bin,BINARY))
ALL_PACKAGES += $(patsubst src/%,%,src/ZZMatrixElement/MEKD)
subdirs_src_ZZMatrixElement_MEKD := src_ZZMatrixElement_MEKD_src src_ZZMatrixElement_MEKD_test
ALL_COMMONRULES += src_FinalStateAnalysis_PlotTools_test
src_FinalStateAnalysis_PlotTools_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PlotTools_test,src/FinalStateAnalysis/PlotTools/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/PhysicsTools)
subdirs_src_PhysicsTools = src_PhysicsTools_PatAlgos src_PhysicsTools_PatUtils
ALL_PACKAGES += $(patsubst src/%,%,src/PhysicsTools/PatAlgos)
subdirs_src_PhysicsTools_PatAlgos := src_PhysicsTools_PatAlgos_test src_PhysicsTools_PatAlgos_python src_PhysicsTools_PatAlgos_src src_PhysicsTools_PatAlgos_plugins src_PhysicsTools_PatAlgos_scripts
ALL_PACKAGES += $(patsubst src/%,%,src/ZZMatrixElement/MELA)
subdirs_src_ZZMatrixElement_MELA := src_ZZMatrixElement_MELA_src src_ZZMatrixElement_MELA_test
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/PlotTools)
subdirs_src_FinalStateAnalysis_PlotTools := src_FinalStateAnalysis_PlotTools_python src_FinalStateAnalysis_PlotTools_test src_FinalStateAnalysis_PlotTools_scripts
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoTauTag)
subdirs_src_RecoTauTag = src_RecoTauTag_RecoTau src_RecoTauTag_Configuration
ALL_COMMONRULES += src_HiggsAnalysis_CombinedLimit_test
src_HiggsAnalysis_CombinedLimit_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_CombinedLimit_test,src/HiggsAnalysis/CombinedLimit/test,TEST))
ifeq ($(strip $(PyRecoParticleFlowPFProducer)),)
PyRecoParticleFlowPFProducer := self/src/RecoParticleFlow/PFProducer/python
PyRecoParticleFlowPFProducer_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoParticleFlow/PFProducer/python)
ALL_PRODS += PyRecoParticleFlowPFProducer
PyRecoParticleFlowPFProducer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoParticleFlowPFProducer,src/RecoParticleFlow/PFProducer/python,src_RecoParticleFlow_PFProducer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoParticleFlowPFProducer,src/RecoParticleFlow/PFProducer/python))
endif
ALL_COMMONRULES += src_RecoParticleFlow_PFProducer_python
src_RecoParticleFlow_PFProducer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoParticleFlow_PFProducer_python,src/RecoParticleFlow/PFProducer/python,PYTHON))
ifeq ($(strip $(CommonToolsParticleFlow_plugins)),)
CommonToolsParticleFlow_plugins_files := $(patsubst src/CommonTools/ParticleFlow/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/CommonTools/ParticleFlow/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/CommonTools/ParticleFlow/plugins/$(file). Please fix src/CommonTools/ParticleFlow/plugins/BuildFile.))))
CommonToolsParticleFlow_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(CommonToolsParticleFlow_plugins_files))))
CommonToolsParticleFlow_plugins := self/src/CommonTools/ParticleFlow/plugins
CommonToolsParticleFlow_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/CommonTools/ParticleFlow/plugins/BuildFile
CommonToolsParticleFlow_plugins_LOC_USE   := self DataFormats/ParticleFlowCandidate DataFormats/JetReco DataFormats/TauReco DataFormats/METReco DataFormats/TrackReco DataFormats/VertexReco PhysicsTools/IsolationAlgos FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet JetMETCorrections/Objects CommonTools/Utils CommonTools/ParticleFlow
CommonToolsParticleFlow_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CommonToolsParticleFlow_plugins,CommonToolsParticleFlow_plugins,$(SCRAMSTORENAME_LIB)))
CommonToolsParticleFlow_plugins_PACKAGE := self/src/CommonTools/ParticleFlow/plugins
ALL_PRODS += CommonToolsParticleFlow_plugins
CommonToolsParticleFlow_plugins_INIT_FUNC        += $$(eval $$(call Library,CommonToolsParticleFlow_plugins,src/CommonTools/ParticleFlow/plugins,src_CommonTools_ParticleFlow_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(CommonToolsParticleFlow_plugins_files_exts),$(CommonToolsParticleFlow_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,CommonToolsParticleFlow_plugins,src/CommonTools/ParticleFlow/plugins))
endif
ALL_COMMONRULES += src_CommonTools_ParticleFlow_plugins
src_CommonTools_ParticleFlow_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_ParticleFlow_plugins,src/CommonTools/ParticleFlow/plugins,PLUGINS))
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/PatCandidates)
subdirs_src_DataFormats_PatCandidates := src_DataFormats_PatCandidates_test src_DataFormats_PatCandidates_src
ifeq ($(strip $(testKinResolutions)),)
testKinResolutions_files := $(patsubst src/DataFormats/PatCandidates/test/%,%,$(foreach file,testKinParametrizations.cc testKinResolutions.cc testRunner.cpp,$(eval xfile:=$(wildcard src/DataFormats/PatCandidates/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/DataFormats/PatCandidates/test/$(file). Please fix src/DataFormats/PatCandidates/test/BuildFile.))))
testKinResolutions := self/src/DataFormats/PatCandidates/test
testKinResolutions_TEST_RUNNER_CMD := echo
testKinResolutions_NO_TESTRUN := yes
testKinResolutions_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/PatCandidates/test/BuildFile
testKinResolutions_LOC_USE   := self boost cppunit DataFormats/PatCandidates
testKinResolutions_PACKAGE := self/src/DataFormats/PatCandidates/test
ALL_PRODS += testKinResolutions
testKinResolutions_INIT_FUNC        += $$(eval $$(call Binary,testKinResolutions,src/DataFormats/PatCandidates/test,src_DataFormats_PatCandidates_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(testKinResolutions_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,testKinResolutions,src/DataFormats/PatCandidates/test))
endif
ALL_COMMONRULES += src_DataFormats_PatCandidates_test
src_DataFormats_PatCandidates_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DataFormats_PatCandidates_test,src/DataFormats/PatCandidates/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoMET)
subdirs_src_RecoMET = src_RecoMET_METAlgorithms src_RecoMET_METProducers
ifeq ($(strip $(EgammaEGammaAnalysisToolsTest)),)
EgammaEGammaAnalysisToolsTest_files := $(patsubst src/EgammaAnalysis/ElectronTools/test/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/EgammaAnalysis/ElectronTools/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/EgammaAnalysis/ElectronTools/test/$(file). Please fix src/EgammaAnalysis/ElectronTools/test/BuildFile.))))
EgammaEGammaAnalysisToolsTest_files_exts := $(sort $(patsubst .%,%,$(suffix $(EgammaEGammaAnalysisToolsTest_files))))
EgammaEGammaAnalysisToolsTest := self/src/EgammaAnalysis/ElectronTools/test
EgammaEGammaAnalysisToolsTest_BuildFile    := $(WORKINGDIR)/cache/bf/src/EgammaAnalysis/ElectronTools/test/BuildFile
EgammaEGammaAnalysisToolsTest_LOC_USE   := self DataFormats/Common DataFormats/EgammaReco DataFormats/GsfTrackReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet RecoParticleFlow/PFProducer EgammaAnalysis/ElectronTools clhep root roottmva
EgammaEGammaAnalysisToolsTest_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,EgammaEGammaAnalysisToolsTest,EgammaEGammaAnalysisToolsTest,$(SCRAMSTORENAME_LIB)))
EgammaEGammaAnalysisToolsTest_PACKAGE := self/src/EgammaAnalysis/ElectronTools/test
ALL_PRODS += EgammaEGammaAnalysisToolsTest
EgammaEGammaAnalysisToolsTest_INIT_FUNC        += $$(eval $$(call Library,EgammaEGammaAnalysisToolsTest,src/EgammaAnalysis/ElectronTools/test,src_EgammaAnalysis_ElectronTools_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(EgammaEGammaAnalysisToolsTest_files_exts),$(EgammaEGammaAnalysisToolsTest_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,EgammaEGammaAnalysisToolsTest,src/EgammaAnalysis/ElectronTools/test))
endif
ALL_COMMONRULES += src_EgammaAnalysis_ElectronTools_test
src_EgammaAnalysis_ElectronTools_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EgammaAnalysis_ElectronTools_test,src/EgammaAnalysis/ElectronTools/test,TEST))
ifeq ($(strip $(PyJetMETCorrectionsType1MET)),)
PyJetMETCorrectionsType1MET := self/src/JetMETCorrections/Type1MET/python
PyJetMETCorrectionsType1MET_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/JetMETCorrections/Type1MET/python)
ALL_PRODS += PyJetMETCorrectionsType1MET
PyJetMETCorrectionsType1MET_INIT_FUNC        += $$(eval $$(call PythonProduct,PyJetMETCorrectionsType1MET,src/JetMETCorrections/Type1MET/python,src_JetMETCorrections_Type1MET_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyJetMETCorrectionsType1MET,src/JetMETCorrections/Type1MET/python))
endif
ALL_COMMONRULES += src_JetMETCorrections_Type1MET_python
src_JetMETCorrections_Type1MET_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_Type1MET_python,src/JetMETCorrections/Type1MET/python,PYTHON))
ifeq ($(strip $(JetMETCorrectionsType1MET_plugins)),)
JetMETCorrectionsType1MET_plugins_files := $(patsubst src/JetMETCorrections/Type1MET/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/JetMETCorrections/Type1MET/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/JetMETCorrections/Type1MET/plugins/$(file). Please fix src/JetMETCorrections/Type1MET/plugins/BuildFile.))))
JetMETCorrectionsType1MET_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(JetMETCorrectionsType1MET_plugins_files))))
JetMETCorrectionsType1MET_plugins := self/src/JetMETCorrections/Type1MET/plugins
JetMETCorrectionsType1MET_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/JetMETCorrections/Type1MET/plugins/BuildFile
JetMETCorrectionsType1MET_plugins_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities CommonTools/Utils DataFormats/Candidate DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/PatCandidates DataFormats/TauReco DataFormats/VertexReco JetMETCorrections/Objects JetMETCorrections/Type1MET
JetMETCorrectionsType1MET_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,JetMETCorrectionsType1MET_plugins,JetMETCorrectionsType1MET_plugins,$(SCRAMSTORENAME_LIB)))
JetMETCorrectionsType1MET_plugins_PACKAGE := self/src/JetMETCorrections/Type1MET/plugins
ALL_PRODS += JetMETCorrectionsType1MET_plugins
JetMETCorrectionsType1MET_plugins_INIT_FUNC        += $$(eval $$(call Library,JetMETCorrectionsType1MET_plugins,src/JetMETCorrections/Type1MET/plugins,src_JetMETCorrections_Type1MET_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(JetMETCorrectionsType1MET_plugins_files_exts),$(JetMETCorrectionsType1MET_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,JetMETCorrectionsType1MET_plugins,src/JetMETCorrections/Type1MET/plugins))
endif
ALL_COMMONRULES += src_JetMETCorrections_Type1MET_plugins
src_JetMETCorrections_Type1MET_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_Type1MET_plugins,src/JetMETCorrections/Type1MET/plugins,PLUGINS))
ALL_PACKAGES += $(patsubst src/%,%,src/CommonTools/RecoUtils)
subdirs_src_CommonTools_RecoUtils := src_CommonTools_RecoUtils_plugins src_CommonTools_RecoUtils_test src_CommonTools_RecoUtils_python src_CommonTools_RecoUtils_src
ifeq ($(strip $(runtestPhysicsToolsPatAlgos)),)
runtestPhysicsToolsPatAlgos_files := $(patsubst src/PhysicsTools/PatAlgos/test/%,%,$(foreach file,runtestPhysicsToolsPatAlgos.cpp,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/test/$(file). Please fix src/PhysicsTools/PatAlgos/test/BuildFile.))))
runtestPhysicsToolsPatAlgos := self/src/PhysicsTools/PatAlgos/test
runtestPhysicsToolsPatAlgos_TEST_RUNNER_CMD :=  runtestPhysicsToolsPatAlgos  /bin/bash PhysicsTools/PatAlgos/test runtests.sh
runtestPhysicsToolsPatAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/test/BuildFile
runtestPhysicsToolsPatAlgos_LOC_USE   := self FWCore/Utilities
runtestPhysicsToolsPatAlgos_PACKAGE := self/src/PhysicsTools/PatAlgos/test
ALL_PRODS += runtestPhysicsToolsPatAlgos
runtestPhysicsToolsPatAlgos_INIT_FUNC        += $$(eval $$(call Binary,runtestPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/test,src_PhysicsTools_PatAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(runtestPhysicsToolsPatAlgos_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,runtestPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/test))
endif
ifeq ($(strip $(PhysicsToolsPatAlgos_testAnalyzers)),)
PhysicsToolsPatAlgos_testAnalyzers_files := $(patsubst src/PhysicsTools/PatAlgos/test/%,%,$(foreach file,private/*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/test/$(file). Please fix src/PhysicsTools/PatAlgos/test/BuildFile.))))
PhysicsToolsPatAlgos_testAnalyzers_files_exts := $(sort $(patsubst .%,%,$(suffix $(PhysicsToolsPatAlgos_testAnalyzers_files))))
PhysicsToolsPatAlgos_testAnalyzers := self/src/PhysicsTools/PatAlgos/test
PhysicsToolsPatAlgos_testAnalyzers_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/test/BuildFile
PhysicsToolsPatAlgos_testAnalyzers_LOC_USE   := self FWCore/Framework FWCore/ParameterSet DataFormats/BTauReco PhysicsTools/PatUtils DataFormats/PatCandidates PhysicsTools/UtilAlgos root
PhysicsToolsPatAlgos_testAnalyzers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatAlgos_testAnalyzers,PhysicsToolsPatAlgos_testAnalyzers,$(SCRAMSTORENAME_LIB)))
PhysicsToolsPatAlgos_testAnalyzers_PACKAGE := self/src/PhysicsTools/PatAlgos/test
ALL_PRODS += PhysicsToolsPatAlgos_testAnalyzers
PhysicsToolsPatAlgos_testAnalyzers_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatAlgos_testAnalyzers,src/PhysicsTools/PatAlgos/test,src_PhysicsTools_PatAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(PhysicsToolsPatAlgos_testAnalyzers_files_exts),$(PhysicsToolsPatAlgos_testAnalyzers_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatAlgos_testAnalyzers,src/PhysicsTools/PatAlgos/test))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_test
src_PhysicsTools_PatAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_test,src/PhysicsTools/PatAlgos/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/HiggsAnalysis/HiggsToTauTau)
subdirs_src_HiggsAnalysis_HiggsToTauTau := src_HiggsAnalysis_HiggsToTauTau_scripts src_HiggsAnalysis_HiggsToTauTau_src src_HiggsAnalysis_HiggsToTauTau_bin src_HiggsAnalysis_HiggsToTauTau_test src_HiggsAnalysis_HiggsToTauTau_python
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/StdDictionaries)
subdirs_src_DataFormats_StdDictionaries := src_DataFormats_StdDictionaries_src
src_FinalStateAnalysis_PlotTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/PlotTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_PlotTools_scripts,src/FinalStateAnalysis/PlotTools/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/DataFormats)
subdirs_src_DataFormats = src_DataFormats_PatCandidates src_DataFormats_JetReco src_DataFormats_METReco src_DataFormats_StdDictionaries src_DataFormats_CaloRecHit src_DataFormats_HLTReco
ALL_COMMONRULES += src_HiggsAnalysis_HiggsToTauTau_test
src_HiggsAnalysis_HiggsToTauTau_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_HiggsToTauTau_test,src/HiggsAnalysis/HiggsToTauTau/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/METReco)
subdirs_src_DataFormats_METReco := src_DataFormats_METReco_src
ifeq ($(strip $(PyRecoLuminosityLumiDB)),)
PyRecoLuminosityLumiDB := self/src/RecoLuminosity/LumiDB/python
PyRecoLuminosityLumiDB_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoLuminosity/LumiDB/python)
ALL_PRODS += PyRecoLuminosityLumiDB
PyRecoLuminosityLumiDB_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoLuminosityLumiDB,src/RecoLuminosity/LumiDB/python,src_RecoLuminosity_LumiDB_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoLuminosityLumiDB,src/RecoLuminosity/LumiDB/python))
endif
ALL_COMMONRULES += src_RecoLuminosity_LumiDB_python
src_RecoLuminosity_LumiDB_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoLuminosity_LumiDB_python,src/RecoLuminosity/LumiDB/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/EgammaAnalysis/ElectronTools)
subdirs_src_EgammaAnalysis_ElectronTools := src_EgammaAnalysis_ElectronTools_plugins src_EgammaAnalysis_ElectronTools_src src_EgammaAnalysis_ElectronTools_test src_EgammaAnalysis_ElectronTools_python
ifeq ($(strip $(TestFinalStateAnalysisUtilities)),)
TestFinalStateAnalysisUtilities_files := $(patsubst src/FinalStateAnalysis/Utilities/test/%,%,$(foreach file,test_Utilities.cppunit.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/Utilities/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/Utilities/test/$(file). Please fix src/FinalStateAnalysis/Utilities/test/BuildFile.))))
TestFinalStateAnalysisUtilities := self/src/FinalStateAnalysis/Utilities/test
TestFinalStateAnalysisUtilities_TEST_RUNNER_CMD :=  TestFinalStateAnalysisUtilities 
TestFinalStateAnalysisUtilities_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/Utilities/test/BuildFile
TestFinalStateAnalysisUtilities_LOC_USE   := self root FinalStateAnalysis/Utilities DataFormats/Math DataFormats/Common DataFormats/Candidate DataFormats/RecoCandidate DataFormats/TrackReco cppunit
TestFinalStateAnalysisUtilities_PACKAGE := self/src/FinalStateAnalysis/Utilities/test
ALL_PRODS += TestFinalStateAnalysisUtilities
TestFinalStateAnalysisUtilities_INIT_FUNC        += $$(eval $$(call Binary,TestFinalStateAnalysisUtilities,src/FinalStateAnalysis/Utilities/test,src_FinalStateAnalysis_Utilities_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(TestFinalStateAnalysisUtilities_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestFinalStateAnalysisUtilities,src/FinalStateAnalysis/Utilities/test))
endif
ifeq ($(strip $(TestFinalStateAnalysisExpressionNtuple)),)
TestFinalStateAnalysisExpressionNtuple_files := $(patsubst src/FinalStateAnalysis/Utilities/test/%,%,$(foreach file,test_ExpressionNtpule.cppunit.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/Utilities/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/Utilities/test/$(file). Please fix src/FinalStateAnalysis/Utilities/test/BuildFile.))))
TestFinalStateAnalysisExpressionNtuple := self/src/FinalStateAnalysis/Utilities/test
TestFinalStateAnalysisExpressionNtuple_TEST_RUNNER_CMD :=  TestFinalStateAnalysisExpressionNtuple 
TestFinalStateAnalysisExpressionNtuple_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/Utilities/test/BuildFile
TestFinalStateAnalysisExpressionNtuple_LOC_USE   := self root FinalStateAnalysis/Utilities DataFormats/Math DataFormats/Common DataFormats/Candidate PhysicsTools/FWLite cppunit
TestFinalStateAnalysisExpressionNtuple_PACKAGE := self/src/FinalStateAnalysis/Utilities/test
ALL_PRODS += TestFinalStateAnalysisExpressionNtuple
TestFinalStateAnalysisExpressionNtuple_INIT_FUNC        += $$(eval $$(call Binary,TestFinalStateAnalysisExpressionNtuple,src/FinalStateAnalysis/Utilities/test,src_FinalStateAnalysis_Utilities_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(TestFinalStateAnalysisExpressionNtuple_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestFinalStateAnalysisExpressionNtuple,src/FinalStateAnalysis/Utilities/test))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_Utilities_test
src_FinalStateAnalysis_Utilities_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_Utilities_test,src/FinalStateAnalysis/Utilities/test,TEST))
ALL_COMMONRULES += src_RecoLuminosity_LumiDB_test
src_RecoLuminosity_LumiDB_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoLuminosity_LumiDB_test,src/RecoLuminosity/LumiDB/test,TEST))
src_FinalStateAnalysis_NtupleTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/NtupleTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_NtupleTools_scripts,src/FinalStateAnalysis/NtupleTools/scripts,$(SCRAMSTORENAME_BIN),*))
ifeq ($(strip $(PyQuarkGluonTaggerEightTeV)),)
PyQuarkGluonTaggerEightTeV := self/src/QuarkGluonTagger/EightTeV/python
PyQuarkGluonTaggerEightTeV_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/QuarkGluonTagger/EightTeV/python)
ALL_PRODS += PyQuarkGluonTaggerEightTeV
PyQuarkGluonTaggerEightTeV_INIT_FUNC        += $$(eval $$(call PythonProduct,PyQuarkGluonTaggerEightTeV,src/QuarkGluonTagger/EightTeV/python,src_QuarkGluonTagger_EightTeV_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyQuarkGluonTaggerEightTeV,src/QuarkGluonTagger/EightTeV/python))
endif
ALL_COMMONRULES += src_QuarkGluonTagger_EightTeV_python
src_QuarkGluonTagger_EightTeV_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_QuarkGluonTagger_EightTeV_python,src/QuarkGluonTagger/EightTeV/python,PYTHON))
ifeq ($(strip $(RecoVertexAdaptiveVertexFinderPlugins)),)
RecoVertexAdaptiveVertexFinderPlugins_files := $(patsubst src/RecoVertex/AdaptiveVertexFinder/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoVertex/AdaptiveVertexFinder/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoVertex/AdaptiveVertexFinder/plugins/$(file). Please fix src/RecoVertex/AdaptiveVertexFinder/plugins/BuildFile.))))
RecoVertexAdaptiveVertexFinderPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoVertexAdaptiveVertexFinderPlugins_files))))
RecoVertexAdaptiveVertexFinderPlugins := self/src/RecoVertex/AdaptiveVertexFinder/plugins
RecoVertexAdaptiveVertexFinderPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoVertex/AdaptiveVertexFinder/plugins/BuildFile
RecoVertexAdaptiveVertexFinderPlugins_LOC_USE   := self FWCore/Framework DataFormats/Common DataFormats/VertexReco DataFormats/JetReco DataFormats/BTauReco DataFormats/BeamSpot RecoVertex/ConfigurableVertexReco RecoBTag/SecondaryVertex TrackingTools/Records TrackingTools/TransientTrack TrackingTools/IPTools FWCore/Utilities
RecoVertexAdaptiveVertexFinderPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoVertexAdaptiveVertexFinderPlugins,RecoVertexAdaptiveVertexFinderPlugins,$(SCRAMSTORENAME_LIB)))
RecoVertexAdaptiveVertexFinderPlugins_PACKAGE := self/src/RecoVertex/AdaptiveVertexFinder/plugins
ALL_PRODS += RecoVertexAdaptiveVertexFinderPlugins
RecoVertexAdaptiveVertexFinderPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoVertexAdaptiveVertexFinderPlugins,src/RecoVertex/AdaptiveVertexFinder/plugins,src_RecoVertex_AdaptiveVertexFinder_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoVertexAdaptiveVertexFinderPlugins_files_exts),$(RecoVertexAdaptiveVertexFinderPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoVertexAdaptiveVertexFinderPlugins,src/RecoVertex/AdaptiveVertexFinder/plugins))
endif
ALL_COMMONRULES += src_RecoVertex_AdaptiveVertexFinder_plugins
src_RecoVertex_AdaptiveVertexFinder_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoVertex_AdaptiveVertexFinder_plugins,src/RecoVertex/AdaptiveVertexFinder/plugins,PLUGINS))
ifeq ($(strip $(RecoParticleFlowPFProducerPlugins)),)
RecoParticleFlowPFProducerPlugins_files := $(patsubst src/RecoParticleFlow/PFProducer/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoParticleFlow/PFProducer/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoParticleFlow/PFProducer/plugins/$(file). Please fix src/RecoParticleFlow/PFProducer/plugins/BuildFile.))))
RecoParticleFlowPFProducerPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoParticleFlowPFProducerPlugins_files))))
RecoParticleFlowPFProducerPlugins := self/src/RecoParticleFlow/PFProducer/plugins
RecoParticleFlowPFProducerPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoParticleFlow/PFProducer/plugins/BuildFile
RecoParticleFlowPFProducerPlugins_LOC_USE   := self CondFormats/DataRecord CondFormats/PhysicsToolsObjects DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaReco DataFormats/EgammaTrackReco DataFormats/GsfTrackReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoParticleFlow/PFClusterTools RecoParticleFlow/PFProducer RecoEcal/EgammaCoreTools Geometry/CaloTopology RecoEgamma/EgammaIsolationAlgos RecoEgamma/PhotonIdentification
RecoParticleFlowPFProducerPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoParticleFlowPFProducerPlugins,RecoParticleFlowPFProducerPlugins,$(SCRAMSTORENAME_LIB)))
RecoParticleFlowPFProducerPlugins_PACKAGE := self/src/RecoParticleFlow/PFProducer/plugins
ALL_PRODS += RecoParticleFlowPFProducerPlugins
RecoParticleFlowPFProducerPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoParticleFlowPFProducerPlugins,src/RecoParticleFlow/PFProducer/plugins,src_RecoParticleFlow_PFProducer_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoParticleFlowPFProducerPlugins_files_exts),$(RecoParticleFlowPFProducerPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoParticleFlowPFProducerPlugins,src/RecoParticleFlow/PFProducer/plugins))
endif
ALL_COMMONRULES += src_RecoParticleFlow_PFProducer_plugins
src_RecoParticleFlow_PFProducer_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoParticleFlow_PFProducer_plugins,src/RecoParticleFlow/PFProducer/plugins,PLUGINS))
ifeq ($(strip $(testRegex)),)
testRegex_files := $(patsubst src/FinalStateAnalysis/Utilities/bin/%,%,$(foreach file,testRegex.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/Utilities/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/Utilities/bin/$(file). Please fix src/FinalStateAnalysis/Utilities/bin/BuildFile.))))
testRegex := self/src/FinalStateAnalysis/Utilities/bin
testRegex_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/Utilities/bin/BuildFile
testRegex_LOC_USE   := self boost_regex
testRegex_PACKAGE := self/src/FinalStateAnalysis/Utilities/bin
ALL_PRODS += testRegex
testRegex_INIT_FUNC        += $$(eval $$(call Binary,testRegex,src/FinalStateAnalysis/Utilities/bin,src_FinalStateAnalysis_Utilities_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(testRegex_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,testRegex,src/FinalStateAnalysis/Utilities/bin))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_Utilities_bin
src_FinalStateAnalysis_Utilities_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_Utilities_bin,src/FinalStateAnalysis/Utilities/bin,BINARY))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/TauAnalysis)
subdirs_src_TauAnalysis = src_TauAnalysis_CandidateTools
ALL_PACKAGES += $(patsubst src/%,%,src/FWCore/GuiBrowsers)
subdirs_src_FWCore_GuiBrowsers := src_FWCore_GuiBrowsers_scripts src_FWCore_GuiBrowsers_test src_FWCore_GuiBrowsers_python
ALL_COMMONRULES += src_UWHiggs_hzg_test
src_UWHiggs_hzg_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_UWHiggs_hzg_test,src/UWHiggs/hzg/test,TEST))
ifeq ($(strip $(FinalStateAnalysisRecoToolsPlugins)),)
FinalStateAnalysisRecoToolsPlugins_files := $(patsubst src/FinalStateAnalysis/RecoTools/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/RecoTools/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/RecoTools/plugins/$(file). Please fix src/FinalStateAnalysis/RecoTools/plugins/BuildFile.))))
FinalStateAnalysisRecoToolsPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(FinalStateAnalysisRecoToolsPlugins_files))))
FinalStateAnalysisRecoToolsPlugins := self/src/FinalStateAnalysis/RecoTools/plugins
FinalStateAnalysisRecoToolsPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/RecoTools/plugins/BuildFile
FinalStateAnalysisRecoToolsPlugins_LOC_USE   := self PhysicsTools/Utilities FWCore/Framework DataFormats/Candidate DataFormats/JetReco CommonTools/Utils DQMServices/Core CommonTools/UtilAlgos
FinalStateAnalysisRecoToolsPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,FinalStateAnalysisRecoToolsPlugins,FinalStateAnalysisRecoToolsPlugins,$(SCRAMSTORENAME_LIB)))
FinalStateAnalysisRecoToolsPlugins_PACKAGE := self/src/FinalStateAnalysis/RecoTools/plugins
ALL_PRODS += FinalStateAnalysisRecoToolsPlugins
FinalStateAnalysisRecoToolsPlugins_INIT_FUNC        += $$(eval $$(call Library,FinalStateAnalysisRecoToolsPlugins,src/FinalStateAnalysis/RecoTools/plugins,src_FinalStateAnalysis_RecoTools_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(FinalStateAnalysisRecoToolsPlugins_files_exts),$(FinalStateAnalysisRecoToolsPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,FinalStateAnalysisRecoToolsPlugins,src/FinalStateAnalysis/RecoTools/plugins))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_RecoTools_plugins
src_FinalStateAnalysis_RecoTools_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_RecoTools_plugins,src/FinalStateAnalysis/RecoTools/plugins,PLUGINS))
ifeq ($(strip $(PyUWHiggshzg)),)
PyUWHiggshzg := self/src/UWHiggs/hzg/python
PyUWHiggshzg_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/UWHiggs/hzg/python)
ALL_PRODS += PyUWHiggshzg
PyUWHiggshzg_INIT_FUNC        += $$(eval $$(call PythonProduct,PyUWHiggshzg,src/UWHiggs/hzg/python,src_UWHiggs_hzg_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyUWHiggshzg,src/UWHiggs/hzg/python))
endif
ALL_COMMONRULES += src_UWHiggs_hzg_python
src_UWHiggs_hzg_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_UWHiggs_hzg_python,src/UWHiggs/hzg/python,PYTHON))
ifeq ($(strip $(PyEgammaAnalysisElectronTools)),)
PyEgammaAnalysisElectronTools := self/src/EgammaAnalysis/ElectronTools/python
PyEgammaAnalysisElectronTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/EgammaAnalysis/ElectronTools/python)
ALL_PRODS += PyEgammaAnalysisElectronTools
PyEgammaAnalysisElectronTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyEgammaAnalysisElectronTools,src/EgammaAnalysis/ElectronTools/python,src_EgammaAnalysis_ElectronTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyEgammaAnalysisElectronTools,src/EgammaAnalysis/ElectronTools/python))
endif
ALL_COMMONRULES += src_EgammaAnalysis_ElectronTools_python
src_EgammaAnalysis_ElectronTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EgammaAnalysis_ElectronTools_python,src/EgammaAnalysis/ElectronTools/python,PYTHON))
ALL_COMMONRULES += src_JetMETCorrections_METPUSubtraction_test
src_JetMETCorrections_METPUSubtraction_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_METPUSubtraction_test,src/JetMETCorrections/METPUSubtraction/test,TEST))
ifeq ($(strip $(PyCommonToolsRecoUtils)),)
PyCommonToolsRecoUtils := self/src/CommonTools/RecoUtils/python
PyCommonToolsRecoUtils_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/CommonTools/RecoUtils/python)
ALL_PRODS += PyCommonToolsRecoUtils
PyCommonToolsRecoUtils_INIT_FUNC        += $$(eval $$(call PythonProduct,PyCommonToolsRecoUtils,src/CommonTools/RecoUtils/python,src_CommonTools_RecoUtils_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyCommonToolsRecoUtils,src/CommonTools/RecoUtils/python))
endif
ALL_COMMONRULES += src_CommonTools_RecoUtils_python
src_CommonTools_RecoUtils_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_RecoUtils_python,src/CommonTools/RecoUtils/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/HZZ4L_Combination/CombinationPy)
subdirs_src_HZZ4L_Combination_CombinationPy := 
ALL_COMMONRULES += src_FinalStateAnalysis_TagAndProbe_test
src_FinalStateAnalysis_TagAndProbe_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_TagAndProbe_test,src/FinalStateAnalysis/TagAndProbe/test,TEST))
src_FinalStateAnalysis_RecoTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/RecoTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_RecoTools_scripts,src/FinalStateAnalysis/RecoTools/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_PACKAGES += $(patsubst src/%,%,src/RecoVertex/AdaptiveVertexFinder)
subdirs_src_RecoVertex_AdaptiveVertexFinder := src_RecoVertex_AdaptiveVertexFinder_python src_RecoVertex_AdaptiveVertexFinder_src src_RecoVertex_AdaptiveVertexFinder_plugins src_RecoVertex_AdaptiveVertexFinder_test
src_FinalStateAnalysis_Utilities_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/Utilities/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_Utilities_scripts,src/FinalStateAnalysis/Utilities/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/FinalStateAnalysis)
subdirs_src_FinalStateAnalysis = src_FinalStateAnalysis_DataFormats src_FinalStateAnalysis_NtupleTools src_FinalStateAnalysis_TagAndProbe src_FinalStateAnalysis_PlotTools src_FinalStateAnalysis_MetaData src_FinalStateAnalysis_Utilities src_FinalStateAnalysis_StatTools src_FinalStateAnalysis_PatTools src_FinalStateAnalysis_recipe src_FinalStateAnalysis_DataAlgos src_FinalStateAnalysis_RecoTools
ALL_PACKAGES += $(patsubst src/%,%,src/UWHiggs/zh)
subdirs_src_UWHiggs_zh := 
ALL_PACKAGES += $(patsubst src/%,%,src/RecoParticleFlow/PFProducer)
subdirs_src_RecoParticleFlow_PFProducer := src_RecoParticleFlow_PFProducer_python src_RecoParticleFlow_PFProducer_test src_RecoParticleFlow_PFProducer_src src_RecoParticleFlow_PFProducer_plugins
ALL_PACKAGES += $(patsubst src/%,%,src/QuarkGluonTagger/EightTeV)
subdirs_src_QuarkGluonTagger_EightTeV := src_QuarkGluonTagger_EightTeV_src src_QuarkGluonTagger_EightTeV_python
ALL_PACKAGES += $(patsubst src/%,%,src/FinalStateAnalysis/MetaData)
subdirs_src_FinalStateAnalysis_MetaData := src_FinalStateAnalysis_MetaData_python src_FinalStateAnalysis_MetaData_scripts
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/HiggsAnalysis)
subdirs_src_HiggsAnalysis = src_HiggsAnalysis_HiggsToTauTau src_HiggsAnalysis_CombinedLimit
ifeq ($(strip $(CommonToolsParticleFlowTest)),)
CommonToolsParticleFlowTest_files := $(patsubst src/CommonTools/ParticleFlow/test/%,%,$(foreach file,PFIsoReaderDemo.cc,$(eval xfile:=$(wildcard src/CommonTools/ParticleFlow/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/CommonTools/ParticleFlow/test/$(file). Please fix src/CommonTools/ParticleFlow/test/BuildFile.))))
CommonToolsParticleFlowTest_files_exts := $(sort $(patsubst .%,%,$(suffix $(CommonToolsParticleFlowTest_files))))
CommonToolsParticleFlowTest := self/src/CommonTools/ParticleFlow/test
CommonToolsParticleFlowTest_BuildFile    := $(WORKINGDIR)/cache/bf/src/CommonTools/ParticleFlow/test/BuildFile
CommonToolsParticleFlowTest_LOC_USE   := self DataFormats/Common DataFormats/EgammaCandidates FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet PhysicsTools/UtilAlgos
CommonToolsParticleFlowTest_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CommonToolsParticleFlowTest,CommonToolsParticleFlowTest,$(SCRAMSTORENAME_LIB)))
CommonToolsParticleFlowTest_PACKAGE := self/src/CommonTools/ParticleFlow/test
ALL_PRODS += CommonToolsParticleFlowTest
CommonToolsParticleFlowTest_INIT_FUNC        += $$(eval $$(call Library,CommonToolsParticleFlowTest,src/CommonTools/ParticleFlow/test,src_CommonTools_ParticleFlow_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(CommonToolsParticleFlowTest_files_exts),$(CommonToolsParticleFlowTest_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,CommonToolsParticleFlowTest,src/CommonTools/ParticleFlow/test))
endif
ALL_COMMONRULES += src_CommonTools_ParticleFlow_test
src_CommonTools_ParticleFlow_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_ParticleFlow_test,src/CommonTools/ParticleFlow/test,TEST))
ALL_COMMONRULES += src_FWCore_GuiBrowsers_test
src_FWCore_GuiBrowsers_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FWCore_GuiBrowsers_test,src/FWCore/GuiBrowsers/test,TEST))
ifeq ($(strip $(PyCommonToolsParticleFlow)),)
PyCommonToolsParticleFlow := self/src/CommonTools/ParticleFlow/python
PyCommonToolsParticleFlow_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/CommonTools/ParticleFlow/python)
ALL_PRODS += PyCommonToolsParticleFlow
PyCommonToolsParticleFlow_INIT_FUNC        += $$(eval $$(call PythonProduct,PyCommonToolsParticleFlow,src/CommonTools/ParticleFlow/python,src_CommonTools_ParticleFlow_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyCommonToolsParticleFlow,src/CommonTools/ParticleFlow/python))
endif
ALL_COMMONRULES += src_CommonTools_ParticleFlow_python
src_CommonTools_ParticleFlow_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_ParticleFlow_python,src/CommonTools/ParticleFlow/python,PYTHON))
src_FinalStateAnalysis_MetaData_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/MetaData/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_MetaData_scripts,src/FinalStateAnalysis/MetaData/scripts,$(SCRAMSTORENAME_BIN),*))
src_RecoLuminosity_LumiDB_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/RecoLuminosity/LumiDB/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_RecoLuminosity_LumiDB_scripts,src/RecoLuminosity/LumiDB/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/JetReco)
subdirs_src_DataFormats_JetReco := src_DataFormats_JetReco_src
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/QuarkGluonTagger)
subdirs_src_QuarkGluonTagger = src_QuarkGluonTagger_EightTeV
ifeq ($(strip $(TestSmartTrigger)),)
TestSmartTrigger_files := $(patsubst src/FinalStateAnalysis/DataAlgos/test/%,%,$(foreach file,test_SmartTrigger.cppunit.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/DataAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/DataAlgos/test/$(file). Please fix src/FinalStateAnalysis/DataAlgos/test/BuildFile.))))
TestSmartTrigger := self/src/FinalStateAnalysis/DataAlgos/test
TestSmartTrigger_TEST_RUNNER_CMD :=  TestSmartTrigger 
TestSmartTrigger_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/DataAlgos/test/BuildFile
TestSmartTrigger_LOC_USE   := self FinalStateAnalysis/DataAlgos cppunit
TestSmartTrigger_PACKAGE := self/src/FinalStateAnalysis/DataAlgos/test
ALL_PRODS += TestSmartTrigger
TestSmartTrigger_INIT_FUNC        += $$(eval $$(call Binary,TestSmartTrigger,src/FinalStateAnalysis/DataAlgos/test,src_FinalStateAnalysis_DataAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(TestSmartTrigger_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestSmartTrigger,src/FinalStateAnalysis/DataAlgos/test))
endif
ifeq ($(strip $(TestHashing)),)
TestHashing_files := $(patsubst src/FinalStateAnalysis/DataAlgos/test/%,%,$(foreach file,test_Hash.cppunit.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/DataAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/DataAlgos/test/$(file). Please fix src/FinalStateAnalysis/DataAlgos/test/BuildFile.))))
TestHashing := self/src/FinalStateAnalysis/DataAlgos/test
TestHashing_TEST_RUNNER_CMD :=  TestHashing 
TestHashing_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/DataAlgos/test/BuildFile
TestHashing_LOC_USE   := self FinalStateAnalysis/DataAlgos cppunit
TestHashing_PACKAGE := self/src/FinalStateAnalysis/DataAlgos/test
ALL_PRODS += TestHashing
TestHashing_INIT_FUNC        += $$(eval $$(call Binary,TestHashing,src/FinalStateAnalysis/DataAlgos/test,src_FinalStateAnalysis_DataAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(TestHashing_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestHashing,src/FinalStateAnalysis/DataAlgos/test))
endif
ifeq ($(strip $(TestDataAlgoHelpers)),)
TestDataAlgoHelpers_files := $(patsubst src/FinalStateAnalysis/DataAlgos/test/%,%,$(foreach file,test_helpers.cppunit.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/DataAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/DataAlgos/test/$(file). Please fix src/FinalStateAnalysis/DataAlgos/test/BuildFile.))))
TestDataAlgoHelpers := self/src/FinalStateAnalysis/DataAlgos/test
TestDataAlgoHelpers_TEST_RUNNER_CMD :=  TestDataAlgoHelpers 
TestDataAlgoHelpers_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/DataAlgos/test/BuildFile
TestDataAlgoHelpers_LOC_USE   := self FinalStateAnalysis/DataAlgos cppunit
TestDataAlgoHelpers_PACKAGE := self/src/FinalStateAnalysis/DataAlgos/test
ALL_PRODS += TestDataAlgoHelpers
TestDataAlgoHelpers_INIT_FUNC        += $$(eval $$(call Binary,TestDataAlgoHelpers,src/FinalStateAnalysis/DataAlgos/test,src_FinalStateAnalysis_DataAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(TestDataAlgoHelpers_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestDataAlgoHelpers,src/FinalStateAnalysis/DataAlgos/test))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_DataAlgos_test
src_FinalStateAnalysis_DataAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_DataAlgos_test,src/FinalStateAnalysis/DataAlgos/test,TEST))
ifeq ($(strip $(PyRecoJetsJetProducers)),)
PyRecoJetsJetProducers := self/src/RecoJets/JetProducers/python
PyRecoJetsJetProducers_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoJets/JetProducers/python)
ALL_PRODS += PyRecoJetsJetProducers
PyRecoJetsJetProducers_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoJetsJetProducers,src/RecoJets/JetProducers/python,src_RecoJets_JetProducers_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoJetsJetProducers,src/RecoJets/JetProducers/python))
endif
ALL_COMMONRULES += src_RecoJets_JetProducers_python
src_RecoJets_JetProducers_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoJets_JetProducers_python,src/RecoJets/JetProducers/python,PYTHON))
ifeq ($(strip $(TestPATFinalState)),)
TestPATFinalState_files := $(patsubst src/FinalStateAnalysis/DataFormats/test/%,%,$(foreach file,test_FinalState.cppunit.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/DataFormats/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/DataFormats/test/$(file). Please fix src/FinalStateAnalysis/DataFormats/test/BuildFile.))))
TestPATFinalState := self/src/FinalStateAnalysis/DataFormats/test
TestPATFinalState_TEST_RUNNER_CMD :=  TestPATFinalState 
TestPATFinalState_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/DataFormats/test/BuildFile
TestPATFinalState_LOC_USE   := self root FinalStateAnalysis/DataFormats DataFormats/Math DataFormats/Common cppunit
TestPATFinalState_PACKAGE := self/src/FinalStateAnalysis/DataFormats/test
ALL_PRODS += TestPATFinalState
TestPATFinalState_INIT_FUNC        += $$(eval $$(call Binary,TestPATFinalState,src/FinalStateAnalysis/DataFormats/test,src_FinalStateAnalysis_DataFormats_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(TestPATFinalState_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,TestPATFinalState,src/FinalStateAnalysis/DataFormats/test))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_DataFormats_test
src_FinalStateAnalysis_DataFormats_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_DataFormats_test,src/FinalStateAnalysis/DataFormats/test,TEST))
ifeq ($(strip $(make3DHisto)),)
make3DHisto_files := $(patsubst src/FinalStateAnalysis/RecoTools/bin/%,%,$(foreach file,make3DHisto.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/RecoTools/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/RecoTools/bin/$(file). Please fix src/FinalStateAnalysis/RecoTools/bin/BuildFile.))))
make3DHisto := self/src/FinalStateAnalysis/RecoTools/bin
make3DHisto_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/RecoTools/bin/BuildFile
make3DHisto_LOC_USE   := self rootcore root boost boost_program_options
make3DHisto_PACKAGE := self/src/FinalStateAnalysis/RecoTools/bin
ALL_PRODS += make3DHisto
make3DHisto_INIT_FUNC        += $$(eval $$(call Binary,make3DHisto,src/FinalStateAnalysis/RecoTools/bin,src_FinalStateAnalysis_RecoTools_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(make3DHisto_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,make3DHisto,src/FinalStateAnalysis/RecoTools/bin))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_RecoTools_bin
src_FinalStateAnalysis_RecoTools_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_RecoTools_bin,src/FinalStateAnalysis/RecoTools/bin,BINARY))
src_FWCore_GuiBrowsers_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FWCore/GuiBrowsers/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FWCore_GuiBrowsers_scripts,src/FWCore/GuiBrowsers/scripts,$(SCRAMSTORENAME_BIN),*))
src_PhysicsTools_PatAlgos_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/PhysicsTools/PatAlgos/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_PhysicsTools_PatAlgos_scripts,src/PhysicsTools/PatAlgos/scripts,$(SCRAMSTORENAME_BIN),*))
ALL_PACKAGES += $(patsubst src/%,%,src/test_setup/aux)
subdirs_src_test_setup_aux := 
