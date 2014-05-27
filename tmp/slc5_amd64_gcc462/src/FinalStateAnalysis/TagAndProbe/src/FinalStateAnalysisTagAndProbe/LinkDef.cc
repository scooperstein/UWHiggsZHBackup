/*
 * =====================================================================================
 *
 *       Filename:  LinkDef.h
 *
 *    Description:  Make C++ correction functions visible to ROOT
 *
 *         Author:  Evan Friis (), evan.friis@cern.ch
 *        Company:  UW Madison
 *
 * =====================================================================================
 */

#include "FinalStateAnalysis/TagAndProbe/interface/MuonPOG2011HLTEfficiencies.h"
#include "FinalStateAnalysis/TagAndProbe/interface/ScaleFactorsMuEG201253X.h"

#ifdef __CINT__
#pragma link off all globals;
#pragma link off all classes;
#pragma link off all functions;
#pragma link C++ function Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_DATA;
#pragma link C++ function Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_MC;
#pragma link C++ function Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_DATAoverMC;
#pragma link C++ function Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_DATA;
#pragma link C++ function Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_MC;
#pragma link C++ function Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_DATAoverMC;

#pragma link C++ function muTrigScale_MuEG_2012_53X;
#pragma link C++ function eleTrigScale_MuEG_2012_53X;
#pragma link C++ function muTrigEff_MuEG_2012_53X;
#pragma link C++ function eleTrigEff_MuEG_2012_53X;
#pragma link C++ function muIDscale_MuEG_2012_53X;
#pragma link C++ function eleIDscale_MuEG_2012_53X;

#endif
//
// File generated by /cvmfs/cms.cern.ch/slc5_amd64_gcc462/lcg/root/5.32.00-cms21/bin/rootcint at Fri Feb 28 12:37:49 2014

// Do NOT change. Changes will be lost next time file is generated
//

#define R__DICTIONARY_FILENAME tmpdIslc5_amd64_gcc462dIsrcdIFinalStateAnalysisdITagAndProbedIsrcdIFinalStateAnalysisTagAndProbedILinkDef
#include "RConfig.h" //rootcint 4834
#if !defined(R__ACCESS_IN_SYMBOL)
//Break the privacy of classes -- Disabled for the moment
#define private public
#define protected public
#endif

// Since CINT ignores the std namespace, we need to do so in this file.
namespace std {} using namespace std;
#include "LinkDef.h"

#include "TClass.h"
#include "TBuffer.h"
#include "TMemberInspector.h"
#include "TError.h"

#ifndef G__ROOT
#define G__ROOT
#endif

#include "RtypesImp.h"
#include "TIsAProxy.h"
#include "TFileMergeInfo.h"

// START OF SHADOWS

namespace ROOT {
   namespace Shadow {
   } // of namespace Shadow
} // of namespace ROOT
// END OF SHADOWS

/********************************************************
* tmp/slc5_amd64_gcc462/src/FinalStateAnalysis/TagAndProbe/src/FinalStateAnalysisTagAndProbe/LinkDef.cc
* CAUTION: DON'T CHANGE THIS FILE. THIS FILE IS AUTOMATICALLY GENERATED
*          FROM HEADER FILES LISTED IN G__setup_cpp_environmentXXX().
*          CHANGE THOSE HEADER FILES AND REGENERATE THIS FILE.
********************************************************/

#ifdef G__MEMTEST
#undef malloc
#undef free
#endif

#if defined(__GNUC__) && __GNUC__ >= 4 && ((__GNUC_MINOR__ == 2 && __GNUC_PATCHLEVEL__ >= 1) || (__GNUC_MINOR__ >= 3))
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif

extern "C" void G__cpp_reset_tagtableLinkDef();

extern "C" void G__set_cpp_environmentLinkDef() {
  G__cpp_reset_tagtableLinkDef();
}
#include <new>
extern "C" int G__cpp_dllrevLinkDef() { return(30051515); }

/*********************************************************
* Member function Interface Method
*********************************************************/

/* Setting up global function */
static int G__LinkDef__0_1290(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_DATA((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1291(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_MC((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1292(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_DATAoverMC((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1293(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_DATA((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1294(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_MC((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1295(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_DATAoverMC((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1296(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) muTrigScale_MuEG_2012_53X((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1297(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) eleTrigScale_MuEG_2012_53X((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1298(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) muTrigEff_MuEG_2012_53X((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1299(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) eleTrigEff_MuEG_2012_53X((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1300(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) muIDscale_MuEG_2012_53X((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}

static int G__LinkDef__0_1301(G__value* result7, G__CONST char* funcname, struct G__param* libp, int hash)
{
      G__letdouble(result7, 100, (double) eleIDscale_MuEG_2012_53X((Double_t) G__double(libp->para[0]), (Double_t) G__double(libp->para[1])));
   return(1 || funcname || hash || result7 || libp) ;
}


/*********************************************************
* Member function Stub
*********************************************************/

/*********************************************************
* Global function Stub
*********************************************************/

/*********************************************************
* Get size of pointer to member function
*********************************************************/
class G__Sizep2memfuncLinkDef {
 public:
  G__Sizep2memfuncLinkDef(): p(&G__Sizep2memfuncLinkDef::sizep2memfunc) {}
    size_t sizep2memfunc() { return(sizeof(p)); }
  private:
    size_t (G__Sizep2memfuncLinkDef::*p)();
};

size_t G__get_sizep2memfuncLinkDef()
{
  G__Sizep2memfuncLinkDef a;
  G__setsizep2memfunc((int)a.sizep2memfunc());
  return((size_t)a.sizep2memfunc());
}


/*********************************************************
* virtual base class offset calculation interface
*********************************************************/

   /* Setting up class inheritance */

/*********************************************************
* Inheritance information setup/
*********************************************************/
extern "C" void G__cpp_setup_inheritanceLinkDef() {

   /* Setting up class inheritance */
}

/*********************************************************
* typedef information setup/
*********************************************************/
extern "C" void G__cpp_setup_typetableLinkDef() {

   /* Setting up typedef entry */
   G__search_typename2("Double_t",100,-1,0,-1);
   G__setnewtype(-1,"Double 8 bytes",0);
   G__search_typename2("vector<ROOT::TSchemaHelper>",117,G__get_linked_tagnum(&G__LinkDefLN_vectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgR),0,-1);
   G__setnewtype(-1,NULL,0);
   G__search_typename2("reverse_iterator<const_iterator>",117,G__get_linked_tagnum(&G__LinkDefLN_reverse_iteratorlEvectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgRcLcLiteratorgR),0,G__get_linked_tagnum(&G__LinkDefLN_vectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgR));
   G__setnewtype(-1,NULL,0);
   G__search_typename2("reverse_iterator<iterator>",117,G__get_linked_tagnum(&G__LinkDefLN_reverse_iteratorlEvectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgRcLcLiteratorgR),0,G__get_linked_tagnum(&G__LinkDefLN_vectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgR));
   G__setnewtype(-1,NULL,0);
   G__search_typename2("vector<TVirtualArray*>",117,G__get_linked_tagnum(&G__LinkDefLN_vectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgR),0,-1);
   G__setnewtype(-1,NULL,0);
   G__search_typename2("reverse_iterator<const_iterator>",117,G__get_linked_tagnum(&G__LinkDefLN_reverse_iteratorlEvectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgRcLcLiteratorgR),0,G__get_linked_tagnum(&G__LinkDefLN_vectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgR));
   G__setnewtype(-1,NULL,0);
   G__search_typename2("reverse_iterator<iterator>",117,G__get_linked_tagnum(&G__LinkDefLN_reverse_iteratorlEvectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgRcLcLiteratorgR),0,G__get_linked_tagnum(&G__LinkDefLN_vectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgR));
   G__setnewtype(-1,NULL,0);
}

/*********************************************************
* Data Member information setup/
*********************************************************/

   /* Setting up class,struct,union tag member variable */
extern "C" void G__cpp_setup_memvarLinkDef() {
}
/***********************************************************
************************************************************
************************************************************
************************************************************
************************************************************
************************************************************
************************************************************
***********************************************************/

/*********************************************************
* Member function information setup for each class
*********************************************************/

/*********************************************************
* Member function information setup
*********************************************************/
extern "C" void G__cpp_setup_memfuncLinkDef() {
}

/*********************************************************
* Global variable information setup for each class
*********************************************************/
static void G__cpp_setup_global0() {

   /* Setting up global variables */
   G__resetplocal();

}

static void G__cpp_setup_global1() {

   G__resetglobalenv();
}
extern "C" void G__cpp_setup_globalLinkDef() {
  G__cpp_setup_global0();
  G__cpp_setup_global1();
}

/*********************************************************
* Global function information setup for each class
*********************************************************/
static void G__cpp_setup_func0() {
   G__lastifuncposition();

}

static void G__cpp_setup_func1() {
}

static void G__cpp_setup_func2() {
}

static void G__cpp_setup_func3() {
}

static void G__cpp_setup_func4() {
}

static void G__cpp_setup_func5() {
}

static void G__cpp_setup_func6() {
}

static void G__cpp_setup_func7() {
}

static void G__cpp_setup_func8() {
}

static void G__cpp_setup_func9() {
}

static void G__cpp_setup_func10() {
}

static void G__cpp_setup_func11() {
}

static void G__cpp_setup_func12() {
   G__memfunc_setup("Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_DATA", 3778, G__LinkDef__0_1290, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - eta1 d - 'Double_t' 0 - eta2", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_MC", 3640, G__LinkDef__0_1291, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - eta1 d - 'Double_t' 0 - eta2", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("Eff_HLT_Mu13_Mu8_2011_TPfit_RunAB_EtaEta_DATAoverMC", 4366, G__LinkDef__0_1292, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - eta1 d - 'Double_t' 0 - eta2", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_DATA", 3782, G__LinkDef__0_1293, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - eta1 d - 'Double_t' 0 - eta2", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_MC", 3644, G__LinkDef__0_1294, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - eta1 d - 'Double_t' 0 - eta2", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("Eff_HLT_Mu17_Mu8_2011_TPfit_RunAB_EtaEta_DATAoverMC", 4370, G__LinkDef__0_1295, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - eta1 d - 'Double_t' 0 - eta2", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("muTrigScale_MuEG_2012_53X", 2128, G__LinkDef__0_1296, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - mupt d - 'Double_t' 0 - mueta", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("eleTrigScale_MuEG_2012_53X", 2212, G__LinkDef__0_1297, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - elept d - 'Double_t' 0 - eleeta", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("muTrigEff_MuEG_2012_53X", 1913, G__LinkDef__0_1298, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - mupt d - 'Double_t' 0 - mueta", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("eleTrigEff_MuEG_2012_53X", 1997, G__LinkDef__0_1299, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - elept d - 'Double_t' 0 - eleeta", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("muIDscale_MuEG_2012_53X", 1895, G__LinkDef__0_1300, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - mupt d - 'Double_t' 0 - mueta", (char*) NULL
, (void*) NULL, 0);
   G__memfunc_setup("eleIDscale_MuEG_2012_53X", 1979, G__LinkDef__0_1301, 100, -1, G__defined_typename("Double_t"), 0, 2, 1, 1, 0, 
"d - 'Double_t' 0 - elept d - 'Double_t' 0 - eleeta", (char*) NULL
, (void*) NULL, 0);

   G__resetifuncposition();
}

extern "C" void G__cpp_setup_funcLinkDef() {
  G__cpp_setup_func0();
  G__cpp_setup_func1();
  G__cpp_setup_func2();
  G__cpp_setup_func3();
  G__cpp_setup_func4();
  G__cpp_setup_func5();
  G__cpp_setup_func6();
  G__cpp_setup_func7();
  G__cpp_setup_func8();
  G__cpp_setup_func9();
  G__cpp_setup_func10();
  G__cpp_setup_func11();
  G__cpp_setup_func12();
}

/*********************************************************
* Class,struct,union,enum tag information setup
*********************************************************/
/* Setup class/struct taginfo */
G__linked_taginfo G__LinkDefLN_vectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgR = { "vector<ROOT::TSchemaHelper,allocator<ROOT::TSchemaHelper> >" , 99 , -1 };
G__linked_taginfo G__LinkDefLN_reverse_iteratorlEvectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgRcLcLiteratorgR = { "reverse_iterator<vector<ROOT::TSchemaHelper,allocator<ROOT::TSchemaHelper> >::iterator>" , 99 , -1 };
G__linked_taginfo G__LinkDefLN_vectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgR = { "vector<TVirtualArray*,allocator<TVirtualArray*> >" , 99 , -1 };
G__linked_taginfo G__LinkDefLN_reverse_iteratorlEvectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgRcLcLiteratorgR = { "reverse_iterator<vector<TVirtualArray*,allocator<TVirtualArray*> >::iterator>" , 99 , -1 };

/* Reset class/struct taginfo */
extern "C" void G__cpp_reset_tagtableLinkDef() {
  G__LinkDefLN_vectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgR.tagnum = -1 ;
  G__LinkDefLN_reverse_iteratorlEvectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgRcLcLiteratorgR.tagnum = -1 ;
  G__LinkDefLN_vectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgR.tagnum = -1 ;
  G__LinkDefLN_reverse_iteratorlEvectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgRcLcLiteratorgR.tagnum = -1 ;
}


extern "C" void G__cpp_setup_tagtableLinkDef() {

   /* Setting up class,struct,union tag entry */
   G__get_linked_tagnum_fwd(&G__LinkDefLN_vectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgR);
   G__get_linked_tagnum_fwd(&G__LinkDefLN_reverse_iteratorlEvectorlEROOTcLcLTSchemaHelpercOallocatorlEROOTcLcLTSchemaHelpergRsPgRcLcLiteratorgR);
   G__get_linked_tagnum_fwd(&G__LinkDefLN_vectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgR);
   G__get_linked_tagnum_fwd(&G__LinkDefLN_reverse_iteratorlEvectorlETVirtualArraymUcOallocatorlETVirtualArraymUgRsPgRcLcLiteratorgR);
}
extern "C" void G__cpp_setupLinkDef(void) {
  G__check_setup_version(30051515,"G__cpp_setupLinkDef()");
  G__set_cpp_environmentLinkDef();
  G__cpp_setup_tagtableLinkDef();

  G__cpp_setup_inheritanceLinkDef();

  G__cpp_setup_typetableLinkDef();

  G__cpp_setup_memvarLinkDef();

  G__cpp_setup_memfuncLinkDef();
  G__cpp_setup_globalLinkDef();
  G__cpp_setup_funcLinkDef();

   if(0==G__getsizep2memfunc()) G__get_sizep2memfuncLinkDef();
  return;
}
class G__cpp_setup_initLinkDef {
  public:
    G__cpp_setup_initLinkDef() { G__add_setup_func("LinkDef",(G__incsetup)(&G__cpp_setupLinkDef)); G__call_setup_funcs(); }
   ~G__cpp_setup_initLinkDef() { G__remove_setup_func("LinkDef"); }
};
G__cpp_setup_initLinkDef G__cpp_setup_initializerLinkDef;
