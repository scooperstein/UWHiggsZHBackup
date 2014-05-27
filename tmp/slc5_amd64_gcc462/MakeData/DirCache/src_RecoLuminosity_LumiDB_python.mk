ifeq ($(strip $(PyRecoLuminosityLumiDB)),)
PyRecoLuminosityLumiDB := self/src/RecoLuminosity/LumiDB/python
PyRecoLuminosityLumiDB_LOC_USE := self
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoLuminosity/LumiDB/python)
ALL_PRODS += PyRecoLuminosityLumiDB
PyRecoLuminosityLumiDB_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoLuminosityLumiDB,src/RecoLuminosity/LumiDB/python,src_RecoLuminosity_LumiDB_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoLuminosityLumiDB,src/RecoLuminosity/LumiDB/python))
endif
ALL_COMMONRULES += src_RecoLuminosity_LumiDB_python
src_RecoLuminosity_LumiDB_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoLuminosity_LumiDB_python,src/RecoLuminosity/LumiDB/python,PYTHON))
