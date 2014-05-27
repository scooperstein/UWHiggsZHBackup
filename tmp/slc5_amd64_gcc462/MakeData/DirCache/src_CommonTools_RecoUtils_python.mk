ifeq ($(strip $(PyCommonToolsRecoUtils)),)
PyCommonToolsRecoUtils := self/src/CommonTools/RecoUtils/python
PyCommonToolsRecoUtils_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/CommonTools/RecoUtils/python)
ALL_PRODS += PyCommonToolsRecoUtils
PyCommonToolsRecoUtils_INIT_FUNC        += $$(eval $$(call PythonProduct,PyCommonToolsRecoUtils,src/CommonTools/RecoUtils/python,src_CommonTools_RecoUtils_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyCommonToolsRecoUtils,src/CommonTools/RecoUtils/python))
endif
ALL_COMMONRULES += src_CommonTools_RecoUtils_python
src_CommonTools_RecoUtils_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_CommonTools_RecoUtils_python,src/CommonTools/RecoUtils/python,PYTHON))
