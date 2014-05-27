ifeq ($(strip $(PyFinalStateAnalysisNtupleTools)),)
PyFinalStateAnalysisNtupleTools := self/src/FinalStateAnalysis/NtupleTools/python
PyFinalStateAnalysisNtupleTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/NtupleTools/python)
ALL_PRODS += PyFinalStateAnalysisNtupleTools
PyFinalStateAnalysisNtupleTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisNtupleTools,src/FinalStateAnalysis/NtupleTools/python,src_FinalStateAnalysis_NtupleTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisNtupleTools,src/FinalStateAnalysis/NtupleTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_NtupleTools_python
src_FinalStateAnalysis_NtupleTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_NtupleTools_python,src/FinalStateAnalysis/NtupleTools/python,PYTHON))
