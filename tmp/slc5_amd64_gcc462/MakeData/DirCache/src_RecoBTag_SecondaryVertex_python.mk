ifeq ($(strip $(PyRecoBTagSecondaryVertex)),)
PyRecoBTagSecondaryVertex := self/src/RecoBTag/SecondaryVertex/python
PyRecoBTagSecondaryVertex_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoBTag/SecondaryVertex/python)
ALL_PRODS += PyRecoBTagSecondaryVertex
PyRecoBTagSecondaryVertex_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoBTagSecondaryVertex,src/RecoBTag/SecondaryVertex/python,src_RecoBTag_SecondaryVertex_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoBTagSecondaryVertex,src/RecoBTag/SecondaryVertex/python))
endif
ALL_COMMONRULES += src_RecoBTag_SecondaryVertex_python
src_RecoBTag_SecondaryVertex_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoBTag_SecondaryVertex_python,src/RecoBTag/SecondaryVertex/python,PYTHON))
