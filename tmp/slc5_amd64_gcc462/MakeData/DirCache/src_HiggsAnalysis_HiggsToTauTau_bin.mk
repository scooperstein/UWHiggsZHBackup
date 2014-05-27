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
