src_FinalStateAnalysis_Utilities_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/Utilities/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_Utilities_scripts,src/FinalStateAnalysis/Utilities/scripts,$(SCRAMSTORENAME_BIN),*))
