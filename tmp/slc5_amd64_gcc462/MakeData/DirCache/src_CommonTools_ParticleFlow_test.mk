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
