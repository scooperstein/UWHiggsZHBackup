ifeq ($(strip $(RecoEgammaEgammaToolsPlugins)),)
RecoEgammaEgammaToolsPlugins_files := $(patsubst src/RecoEgamma/EgammaTools/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoEgamma/EgammaTools/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoEgamma/EgammaTools/plugins/$(file). Please fix src/RecoEgamma/EgammaTools/plugins/BuildFile.))))
RecoEgammaEgammaToolsPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoEgammaEgammaToolsPlugins_files))))
RecoEgammaEgammaToolsPlugins := self/src/RecoEgamma/EgammaTools/plugins
RecoEgammaEgammaToolsPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoEgamma/EgammaTools/plugins/BuildFile
RecoEgammaEgammaToolsPlugins_LOC_USE   := self FWCore/Framework PhysicsTools/MVAComputer PhysicsTools/MVATrainer CondCore/PluginSystem CondCore/DBOutputService CondFormats/DataRecord CondFormats/EgammaObjects DataFormats/EgammaCandidates RecoEgamma/EgammaTools
RecoEgammaEgammaToolsPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoEgammaEgammaToolsPlugins,RecoEgammaEgammaToolsPlugins,$(SCRAMSTORENAME_LIB)))
RecoEgammaEgammaToolsPlugins_PACKAGE := self/src/RecoEgamma/EgammaTools/plugins
ALL_PRODS += RecoEgammaEgammaToolsPlugins
RecoEgammaEgammaToolsPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoEgammaEgammaToolsPlugins,src/RecoEgamma/EgammaTools/plugins,src_RecoEgamma_EgammaTools_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoEgammaEgammaToolsPlugins_files_exts),$(RecoEgammaEgammaToolsPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoEgammaEgammaToolsPlugins,src/RecoEgamma/EgammaTools/plugins))
endif
ALL_COMMONRULES += src_RecoEgamma_EgammaTools_plugins
src_RecoEgamma_EgammaTools_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoEgamma_EgammaTools_plugins,src/RecoEgamma/EgammaTools/plugins,PLUGINS))
