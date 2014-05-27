ifeq ($(strip $(PyRecoVertexAdaptiveVertexFinder)),)
PyRecoVertexAdaptiveVertexFinder := self/src/RecoVertex/AdaptiveVertexFinder/python
PyRecoVertexAdaptiveVertexFinder_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoVertex/AdaptiveVertexFinder/python)
ALL_PRODS += PyRecoVertexAdaptiveVertexFinder
PyRecoVertexAdaptiveVertexFinder_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoVertexAdaptiveVertexFinder,src/RecoVertex/AdaptiveVertexFinder/python,src_RecoVertex_AdaptiveVertexFinder_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoVertexAdaptiveVertexFinder,src/RecoVertex/AdaptiveVertexFinder/python))
endif
ALL_COMMONRULES += src_RecoVertex_AdaptiveVertexFinder_python
src_RecoVertex_AdaptiveVertexFinder_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoVertex_AdaptiveVertexFinder_python,src/RecoVertex/AdaptiveVertexFinder/python,PYTHON))
