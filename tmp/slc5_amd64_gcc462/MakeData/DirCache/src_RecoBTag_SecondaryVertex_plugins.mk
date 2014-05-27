ifeq ($(strip $(RecoBTagSecondaryVertexESProducers)),)
RecoBTagSecondaryVertexESProducers_files := $(patsubst src/RecoBTag/SecondaryVertex/plugins/%,%,$(foreach file,JetTagESProducers.cc,$(eval xfile:=$(wildcard src/RecoBTag/SecondaryVertex/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoBTag/SecondaryVertex/plugins/$(file). Please fix src/RecoBTag/SecondaryVertex/plugins/BuildFile.))))
RecoBTagSecondaryVertexESProducers_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoBTagSecondaryVertexESProducers_files))))
RecoBTagSecondaryVertexESProducers := self/src/RecoBTag/SecondaryVertex/plugins
RecoBTagSecondaryVertexESProducers_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoBTag/SecondaryVertex/plugins/BuildFile
RecoBTagSecondaryVertexESProducers_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/GeometryCommonDetAlgo DataFormats/TrackReco DataFormats/VertexReco DataFormats/BTauReco RecoBTag/SecondaryVertex boost RecoBTau/JetTagComputer
RecoBTagSecondaryVertexESProducers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoBTagSecondaryVertexESProducers,RecoBTagSecondaryVertexESProducers,$(SCRAMSTORENAME_LIB)))
RecoBTagSecondaryVertexESProducers_PACKAGE := self/src/RecoBTag/SecondaryVertex/plugins
ALL_PRODS += RecoBTagSecondaryVertexESProducers
RecoBTagSecondaryVertexESProducers_INIT_FUNC        += $$(eval $$(call Library,RecoBTagSecondaryVertexESProducers,src/RecoBTag/SecondaryVertex/plugins,src_RecoBTag_SecondaryVertex_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoBTagSecondaryVertexESProducers_files_exts),$(RecoBTagSecondaryVertexESProducers_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoBTagSecondaryVertexESProducers,src/RecoBTag/SecondaryVertex/plugins))
endif
ifeq ($(strip $(RecoBTagSecondaryVertexProducer)),)
RecoBTagSecondaryVertexProducer_files := $(patsubst src/RecoBTag/SecondaryVertex/plugins/%,%,$(foreach file,SecondaryVertexProducer.cc,$(eval xfile:=$(wildcard src/RecoBTag/SecondaryVertex/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoBTag/SecondaryVertex/plugins/$(file). Please fix src/RecoBTag/SecondaryVertex/plugins/BuildFile.))))
RecoBTagSecondaryVertexProducer_files_exts := $(sort $(patsubst .%,%,$(suffix $(RecoBTagSecondaryVertexProducer_files))))
RecoBTagSecondaryVertexProducer := self/src/RecoBTag/SecondaryVertex/plugins
RecoBTagSecondaryVertexProducer_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoBTag/SecondaryVertex/plugins/BuildFile
RecoBTagSecondaryVertexProducer_LOC_USE   := self FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities DataFormats/GeometryCommonDetAlgo DataFormats/TrackReco DataFormats/VertexReco DataFormats/BTauReco RecoBTag/SecondaryVertex boost DataFormats/BeamSpot TrackingTools/Records TrackingTools/TransientTrack RecoVertex/ConfigurableVertexReco RecoVertex/GhostTrackFitter
RecoBTagSecondaryVertexProducer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoBTagSecondaryVertexProducer,RecoBTagSecondaryVertexProducer,$(SCRAMSTORENAME_LIB)))
RecoBTagSecondaryVertexProducer_PACKAGE := self/src/RecoBTag/SecondaryVertex/plugins
ALL_PRODS += RecoBTagSecondaryVertexProducer
RecoBTagSecondaryVertexProducer_INIT_FUNC        += $$(eval $$(call Library,RecoBTagSecondaryVertexProducer,src/RecoBTag/SecondaryVertex/plugins,src_RecoBTag_SecondaryVertex_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(RecoBTagSecondaryVertexProducer_files_exts),$(RecoBTagSecondaryVertexProducer_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,RecoBTagSecondaryVertexProducer,src/RecoBTag/SecondaryVertex/plugins))
endif
ALL_COMMONRULES += src_RecoBTag_SecondaryVertex_plugins
src_RecoBTag_SecondaryVertex_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoBTag_SecondaryVertex_plugins,src/RecoBTag/SecondaryVertex/plugins,PLUGINS))
