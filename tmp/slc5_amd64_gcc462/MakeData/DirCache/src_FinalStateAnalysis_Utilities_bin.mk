ifeq ($(strip $(testRegex)),)
testRegex_files := $(patsubst src/FinalStateAnalysis/Utilities/bin/%,%,$(foreach file,testRegex.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/Utilities/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/Utilities/bin/$(file). Please fix src/FinalStateAnalysis/Utilities/bin/BuildFile.))))
testRegex := self/src/FinalStateAnalysis/Utilities/bin
testRegex_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/Utilities/bin/BuildFile
testRegex_LOC_USE   := self boost_regex
testRegex_PACKAGE := self/src/FinalStateAnalysis/Utilities/bin
ALL_PRODS += testRegex
testRegex_INIT_FUNC        += $$(eval $$(call Binary,testRegex,src/FinalStateAnalysis/Utilities/bin,src_FinalStateAnalysis_Utilities_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(testRegex_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,testRegex,src/FinalStateAnalysis/Utilities/bin))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_Utilities_bin
src_FinalStateAnalysis_Utilities_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_Utilities_bin,src/FinalStateAnalysis/Utilities/bin,BINARY))
