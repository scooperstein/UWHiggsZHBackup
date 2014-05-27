ifeq ($(strip $(PyEgammaAnalysisElectronTools)),)
PyEgammaAnalysisElectronTools := self/src/EgammaAnalysis/ElectronTools/python
PyEgammaAnalysisElectronTools_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/EgammaAnalysis/ElectronTools/python)
ALL_PRODS += PyEgammaAnalysisElectronTools
PyEgammaAnalysisElectronTools_INIT_FUNC        += $$(eval $$(call PythonProduct,PyEgammaAnalysisElectronTools,src/EgammaAnalysis/ElectronTools/python,src_EgammaAnalysis_ElectronTools_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyEgammaAnalysisElectronTools,src/EgammaAnalysis/ElectronTools/python))
endif
ALL_COMMONRULES += src_EgammaAnalysis_ElectronTools_python
src_EgammaAnalysis_ElectronTools_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EgammaAnalysis_ElectronTools_python,src/EgammaAnalysis/ElectronTools/python,PYTHON))
