ifeq ($(strip $(PyQuarkGluonTaggerEightTeV)),)
PyQuarkGluonTaggerEightTeV := self/src/QuarkGluonTagger/EightTeV/python
PyQuarkGluonTaggerEightTeV_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/QuarkGluonTagger/EightTeV/python)
ALL_PRODS += PyQuarkGluonTaggerEightTeV
PyQuarkGluonTaggerEightTeV_INIT_FUNC        += $$(eval $$(call PythonProduct,PyQuarkGluonTaggerEightTeV,src/QuarkGluonTagger/EightTeV/python,src_QuarkGluonTagger_EightTeV_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyQuarkGluonTaggerEightTeV,src/QuarkGluonTagger/EightTeV/python))
endif
ALL_COMMONRULES += src_QuarkGluonTagger_EightTeV_python
src_QuarkGluonTagger_EightTeV_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_QuarkGluonTagger_EightTeV_python,src/QuarkGluonTagger/EightTeV/python,PYTHON))
