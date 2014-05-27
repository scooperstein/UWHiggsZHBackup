ifeq ($(strip $(combine)),)
combine_files := $(patsubst src/HiggsAnalysis/CombinedLimit/bin/%,%,$(foreach file,combine.cpp,$(eval xfile:=$(wildcard src/HiggsAnalysis/CombinedLimit/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/HiggsAnalysis/CombinedLimit/bin/$(file). Please fix src/HiggsAnalysis/CombinedLimit/bin/BuildFile.))))
combine := self/src/HiggsAnalysis/CombinedLimit/bin
combine_BuildFile    := $(WORKINGDIR)/cache/bf/src/HiggsAnalysis/CombinedLimit/bin/BuildFile
combine_LOC_USE   := self HiggsAnalysis/CombinedLimit boost_program_options
combine_PACKAGE := self/src/HiggsAnalysis/CombinedLimit/bin
ALL_PRODS += combine
combine_INIT_FUNC        += $$(eval $$(call Binary,combine,src/HiggsAnalysis/CombinedLimit/bin,src_HiggsAnalysis_CombinedLimit_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(combine_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,combine,src/HiggsAnalysis/CombinedLimit/bin))
endif
ALL_COMMONRULES += src_HiggsAnalysis_CombinedLimit_bin
src_HiggsAnalysis_CombinedLimit_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HiggsAnalysis_CombinedLimit_bin,src/HiggsAnalysis/CombinedLimit/bin,BINARY))
