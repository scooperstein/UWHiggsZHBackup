ifeq ($(strip $(PyJetMETCorrectionsType1MET)),)
PyJetMETCorrectionsType1MET := self/src/JetMETCorrections/Type1MET/python
PyJetMETCorrectionsType1MET_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/JetMETCorrections/Type1MET/python)
ALL_PRODS += PyJetMETCorrectionsType1MET
PyJetMETCorrectionsType1MET_INIT_FUNC        += $$(eval $$(call PythonProduct,PyJetMETCorrectionsType1MET,src/JetMETCorrections/Type1MET/python,src_JetMETCorrections_Type1MET_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyJetMETCorrectionsType1MET,src/JetMETCorrections/Type1MET/python))
endif
ALL_COMMONRULES += src_JetMETCorrections_Type1MET_python
src_JetMETCorrections_Type1MET_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_JetMETCorrections_Type1MET_python,src/JetMETCorrections/Type1MET/python,PYTHON))
