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
