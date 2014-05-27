ifeq ($(strip $(PFPUAssoMapPlugins)),)
PFPUAssoMapPlugins_files := $(patsubst src/CommonTools/RecoUtils/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/CommonTools/RecoUtils/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/CommonTools/RecoUtils/plugins/$(file). Please fix src/CommonTools/RecoUtils/plugins/BuildFile.))))
PFPUAssoMapPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(PFPUAssoMapPlugins_files))))
PFPUAssoMapPlugins := self/src/CommonTools/RecoUtils/plugins
PFPUAssoMapPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/CommonTools/RecoUtils/plugins/BuildFile
PFPUAssoMapPlugins_LOC_USE   := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry CommonTools/UtilAlgos CommonTools/RecoUtils DataFormats/BeamSpot DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/EgammaCandidates DataFormats/RecoCandidate DataFormats/ParticleFlowReco DQMServices/Core MagneticField/Records MagneticField/Engine SimDataFormats/TrackingAnalysis SimDataFormats/PileupSummaryInfo SimDataFormats/GeneratorProducts SimTracker/TrackAssociation SimTracker/Records TrackingTools/TransientTrack TrackingTools/IPTools
PFPUAssoMapPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PFPUAssoMapPlugins,PFPUAssoMapPlugins,$(SCRAMSTORENAME_LIB)))
PFPUAssoMapPlugins_PACKAGE := self/src/CommonTools/RecoUtils/plugins
ALL_PRODS += PFPUAssoMapPlugins
PFPUAssoMapPlugins_INIT_FUNC        += $$(eval $$(call Library,PFPUAssoMapPlugins,src/CommonTools/RecoUtils/plugins,src_CommonTools_RecoUtils_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(PFPUAssoMapPlugins_files_exts),$(PFPUAssoMapPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,PFPUAssoMapPlugins,src/CommonTools/RecoUtils/plugins))
endif
ALL_COMMONRULES += src_CommonTools_RecoUtils_plugins
src_CommonTools_RecoUtils_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_RecoUtils_plugins,src/CommonTools/RecoUtils/plugins,PLUGINS))
