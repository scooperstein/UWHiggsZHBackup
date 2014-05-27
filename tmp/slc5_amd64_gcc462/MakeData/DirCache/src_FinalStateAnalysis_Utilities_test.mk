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
