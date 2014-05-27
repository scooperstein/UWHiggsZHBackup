ifeq ($(strip $(PyFinalStateAnalysisTagAndProbe)),)
PyFinalStateAnalysisTagAndProbe := self/src/FinalStateAnalysis/TagAndProbe/python
PyFinalStateAnalysisTagAndProbe_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/FinalStateAnalysis/TagAndProbe/python)
ALL_PRODS += PyFinalStateAnalysisTagAndProbe
PyFinalStateAnalysisTagAndProbe_INIT_FUNC        += $$(eval $$(call PythonProduct,PyFinalStateAnalysisTagAndProbe,src/FinalStateAnalysis/TagAndProbe/python,src_FinalStateAnalysis_TagAndProbe_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyFinalStateAnalysisTagAndProbe,src/FinalStateAnalysis/TagAndProbe/python))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_TagAndProbe_python
src_FinalStateAnalysis_TagAndProbe_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_TagAndProbe_python,src/FinalStateAnalysis/TagAndProbe/python,PYTHON))
