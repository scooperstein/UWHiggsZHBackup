ifeq ($(strip $(PyFinalStateAnalysisPlotTools)),)
PyFinalStateAnalysisPlotTools := self/src/FinalStateAnalysis/PlotTools/python
PyFinalStateAnalysisPlotTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/PlotTools/python)
ALL_PRODS += PyFinalStateAnalysisPlotTools
PyFinalStateAnalysisPlotTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisPlotTools,src/FinalStateAnalysis/PlotTools/python,src_FinalStateAnalysis_PlotTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisPlotTools,src/FinalStateAnalysis/PlotTools/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_PlotTools_python
src_FinalStateAnalysis_PlotTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_PlotTools_python,src/FinalStateAnalysis/PlotTools/python,PYTHON))
