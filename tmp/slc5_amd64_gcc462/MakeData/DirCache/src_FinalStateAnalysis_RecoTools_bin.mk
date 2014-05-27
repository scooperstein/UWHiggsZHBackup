ifeq ($(strip $(make3DHisto)),)
make3DHisto_files := $(patsubst src/FinalStateAnalysis/RecoTools/bin/%,%,$(foreach file,make3DHisto.cc,$(eval xfile:=$(wildcard src/FinalStateAnalysis/RecoTools/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/FinalStateAnalysis/RecoTools/bin/$(file). Please fix src/FinalStateAnalysis/RecoTools/bin/BuildFile.))))
make3DHisto := self/src/FinalStateAnalysis/RecoTools/bin
make3DHisto_BuildFile    := $(WORKINGDIR)/cache/bf/src/FinalStateAnalysis/RecoTools/bin/BuildFile
make3DHisto_LOC_USE   := self rootcore root boost boost_program_options
make3DHisto_PACKAGE := self/src/FinalStateAnalysis/RecoTools/bin
ALL_PRODS += make3DHisto
make3DHisto_INIT_FUNC        += $$(eval $$(call Binary,make3DHisto,src/FinalStateAnalysis/RecoTools/bin,src_FinalStateAnalysis_RecoTools_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),$(sort $(patsubst .%,%,$(suffix $(make3DHisto_files)))),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,make3DHisto,src/FinalStateAnalysis/RecoTools/bin))
endif
ALL_COMMONRULES += src_FinalStateAnalysis_RecoTools_bin
src_FinalStateAnalysis_RecoTools_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_FinalStateAnalysis_RecoTools_bin,src/FinalStateAnalysis/RecoTools/bin,BINARY))
