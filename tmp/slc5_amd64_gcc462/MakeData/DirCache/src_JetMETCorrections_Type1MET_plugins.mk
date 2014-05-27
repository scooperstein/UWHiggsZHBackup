ifeq ($(strip $(JetMETCorrectionsType1MET_plugins)),)
JetMETCorrectionsType1MET_plugins_files := $(patsubst src/JetMETCorrections/Type1MET/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/JetMETCorrections/Type1MET/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/JetMETCorrections/Type1MET/plugins/$(file). Please fix src/JetMETCorrections/Type1MET/plugins/BuildFile.))))
JetMETCorrectionsType1MET_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(JetMETCorrectionsType1MET_plugins_files))))
JetMETCorrectionsType1MET_plugins := self/src/JetMETCorrections/Type1MET/plugins
JetMETCorrectionsType1MET_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/JetMETCorrections/Type1MET/plugins/BuildFile
JetMETCorrectionsType1MET_plugins_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities CommonTools/Utils DataFormats/Candidate DataFormats/JetReco DataFormats/METReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/PatCandidates DataFormats/TauReco DataFormats/VertexReco JetMETCorrections/Objects JetMETCorrections/Type1MET
JetMETCorrectionsType1MET_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,JetMETCorrectionsType1MET_plugins,JetMETCorrectionsType1MET_plugins,$(SCRAMSTORENAME_LIB)))
JetMETCorrectionsType1MET_plugins_PACKAGE := self/src/JetMETCorrections/Type1MET/plugins
ALL_PRODS += JetMETCorrectionsType1MET_plugins
JetMETCorrectionsType1MET_plugins_INIT_FUNC        += $$(eval $$(call Library,JetMETCorrectionsType1MET_plugins,src/JetMETCorrections/Type1MET/plugins,src_JetMETCorrections_Type1MET_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(JetMETCorrectionsType1MET_plugins_files_exts),$(JetMETCorrectionsType1MET_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,JetMETCorrectionsType1MET_plugins,src/JetMETCorrections/Type1MET/plugins))
endif
ALL_COMMONRULES += src_JetMETCorrections_Type1MET_plugins
src_JetMETCorrections_Type1MET_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_Type1MET_plugins,src/JetMETCorrections/Type1MET/plugins,PLUGINS))
