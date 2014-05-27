ifeq ($(strip $(PyRecoParticleFlowPFProducer)),)
PyRecoParticleFlowPFProducer := self/src/RecoParticleFlow/PFProducer/python
PyRecoParticleFlowPFProducer_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoParticleFlow/PFProducer/python)
ALL_PRODS += PyRecoParticleFlowPFProducer
PyRecoParticleFlowPFProducer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoParticleFlowPFProducer,src/RecoParticleFlow/PFProducer/python,src_RecoParticleFlow_PFProducer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoParticleFlowPFProducer,src/RecoParticleFlow/PFProducer/python))
endif
ALL_COMMONRULES += src_RecoParticleFlow_PFProducer_python
src_RecoParticleFlow_PFProducer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoParticleFlow_PFProducer_python,src/RecoParticleFlow/PFProducer/python,PYTHON))
