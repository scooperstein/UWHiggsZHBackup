ifeq ($(strip $(PyRecoMETMETProducers)),)
PyRecoMETMETProducers := self/src/RecoMET/METProducers/python
PyRecoMETMETProducers_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoMET/METProducers/python)
ALL_PRODS += PyRecoMETMETProducers
PyRecoMETMETProducers_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoMETMETProducers,src/RecoMET/METProducers/python,src_RecoMET_METProducers_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoMETMETProducers,src/RecoMET/METProducers/python))
endif
ALL_COMMONRULES += src_RecoMET_METProducers_python
src_RecoMET_METProducers_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoMET_METProducers_python,src/RecoMET/METProducers/python,PYTHON))
