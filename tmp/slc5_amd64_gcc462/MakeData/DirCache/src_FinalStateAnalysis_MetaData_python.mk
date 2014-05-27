ifeq ($(strip $(PyFinalStateAnalysisMetaData)),)
PyFinalStateAnalysisMetaData := self/src/FinalStateAnalysis/MetaData/python
PyFinalStateAnalysisMetaData_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/MetaData/python)
ALL_PRODS += PyFinalStateAnalysisMetaData
PyFinalStateAnalysisMetaData_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisMetaData,src/FinalStateAnalysis/MetaData/python,src_FinalStateAnalysis_MetaData_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisMetaData,src/FinalStateAnalysis/MetaData/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_MetaData_python
src_FinalStateAnalysis_MetaData_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_MetaData_python,src/FinalStateAnalysis/MetaData/python,PYTHON))
