ifeq ($(strip $(PyPhysicsToolsPatUtils)),)
PyPhysicsToolsPatUtils := self/src/PhysicsTools/PatUtils/python
PyPhysicsToolsPatUtils_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/PhysicsTools/PatUtils/python)
ALL_PRODS += PyPhysicsToolsPatUtils
PyPhysicsToolsPatUtils_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPhysicsToolsPatUtils,src/PhysicsTools/PatUtils/python,src_PhysicsTools_PatUtils_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPhysicsToolsPatUtils,src/PhysicsTools/PatUtils/python))
endif
ALL_COMMONRULES += src_PhysicsTools_PatUtils_python
src_PhysicsTools_PatUtils_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatUtils_python,src/PhysicsTools/PatUtils/python,PYTHON))
