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
