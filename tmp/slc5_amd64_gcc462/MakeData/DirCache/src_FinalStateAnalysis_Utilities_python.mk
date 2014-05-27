ifeq ($(strip $(PyFinalStateAnalysisUtilities)),)
PyFinalStateAnalysisUtilities := self/src/FinalStateAnalysis/Utilities/python
PyFinalStateAnalysisUtilities_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/Utilities/python)
ALL_PRODS += PyFinalStateAnalysisUtilities
PyFinalStateAnalysisUtilities_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisUtilities,src/FinalStateAnalysis/Utilities/python,src_FinalStateAnalysis_Utilities_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisUtilities,src/FinalStateAnalysis/Utilities/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_Utilities_python
src_FinalStateAnalysis_Utilities_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_Utilities_python,src/FinalStateAnalysis/Utilities/python,PYTHON))
