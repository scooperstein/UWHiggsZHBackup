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
