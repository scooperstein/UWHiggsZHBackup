ifeq ($(strip $(PyFinalStateAnalysisStatTools)),)
PyFinalStateAnalysisStatTools := self/src/FinalStateAnalysis/StatTools/python
PyFinalStateAnalysisStatTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/StatTools/python)
ALL_PRODS += PyFinalStateAnalysisStatTools
PyFinalStateAnalysisStatTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisStatTools,src/FinalStateAnalysis/StatTools/python,src_FinalStateAnalysis_StatTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisStatTools,src/FinalStateAnalysis/StatTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_StatTools_python
src_FinalStateAnalysis_StatTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_StatTools_python,src/FinalStateAnalysis/StatTools/python,PYTHON))
