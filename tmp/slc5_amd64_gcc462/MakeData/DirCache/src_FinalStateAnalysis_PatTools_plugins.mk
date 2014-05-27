ifeq ($(strip $(FinalStateAnalysisPatToolsPlugins)),)
FinalStateAnalysisPatToolsPlugins_files := $(patsubst src/FinalStateAnalysis/PatTools/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/PatTools/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/PatTools/plugins/$(file). Please fix src/FinalStateAnalysis/PatTools/plugins/BuildFile.))))
FinalStateAnalysisPatToolsPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(FinalStateAnalysisPatToolsPlugins_files))))
FinalStateAnalysisPatToolsPlugins := self/src/FinalStateAnalysis/PatTools/plugins
FinalStateAnalysisPatToolsPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/PatTools/plugins/BuildFile
FinalStateAnalysisPatToolsPlugins_LOC_USE   := self DataFormats/Candidate DataFormats/Common DataFormats/PatCandidates FinalStateAnalysis/DataFormats FinalStateAnalysis/PatTools FinalStateAnalysis/NtupleTools RecoTauTag/RecoTau CommonTools/Utils CommonTools/UtilAlgos PhysicsTools/Utilities PhysicsTools/PatAlgos ZZMatrixElement/MELA ZZMatrixElement/MEMCalculators CondFormats/JetMETObjects JetMETCorrections/Objects MuonAnalysis/MomentumScaleCalibration RecoVertex/KinematicFitPrimitives RecoEgamma/EgammaTools
FinalStateAnalysisPatToolsPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,FinalStateAnalysisPatToolsPlugins,FinalStateAnalysisPatToolsPlugins,$(SCRAMSTORENAME_LIB)))
FinalStateAnalysisPatToolsPlugins_PACKAGE := self/src/FinalStateAnalysis/PatTools/plugins
ALL_PRODS += FinalStateAnalysisPatToolsPlugins
FinalStateAnalysisPatToolsPlugins_INIT_FUNC        += $$(eval $$(call Library,FinalStateAnalysisPatToolsPlugins,src/FinalStateAnalysis/PatTools/plugins,src_FinalStateAnalysis_PatTools_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(FinalStateAnalysisPatToolsPlugins_files_exts),$(FinalStateAnalysisPatToolsPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,FinalStateAnalysisPatToolsPlugins,src/FinalStateAnalysis/PatTools/plugins))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_PatTools_plugins
src_FinalStateAnalysis_PatTools_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PatTools_plugins,src/FinalStateAnalysis/PatTools/plugins,PLUGINS))
