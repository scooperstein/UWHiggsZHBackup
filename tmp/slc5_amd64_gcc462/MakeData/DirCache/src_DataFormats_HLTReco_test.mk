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
