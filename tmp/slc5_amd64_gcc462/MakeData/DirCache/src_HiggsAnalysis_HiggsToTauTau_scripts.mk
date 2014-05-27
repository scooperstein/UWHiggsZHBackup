src_HiggsAnalysis_HiggsToTauTau_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/HiggsAnalysis/HiggsToTauTau/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_HiggsAnalysis_HiggsToTauTau_scripts,src/HiggsAnalysis/HiggsToTauTau/scripts,$(SCRAMSTORENAME_BIN),*))
