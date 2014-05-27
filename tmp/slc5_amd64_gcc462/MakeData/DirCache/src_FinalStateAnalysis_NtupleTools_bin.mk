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
