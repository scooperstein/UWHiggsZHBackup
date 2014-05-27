src_FinalStateAnalysis_PlotTools_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/FinalStateAnalysis/PlotTools/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_FinalStateAnalysis_PlotTools_scripts,src/FinalStateAnalysis/PlotTools/scripts,$(SCRAMSTORENAME_BIN),*))
