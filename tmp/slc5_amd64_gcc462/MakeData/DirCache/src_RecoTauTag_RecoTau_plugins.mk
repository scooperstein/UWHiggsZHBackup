ifeq ($(strip $(RecoTauTagRecoTauPlugins)),)
RecoTauTagRecoTauPlugins_files := $(patsubst src/RecoTauTag/RecoTau/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoTauTag/RecoTau/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoTauTag/RecoTau/plugins/$(file). Please fix src/RecoTauTag/RecoTau/plugins/BuildFile.))))
RecoTauTagRecoTauPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoTauTagRecoTauPlugins_files))))
RecoTauTagRecoTauPlugins := self/src/RecoTauTag/RecoTau/plugins
RecoTauTagRecoTauPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoTauTag/RecoTau/plugins/BuildFile
RecoTauTagRecoTauPlugins_LOC_USE   := self TrackingTools/Records RecoVertex/KalmanVertexFit CommonTools/CandUtils DataFormats/Candidate DataFormats/MuonReco TrackingTools/TransientTrack RecoVertex/VertexPrimitives PhysicsTools/IsolationUtils PhysicsTools/MVAComputer PhysicsTools/MVATrainer FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/TauReco DataFormats/WrappedStdDictionaries CommonTools/UtilAlgos CommonTools/CandAlgos PhysicsTools/HepMCCandAlgos RecoTauTag/TauTagTools RecoTauTag/RecoTau DataFormats/JetReco DataFormats/ParticleFlowReco RecoBTag/SecondaryVertex DataFormats/VertexReco CondFormats/EgammaObjects CondFormats/DataRecord CondFormats/EcalObjects Geometry/CaloGeometry Geometry/CaloTopology Geometry/Records root
RecoTauTagRecoTauPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoTauTagRecoTauPlugins,RecoTauTagRecoTauPlugins,$(SCRAMSTORENAME_LIB)))
RecoTauTagRecoTauPlugins_PACKAGE := self/src/RecoTauTag/RecoTau/plugins
ALL_PRODS += RecoTauTagRecoTauPlugins
RecoTauTagRecoTauPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoTauTagRecoTauPlugins,src/RecoTauTag/RecoTau/plugins,src_RecoTauTag_RecoTau_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoTauTagRecoTauPlugins_files_exts),$(RecoTauTagRecoTauPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoTauTagRecoTauPlugins,src/RecoTauTag/RecoTau/plugins))
endif
ALL_COMMONRULES += src_RecoTauTag_RecoTau_plugins
src_RecoTauTag_RecoTau_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoTauTag_RecoTau_plugins,src/RecoTauTag/RecoTau/plugins,PLUGINS))
