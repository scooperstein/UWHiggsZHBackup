ifeq ($(strip $(RecoParticleFlowPFProducerPlugins)),)
RecoParticleFlowPFProducerPlugins_files := $(patsubst src/RecoParticleFlow/PFProducer/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoParticleFlow/PFProducer/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoParticleFlow/PFProducer/plugins/$(file). Please fix src/RecoParticleFlow/PFProducer/plugins/BuildFile.))))
RecoParticleFlowPFProducerPlugins_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoParticleFlowPFProducerPlugins_files))))
RecoParticleFlowPFProducerPlugins := self/src/RecoParticleFlow/PFProducer/plugins
RecoParticleFlowPFProducerPlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoParticleFlow/PFProducer/plugins/BuildFile
RecoParticleFlowPFProducerPlugins_LOC_USE   := self CondFormats/DataRecord CondFormats/PhysicsToolsObjects DataFormats/CaloRecHit DataFormats/Common DataFormats/EgammaReco DataFormats/EgammaTrackReco DataFormats/GsfTrackReco DataFormats/MuonReco DataFormats/ParticleFlowCandidate DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoParticleFlow/PFClusterTools RecoParticleFlow/PFProducer RecoEcal/EgammaCoreTools Geometry/CaloTopology RecoEgamma/EgammaIsolationAlgos RecoEgamma/PhotonIdentification
RecoParticleFlowPFProducerPlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoParticleFlowPFProducerPlugins,RecoParticleFlowPFProducerPlugins,$(SCRAMSTORENAME_LIB)))
RecoParticleFlowPFProducerPlugins_PACKAGE := self/src/RecoParticleFlow/PFProducer/plugins
ALL_PRODS += RecoParticleFlowPFProducerPlugins
RecoParticleFlowPFProducerPlugins_INIT_FUNC        += $$(eval $$(call Library,RecoParticleFlowPFProducerPlugins,src/RecoParticleFlow/PFProducer/plugins,src_RecoParticleFlow_PFProducer_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoParticleFlowPFProducerPlugins_files_exts),$(RecoParticleFlowPFProducerPlugins_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoParticleFlowPFProducerPlugins,src/RecoParticleFlow/PFProducer/plugins))
endif
ALL_COMMONRULES += src_RecoParticleFlow_PFProducer_plugins
src_RecoParticleFlow_PFProducer_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoParticleFlow_PFProducer_plugins,src/RecoParticleFlow/PFProducer/plugins,PLUGINS))
