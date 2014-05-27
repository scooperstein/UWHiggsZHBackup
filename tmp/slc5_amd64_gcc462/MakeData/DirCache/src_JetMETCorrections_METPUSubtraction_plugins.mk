ifeq ($(strip $(JetMETCorrectionsMETPUSubtraction_plugins)),)
JetMETCorrectionsMETPUSubtraction_plugins_files := $(patsubst src/JetMETCorrections/METPUSubtraction/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/JetMETCorrections/METPUSubtraction/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/JetMETCorrections/METPUSubtraction/plugins/$(file). Please fix src/JetMETCorrections/METPUSubtraction/plugins/BuildFile.))))
JetMETCorrectionsMETPUSubtraction_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(JetMETCorrectionsMETPUSubtraction_plugins_files))))
JetMETCorrectionsMETPUSubtraction_plugins := self/src/JetMETCorrections/METPUSubtraction/plugins
JetMETCorrectionsMETPUSubtraction_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/JetMETCorrections/METPUSubtraction/plugins/BuildFile
JetMETCorrectionsMETPUSubtraction_plugins_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities CommonTools/Utils DataFormats/Candidate DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/PatCandidates DataFormats/TauReco DataFormats/VertexReco JetMETCorrections/Objects JetMETCorrections/METPUSubtraction RecoJets/JetProducers
JetMETCorrectionsMETPUSubtraction_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,JetMETCorrectionsMETPUSubtraction_plugins,JetMETCorrectionsMETPUSubtraction_plugins,$(SCRAMSTORENAME_LIB)))
JetMETCorrectionsMETPUSubtraction_plugins_PACKAGE := self/src/JetMETCorrections/METPUSubtraction/plugins
ALL_PRODS += JetMETCorrectionsMETPUSubtraction_plugins
JetMETCorrectionsMETPUSubtraction_plugins_INIT_FUNC        += $$(eval $$(call Library,JetMETCorrectionsMETPUSubtraction_plugins,src/JetMETCorrections/METPUSubtraction/plugins,src_JetMETCorrections_METPUSubtraction_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(JetMETCorrectionsMETPUSubtraction_plugins_files_exts),$(JetMETCorrectionsMETPUSubtraction_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,JetMETCorrectionsMETPUSubtraction_plugins,src/JetMETCorrections/METPUSubtraction/plugins))
endif
ALL_COMMONRULES += src_JetMETCorrections_METPUSubtraction_plugins
src_JetMETCorrections_METPUSubtraction_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_METPUSubtraction_plugins,src/JetMETCorrections/METPUSubtraction/plugins,PLUGINS))
