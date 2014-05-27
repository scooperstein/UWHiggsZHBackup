ifeq ($(strip $(PyFinalStateAnalysisRecoTools)),)
PyFinalStateAnalysisRecoTools := self/src/FinalStateAnalysis/RecoTools/python
PyFinalStateAnalysisRecoTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/RecoTools/python)
ALL_PRODS += PyFinalStateAnalysisRecoTools
PyFinalStateAnalysisRecoTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisRecoTools,src/FinalStateAnalysis/RecoTools/python,src_FinalStateAnalysis_RecoTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisRecoTools,src/FinalStateAnalysis/RecoTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_RecoTools_python
src_FinalStateAnalysis_RecoTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_RecoTools_python,src/FinalStateAnalysis/RecoTools/python,PYTHON))
