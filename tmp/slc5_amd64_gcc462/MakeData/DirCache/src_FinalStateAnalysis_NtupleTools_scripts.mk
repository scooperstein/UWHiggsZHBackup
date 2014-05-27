src_FinalStateAnalysis_NtupleTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/NtupleTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_NtupleTools_scripts,src/FinalStateAnalysis/NtupleTools/scripts,$(SCRAMSTORENAME_BIN),*))
