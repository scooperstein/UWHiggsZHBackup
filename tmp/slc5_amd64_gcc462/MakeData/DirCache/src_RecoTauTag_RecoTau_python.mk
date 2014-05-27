ifeq ($(strip $(PyRecoTauTagRecoTau)),)
PyRecoTauTagRecoTau := self/src/RecoTauTag/RecoTau/python
PyRecoTauTagRecoTau_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoTauTag/RecoTau/python)
ALL_PRODS += PyRecoTauTagRecoTau
PyRecoTauTagRecoTau_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoTauTagRecoTau,src/RecoTauTag/RecoTau/python,src_RecoTauTag_RecoTau_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoTauTagRecoTau,src/RecoTauTag/RecoTau/python))
endif
ALL_COMMONRULES += src_RecoTauTag_RecoTau_python
src_RecoTauTag_RecoTau_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoTauTag_RecoTau_python,src/RecoTauTag/RecoTau/python,PYTHON))
