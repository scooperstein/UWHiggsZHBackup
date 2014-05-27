ifeq ($(strip $(testCaloCluster)),)
testCaloCluster_files := $(patsubst src/DataFormats/CaloRecHit/test/%,%,$(foreach file,testRunner.cpp testCaloCluster.cppunit.cc,$(eval xfile:=$(wildcard src/DataFormats/CaloRecHit/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/DataFormats/CaloRecHit/test/$(file). Please fix src/DataFormats/CaloRecHit/test/BuildFile.))))
testCaloCluster := self/src/DataFormats/CaloRecHit/test
testCaloCluster_TEST_RUNNER_CMD :=  testCaloCluster 
testCaloCluster_BuildFile    := $(WORKINGDIR)/cache/bf/src/DataFormats/CaloRecHit/test/BuildFile
testCaloCluster_LOC_USE   := self DataFormats/CaloRecHit DataFormats/Math cppunit
testCaloCluster_PACKAGE := self/src/DataFormats/CaloRecHit/test
ALL_PRODS += testCaloCluster
testCaloCluster_INIT_FUNC        += $$(eval $$(call Binary,testCaloCluster,src/DataFormats/CaloRecHit/test,src_DataFormats_CaloRecHit_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),$(sort $(patsubst .%,%,$(suffix $(testCaloCluster_files)))),test,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,testCaloCluster,src/DataFormats/CaloRecHit/test))
endif
ALL_COMMONRULES += src_DataFormats_CaloRecHit_test
src_DataFormats_CaloRecHit_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_DataFormats_CaloRecHit_test,src/DataFormats/CaloRecHit/test,TEST))
