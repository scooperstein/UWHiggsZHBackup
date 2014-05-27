LIBDIR=lib
INCDIR1=../src
INCDIR2=../src/Extra_code
INCDIR3=../src/higgs_properties
INCDIR4=../src/MadGraphSrc
INCDIR5=../interface
PDF_DIR=../src/PDFTables
CXXFLAGS= -pedantic -Wunused-variable -Werror=sign-compare -Wunused-but-set-variable -fPIC -O -I$(INCDIR1) -I$(INCDIR2) -I$(INCDIR3) -I$(INCDIR4) -I$(INCDIR5) -I.
CFLAGS= -pedantic -Wunused-variable -Werror=sign-compare -Wunused-but-set-variable -fPIC -std=c99
LIBFLAGS= -L$(LIBDIR)
UNAME := $(shell uname)

########## ROOT PART ##########
ROOTLIB=$(ROOTSYS)/lib
ROOTINCLUDES=$(ROOTSYS)/include
###############################

objects1_bkg=$(INCDIR4)/BKG_DN_OF.o $(INCDIR4)/BKG_UP_OF.o $(INCDIR4)/BKG_DN_SF.o $(INCDIR4)/BKG_UP_SF.o $(INCDIR4)/BKG_DN_OFpA.o $(INCDIR4)/BKG_UP_OFpA.o $(INCDIR4)/BKG_DN_SFpA.o $(INCDIR4)/BKG_UP_SFpA.o

objects1_spin0=$(INCDIR4)/Spin0_gg_OF.o $(INCDIR4)/Spin0_gg_SF.o $(INCDIR4)/Spin0_gg_OFpA.o $(INCDIR4)/Spin0_gg_SFpA.o $(INCDIR4)/Spin0_qq_DN_OF.o $(INCDIR4)/Spin0_qq_UP_OF.o $(INCDIR4)/Spin0_qq_DN_SF.o $(INCDIR4)/Spin0_qq_UP_SF.o $(INCDIR4)/Spin0_qq_DN_OFpA.o $(INCDIR4)/Spin0_qq_UP_OFpA.o $(INCDIR4)/Spin0_qq_DN_SFpA.o $(INCDIR4)/Spin0_qq_UP_SFpA.o

objects1_spin1=$(INCDIR4)/Spin1_DN_OF.o $(INCDIR4)/Spin1_UP_OF.o $(INCDIR4)/Spin1_DN_SF.o $(INCDIR4)/Spin1_UP_SF.o $(INCDIR4)/Spin1_DN_OFpA.o $(INCDIR4)/Spin1_UP_OFpA.o $(INCDIR4)/Spin1_DN_SFpA.o $(INCDIR4)/Spin1_UP_SFpA.o

objects1_spin2=$(INCDIR4)/Spin2_gg_OF.o $(INCDIR4)/Spin2_gg_SF.o $(INCDIR4)/Spin2_gg_OFpA.o $(INCDIR4)/Spin2_gg_SFpA.o $(INCDIR4)/Spin2_qq_DN_OF.o $(INCDIR4)/Spin2_qq_UP_OF.o $(INCDIR4)/Spin2_qq_DN_SF.o $(INCDIR4)/Spin2_qq_UP_SF.o $(INCDIR4)/Spin2_qq_DN_OFpA.o $(INCDIR4)/Spin2_qq_UP_OFpA.o $(INCDIR4)/Spin2_qq_DN_SFpA.o $(INCDIR4)/Spin2_qq_UP_SFpA.o


objects2=$(INCDIR4)/HelAmps_HEF_UFO_bkg.o $(INCDIR4)/HelAmps_HEF_MEKD_spin0.o $(INCDIR4)/HelAmps_HEF_MEKD_spin1.o $(INCDIR4)/HelAmps_HEF_MEKD_spin2.o $(INCDIR4)/HelAmps_HZZ_Unitary_bkgpA.o $(INCDIR4)/HelAmps_HEF_MEKD_spin0pA.o $(INCDIR4)/HelAmps_HEF_MEKD_spin1pA.o $(INCDIR4)/HelAmps_HEF_MEKD_spin2pA.o $(INCDIR4)/Parameters_HEF_MEKD.o $(INCDIR4)/read_slha.o

objects3=$(INCDIR2)/MEKD_CalcHEP_PDF.o $(INCDIR2)/MEKD_CalcHEP_Extra_functions.o $(INCDIR2)/MEKD_MG_Boosts.o $(INCDIR3)/hggeffective.o $(PDF_DIR)/pdt.o

objects4=$(INCDIR1)/MEKD_MG.o


objects1=$(objects1_bkg) $(objects1_spin0) $(objects1_spin1) $(objects1_spin2)

objects=$(objects1) $(objects2) $(objects3) $(objects4)


targetlib=$(LIBDIR)/libMEKD_MG.so
target=runKD_MAD
test=MEKD_test



test: $(test)

# all: $(target)




############################
### Linux building block ###
############################

ifeq ($(UNAME), Linux)
# do something Linux-y
ifeq ($(MEKD_STANDALONE), Yes)
CXXFLAGS+= -D MEKD_STANDALONE
endif
$(targetlib): $(objects)
	$(CXX) $(CXXFLAGS) -fPIC -shared -Wl,-soname,libMEKD_MG.so -o $(targetlib) $(objects) $(LIBFLAGS)


ifeq ($(MEKD_COMPILE_WITH_ROOT), Yes)
CXXFLAGS+= -D MEKD_with_ROOT -std=c++0x

$(target): $(targetlib)
	$(CXX) $(CXXFLAGS) `$(ROOTSYS)/bin/root-config --ldflags` -I $(ROOTINCLUDES) $(target).cpp -o $(target) -L. $(LIBFLAGS) -L $(ROOTLIB) `$(ROOTSYS)/bin/root-config --libs --glibs` $(targetlib)

$(test): $(targetlib)
	$(CXX) $(CXXFLAGS) `$(ROOTSYS)/bin/root-config --ldflags` -I $(ROOTINCLUDES) $(test).cpp -o $(test) -L. $(LIBFLAGS) -L $(ROOTLIB) `$(ROOTSYS)/bin/root-config --libs --glibs` $(targetlib)
else
$(target): $(targetlib)
	$(CXX) $(CXXFLAGS) $(target).cpp -o $(target) -L. $(LIBFLAGS) $(targetlib)

$(test): $(targetlib)
	$(CXX) $(CXXFLAGS) $(test).cpp -o $(test) -L. $(LIBFLAGS) $(targetlib)
endif

endif




#############################
### Mac OS building block ###
#############################

ifeq ($(UNAME), $(filter $(UNAME),OSX Darwin))
# do something OSX-y
ifeq ($(MEKD_STANDALONE), Yes)
CXXFLAGS+= -D MEKD_STANDALONE
endif
$(targetlib): $(objects)
	$(CXX) $(CXXFLAGS) -shared -Wl,-install_name,libMEKD_MG.so -o $(targetlib) $(objects) $(LIBFLAGS)


ifeq ($(MEKD_COMPILE_WITH_ROOT), Yes)
CXXFLAGS+= -D MEKD_with_ROOT -std=c++0x
$(target): $(targetlib)
	$(CXX) $(CXXFLAGS) `$(ROOTSYS)/bin/root-config --ldflags` -I $(ROOTINCLUDES) $(target).cpp -o $(target) -L. $(LIBFLAGS) -L $(ROOTLIB) `$(ROOTSYS)/bin/root-config --libs --glibs` $(targetlib)

$(test): $(targetlib)
	$(CXX) $(CXXFLAGS) `$(ROOTSYS)/bin/root-config --ldflags` -I $(ROOTINCLUDES) $(test).cpp -o $(test) -L. $(LIBFLAGS) -L $(ROOTLIB) `$(ROOTSYS)/bin/root-config --libs --glibs` $(targetlib)
else
$(target): $(targetlib)
	$(CXX) $(CXXFLAGS) $(target).cpp -o $(target) -L. $(LIBFLAGS) $(targetlib)

$(test): $(targetlib)
	$(CXX) $(CXXFLAGS) $(test).cpp -o $(test) -L. $(LIBFLAGS) $(targetlib)
endif

endif



.PHONY: clean

clean:
	rm -f $(targetlib); \
	rm -f $(target); \
	rm -f $(test); \
	rm -f $(objects)
