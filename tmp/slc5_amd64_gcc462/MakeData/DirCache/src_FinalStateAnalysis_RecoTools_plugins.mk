ifeq ($(strip $(FinalStateAnalysisRecoToolsPlugins)),)
FinalStateAnalysisRecoToolsPlugins_files := $(patsubst src/FinalStateAnalysis/RecoTools/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/RecoTools/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/RecoTools/plugins/$(file). Please fix src/FinalStateAnalysis/RecoTools/plugins/BuildFile.))))
FinalStateAnalysisRecoToolsPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(FinalStateAnalysisRecoToolsPlugins_files))))
FinalStateAnalysisRecoToolsPlugins := self/src/FinalStateAnalysis/RecoTools/plugins
FinalStateAnalysisRecoToolsPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/RecoTools/plugins/BuildFile
FinalStateAnalysisRecoToolsPlugins_LOC_USE   := self PhysicsTools/Utilities FWCore/Framework DataFormats/Candidate DataFormats/JetReco CommonTools/Utils DQMServices/Core CommonTools/UtilAlgos
FinalStateAnalysisRecoToolsPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,FinalStateAnalysisRecoToolsPlugins,FinalStateAnalysisRecoToolsPlugins,$(SCRAMSTORENAME_LIB)))
FinalStateAnalysisRecoToolsPlugins_PACKAGE := self/src/FinalStateAnalysis/RecoTools/plugins
ALL_PRODS += FinalStateAnalysisRecoToolsPlugins
FinalStateAnalysisRecoToolsPlugins_INIT_FUNC        += $$(eval $$(call Library,FinalStateAnalysisRecoToolsPlugins,src/FinalStateAnalysis/RecoTools/plugins,src_FinalStateAnalysis_RecoTools_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(FinalStateAnalysisRecoToolsPlugins_files_exts),$(FinalStateAnalysisRecoToolsPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,FinalStateAnalysisRecoToolsPlugins,src/FinalStateAnalysis/RecoTools/plugins))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_RecoTools_plugins
src_FinalStateAnalysis_RecoTools_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_RecoTools_plugins,src/FinalStateAnalysis/RecoTools/plugins,PLUGINS))
