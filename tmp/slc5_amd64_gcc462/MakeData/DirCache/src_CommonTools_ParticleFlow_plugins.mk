ifeq ($(strip $(CommonToolsParticleFlow_plugins)),)
CommonToolsParticleFlow_plugins_files := $(patsubst src/CommonTools/ParticleFlow/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/CommonTools/ParticleFlow/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/CommonTools/ParticleFlow/plugins/$(file). Please fix src/CommonTools/ParticleFlow/plugins/BuildFile.))))
CommonToolsParticleFlow_plugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(CommonToolsParticleFlow_plugins_files))))
CommonToolsParticleFlow_plugins := self/src/CommonTools/ParticleFlow/plugins
CommonToolsParticleFlow_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/CommonTools/ParticleFlow/plugins/BuildFile
CommonToolsParticleFlow_plugins_LOC_USE   := self DataFormats/ParticleFlowCandidate DataFormats/JetReco DataFormats/TauReco DataFormats/METReco DataFormats/TrackReco DataFormats/VertexReco PhysicsTools/IsolationAlgos FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet JetMETCorrections/Objects CommonTools/Utils CommonTools/ParticleFlow
CommonToolsParticleFlow_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,CommonToolsParticleFlow_plugins,CommonToolsParticleFlow_plugins,$(SCRAMSTORENAME_LIB)))
CommonToolsParticleFlow_plugins_PACKAGE := self/src/CommonTools/ParticleFlow/plugins
ALL_PRODS += CommonToolsParticleFlow_plugins
CommonToolsParticleFlow_plugins_INIT_FUNC        += $$(eval $$(call Library,CommonToolsParticleFlow_plugins,src/CommonTools/ParticleFlow/plugins,src_CommonTools_ParticleFlow_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(CommonToolsParticleFlow_plugins_files_exts),$(CommonToolsParticleFlow_plugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,CommonToolsParticleFlow_plugins,src/CommonTools/ParticleFlow/plugins))
endif
ALL_COMMONRULES += src_CommonTools_ParticleFlow_plugins
src_CommonTools_ParticleFlow_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_ParticleFlow_plugins,src/CommonTools/ParticleFlow/plugins,PLUGINS))
