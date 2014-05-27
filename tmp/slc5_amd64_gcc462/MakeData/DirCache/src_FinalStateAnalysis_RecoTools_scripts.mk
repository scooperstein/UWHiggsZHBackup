src_FinalStateAnalysis_RecoTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/RecoTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_RecoTools_scripts,src/FinalStateAnalysis/RecoTools/scripts,$(SCRAMSTORENAME_BIN),*))
