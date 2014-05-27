ifeq ($(strip $(RecoVertexAdaptiveVertexFinderPlugins)),)
RecoVertexAdaptiveVertexFinderPlugins_files := $(patsubst src/RecoVertex/AdaptiveVertexFinder/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoVertex/AdaptiveVertexFinder/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoVertex/AdaptiveVertexFinder/plugins/$(file). Please fix src/RecoVertex/AdaptiveVertexFinder/plugins/BuildFile.))))
RecoVertexAdaptiveVertexFinderPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoVertexAdaptiveVertexFinderPlugins_files))))
RecoVertexAdaptiveVertexFinderPlugins := self/src/RecoVertex/AdaptiveVertexFinder/plugins
RecoVertexAdaptiveVertexFinderPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoVertex/AdaptiveVertexFinder/plugins/BuildFile
RecoVertexAdaptiveVertexFinderPlugins_LOC_USE   := self FWCore/Framework DataFormats/Common DataFormats/VertexReco DataFormats/JetReco DataFormats/BTauReco DataFormats/BeamSpot RecoVertex/ConfigurableVertexReco RecoBTag/SecondaryVertex TrackingTools/Records TrackingTools/TransientTrack TrackingTools/IPTools FWCore/Utilities
RecoVertexAdaptiveVertexFinderPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoVertexAdaptiveVertexFinderPlugins,RecoVertexAdaptiveVertexFinderPlugins,$(SCRAMSTORENAME_LIB)))
RecoVertexAdaptiveVertexFinderPlugins_PACKAGE := self/src/RecoVertex/AdaptiveVertexFinder/plugins
ALL_PRODS += RecoVertexAdaptiveVertexFinderPlugins
RecoVertexAdaptiveVertexFinderPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoVertexAdaptiveVertexFinderPlugins,src/RecoVertex/AdaptiveVertexFinder/plugins,src_RecoVertex_AdaptiveVertexFinder_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoVertexAdaptiveVertexFinderPlugins_files_exts),$(RecoVertexAdaptiveVertexFinderPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoVertexAdaptiveVertexFinderPlugins,src/RecoVertex/AdaptiveVertexFinder/plugins))
endif
ALL_COMMONRULES += src_RecoVertex_AdaptiveVertexFinder_plugins
src_RecoVertex_AdaptiveVertexFinder_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoVertex_AdaptiveVertexFinder_plugins,src/RecoVertex/AdaptiveVertexFinder/plugins,PLUGINS))
