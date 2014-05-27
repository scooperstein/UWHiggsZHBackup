ifeq ($(strip $(PyUWHiggshzg)),)
PyUWHiggshzg := self/src/UWHiggs/hzg/python
PyUWHiggshzg_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/UWHiggs/hzg/python)
ALL_PRODS += PyUWHiggshzg
PyUWHiggshzg_INIT_FUNC        += $$(eval $$(call PythonProduct,PyUWHiggshzg,src/UWHiggs/hzg/python,src_UWHiggs_hzg_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyUWHiggshzg,src/UWHiggs/hzg/python))
endif
ALL_COMMONRULES += src_UWHiggs_hzg_python
src_UWHiggs_hzg_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_UWHiggs_hzg_python,src/UWHiggs/hzg/python,PYTHON))
