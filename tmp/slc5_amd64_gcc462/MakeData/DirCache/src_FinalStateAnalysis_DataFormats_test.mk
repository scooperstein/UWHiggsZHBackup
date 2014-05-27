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
