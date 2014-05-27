src_FinalStateAnalysis_StatTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/StatTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_StatTools_scripts,src/FinalStateAnalysis/StatTools/scripts,$(SCRAMSTORENAME_BIN),*))
