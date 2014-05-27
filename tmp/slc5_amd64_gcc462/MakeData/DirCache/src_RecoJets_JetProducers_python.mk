ifeq ($(strip $(PyRecoJetsJetProducers)),)
PyRecoJetsJetProducers := self/src/RecoJets/JetProducers/python
PyRecoJetsJetProducers_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoJets/JetProducers/python)
ALL_PRODS += PyRecoJetsJetProducers
PyRecoJetsJetProducers_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoJetsJetProducers,src/RecoJets/JetProducers/python,src_RecoJets_JetProducers_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoJetsJetProducers,src/RecoJets/JetProducers/python))
endif
ALL_COMMONRULES += src_RecoJets_JetProducers_python
src_RecoJets_JetProducers_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoJets_JetProducers_python,src/RecoJets/JetProducers/python,PYTHON))
