ifeq ($(strip $(runtestPhysicsToolsPatAlgos)),)
runtestPhysicsToolsPatAlgos_files := $(patsubst src/PhysicsTools/PatAlgos/test/%,%,$(foreach file,runtestPhysicsToolsPatAlgos.cpp,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/test/$(file). Please fix src/PhysicsTools/PatAlgos/test/BuildFile.))))
runtestPhysicsToolsPatAlgos := self/src/PhysicsTools/PatAlgos/test
runtestPhysicsToolsPatAlgos_TEST_RUNNER_CMD :=  runtestPhysicsToolsPatAlgos  /bin/bash PhysicsTools/PatAlgos/test runtests.sh
runtestPhysicsToolsPatAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/test/BuildFile
runtestPhysicsToolsPatAlgos_LOC_USE   := self FWCore/Utilities
runtestPhysicsToolsPatAlgos_PACKAGE := self/src/PhysicsTools/PatAlgos/test
ALL_PRODS += runtestPhysicsToolsPatAlgos
runtestPhysicsToolsPatAlgos_INIT_FUNC        += $$(eval $$(call Binary,runtestPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/test,src_PhysicsTools_PatAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(runtestPhysicsToolsPatAlgos_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,runtestPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/test))
endif
ifeq ($(strip $(PhysicsToolsPatAlgos_testAnalyzers)),)
PhysicsToolsPatAlgos_testAnalyzers_files := $(patsubst src/PhysicsTools/PatAlgos/test/%,%,$(foreach file,private/*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/test/$(file). Please fix src/PhysicsTools/PatAlgos/test/BuildFile.))))
PhysicsToolsPatAlgos_testAnalyzers_files_exts := $(sort $(patsubst .%,%,$(suffix $(PhysicsToolsPatAlgos_testAnalyzers_files))))
PhysicsToolsPatAlgos_testAnalyzers := self/src/PhysicsTools/PatAlgos/test
PhysicsToolsPatAlgos_testAnalyzers_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/test/BuildFile
PhysicsToolsPatAlgos_testAnalyzers_LOC_USE   := self FWCore/Framework FWCore/ParameterSet DataFormats/BTauReco PhysicsTools/PatUtils DataFormats/PatCandidates PhysicsTools/UtilAlgos root
PhysicsToolsPatAlgos_testAnalyzers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatAlgos_testAnalyzers,PhysicsToolsPatAlgos_testAnalyzers,$(SCRAMSTORENAME_LIB)))
PhysicsToolsPatAlgos_testAnalyzers_PACKAGE := self/src/PhysicsTools/PatAlgos/test
ALL_PRODS += PhysicsToolsPatAlgos_testAnalyzers
PhysicsToolsPatAlgos_testAnalyzers_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatAlgos_testAnalyzers,src/PhysicsTools/PatAlgos/test,src_PhysicsTools_PatAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(if $(PhysicsToolsPatAlgos_testAnalyzers_files_exts),$(PhysicsToolsPatAlgos_testAnalyzers_files_exts),$(SRC_FILES_SUFFIXES))))
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatAlgos_testAnalyzers,src/PhysicsTools/PatAlgos/test))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_test
src_PhysicsTools_PatAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_test,src/PhysicsTools/PatAlgos/test,TEST))
