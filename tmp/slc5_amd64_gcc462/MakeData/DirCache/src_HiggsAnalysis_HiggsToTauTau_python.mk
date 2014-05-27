ifeq ($(strip $(PyHiggsAnalysisHiggsToTauTau)),)
PyHiggsAnalysisHiggsToTauTau := self/src/HiggsAnalysis/HiggsToTauTau/python
PyHiggsAnalysisHiggsToTauTau_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HiggsAnalysis/HiggsToTauTau/python)
ALL_PRODS += PyHiggsAnalysisHiggsToTauTau
PyHiggsAnalysisHiggsToTauTau_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHiggsAnalysisHiggsToTauTau,src/HiggsAnalysis/HiggsToTauTau/python,src_HiggsAnalysis_HiggsToTauTau_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHiggsAnalysisHiggsToTauTau,src/HiggsAnalysis/HiggsToTauTau/python))
endif
ALL_COMMONRULES += src_HiggsAnalysis_HiggsToTauTau_python
src_HiggsAnalysis_HiggsToTauTau_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_HiggsToTauTau_python,src/HiggsAnalysis/HiggsToTauTau/python,PYTHON))
