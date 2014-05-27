src_UWHiggs_hzg_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/UWHiggs/hzg/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_UWHiggs_hzg_scripts,src/UWHiggs/hzg/scripts,$(SCRAMSTORENAME_BIN),*))
