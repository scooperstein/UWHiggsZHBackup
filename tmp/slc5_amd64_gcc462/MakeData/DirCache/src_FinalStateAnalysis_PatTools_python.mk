ifeq ($(strip $(PyFinalStateAnalysisPatTools)),)
PyFinalStateAnalysisPatTools := self/src/FinalStateAnalysis/PatTools/python
PyFinalStateAnalysisPatTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/PatTools/python)
ALL_PRODS += PyFinalStateAnalysisPatTools
PyFinalStateAnalysisPatTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisPatTools,src/FinalStateAnalysis/PatTools/python,src_FinalStateAnalysis_PatTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisPatTools,src/FinalStateAnalysis/PatTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_PatTools_python
src_FinalStateAnalysis_PatTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PatTools_python,src/FinalStateAnalysis/PatTools/python,PYTHON))
