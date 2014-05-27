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
