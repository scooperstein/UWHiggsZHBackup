ifeq ($(strip $(PhysicsToolsPatAlgos_plugins)),)
PhysicsToolsPatAlgos_plugins_files := $(patsubst src/PhysicsTools/PatAlgos/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/plugins/$(file). Please fix src/PhysicsTools/PatAlgos/plugins/BuildFile.))))
PhysicsToolsPatAlgos_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(PhysicsToolsPatAlgos_plugins_files))))
PhysicsToolsPatAlgos_plugins := self/src/PhysicsTools/PatAlgos/plugins
PhysicsToolsPatAlgos_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/plugins/BuildFile
PhysicsToolsPatAlgos_plugins_LOC_USE   := self PhysicsTools/PatAlgos FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/MessageService L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore DataFormats/PatCandidates DataFormats/BTauReco DataFormats/JetReco DataFormats/TrackReco DataFormats/Candidate DataFormats/HeavyIonEvent PhysicsTools/PatUtils CondFormats/JetMETObjects JetMETCorrections/Objects TrackingTools/TransientTrack SimDataFormats/Track SimDataFormats/Vertex SimGeneral/HepPDTRecord RecoMET/METAlgorithms RecoEgamma/EgammaTools TrackingTools/IPTools root
PhysicsToolsPatAlgos_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatAlgos_plugins,PhysicsToolsPatAlgos_plugins,$(SCRAMSTORENAME_LIB)))
PhysicsToolsPatAlgos_plugins_PACKAGE := self/src/PhysicsTools/PatAlgos/plugins
ALL_PRODS += PhysicsToolsPatAlgos_plugins
PhysicsToolsPatAlgos_plugins_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins,src_PhysicsTools_PatAlgos_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(PhysicsToolsPatAlgos_plugins_files_exts),$(PhysicsToolsPatAlgos_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_plugins
src_PhysicsTools_PatAlgos_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins,PLUGINS))
