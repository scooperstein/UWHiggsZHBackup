src_FWCore_GuiBrowsers_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FWCore/GuiBrowsers/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FWCore_GuiBrowsers_scripts,src/FWCore/GuiBrowsers/scripts,$(SCRAMSTORENAME_BIN),*))
