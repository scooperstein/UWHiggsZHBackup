src_FinalStateAnalysis_MetaData_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/MetaData/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_MetaData_scripts,src/FinalStateAnalysis/MetaData/scripts,$(SCRAMSTORENAME_BIN),*))
