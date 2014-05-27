src_RecoLuminosity_LumiDB_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/RecoLuminosity/LumiDB/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_RecoLuminosity_LumiDB_scripts,src/RecoLuminosity/LumiDB/scripts,$(SCRAMSTORENAME_BIN),*))
