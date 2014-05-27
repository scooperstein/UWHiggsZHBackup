/*
 * MEKD Test Suite 1
 * 
 * It is not the technology show-off and the class is NOT used in the optimal way
 * 
 */


// C++ includes
#include <iostream>
#include <vector>
#include <cmath>

/// ME calculator
#include "../src/MEKD.cpp"

/// ROOT includes
#if (defined MEKD_STANDALONE && defined MEKD_with_ROOT) || !defined MEKD_STANDALONE
// ROOT includes
#include "TFile.h"
#include "TLorentzVector.h"
#include "TMath.h"
#include "TROOT.h"
#include "TString.h"
#include "TSystem.h"	// For the workaround for >> "Warning in <TClass::TClass>: no dictionary for class...
#include "TTree.h"
#include "TTreeIndex.h"
#endif



double Precision_of_interest = 1E-12;




int main()
{
	gSystem->Load("libTree");	// A workaround for >> "Warning in <TClass::TClass>: no dictionary for class ...
	
	
	cout.setf( ios_base::scientific );
	cout.precision( 8 );
	
	
	double p1[4], p2[4], p3[4], p4[4];
	int id1=11, id2=-11, id3=13, id4=-13;
	
	p1[0] = 15.256290484000001;
	p1[1] = 8.6394505145000000;
	p1[2] = 8.4375424780999992;
	p1[3] = 9.3232060364000002;
	
	p2[0] = 24.535694836000001;
	p2[1] = 10.740685492000001;
	p2[2] = 0.10512935225000000;
	p2[3] = 22.059622477000001;
	
	p3[0] = 96.282168608999996;
	p3[1] = -40.605831017000000;
	p3[2] = -34.322569567000002;
	p3[3] = 80.270620613000006;
	
	p4[0] = 144.24476946999999;
	p4[1] = 21.225695010999999;
	p4[2] = 25.779897736999999;
	p4[3] = 140.32608132999999;
	
	
	/// TEST Block "on the fly"
	
// 	bool Test1_pass=false, test2_pass=false, test3_pass=false, test4_pass=false;
	
	cout << "\n ---------------------------------------- \n";
	cout << " -- Testing KD calculations on the fly -- \n";
	cout << " ---------------------------------------- \n";
	
	
	/// TEST 1
	cout << "\n -- STARTING TEST 1 -- \n";
	double KD1, ME11, ME21;
	MEKD test1;
	
	cout << "Testing int computeKD( string, string, double[], int, double[], int, double[], int, double[], int, double&, double&, double& );\n";
	
	test1.computeKD( (string) "SMHiggs", (string) "ZZ", p1, id1, p2, id2, p3, id3, p4, id4, KD1, ME11, ME21 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME11 << " " << ME21 << " " << KD1 << endl;
	
	
	
	/// TEST 2
	cout << "\n -- STARTING TEST 2 -- \n";
	double KD2, ME12, ME22;
	MEKD test2;
	
	vector<double*> Set_Of_Arrays;
	vector<int> Set_Of_IDs;
	
	Set_Of_Arrays.push_back( p1 );
	Set_Of_Arrays.push_back( p2 );
	Set_Of_Arrays.push_back( p3 );
	Set_Of_Arrays.push_back( p4 );
	
	Set_Of_IDs.push_back( id1 );
	Set_Of_IDs.push_back( id2 );
	Set_Of_IDs.push_back( id3 );
	Set_Of_IDs.push_back( id4 );
	
	
	cout << "Testing int computeKD( string, string, vector<double*>, vector<int>, double&, double&, double& );\n";
	
	test2.computeKD( (string) "SMHiggs", (string) "ZZ", Set_Of_Arrays, Set_Of_IDs, KD2, ME12, ME22 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME12 << " " << ME22 << " " << KD2 << endl;
	
	
	
	/// TEST 3
	cout << "\n -- STARTING TEST 3 -- \n";
	double KD3, ME13, ME23;
	MEKD test3;
	
	TLorentzVector Lp1, Lp2, Lp3, Lp4;
	
	Lp1.SetPxPyPzE( p1[1], p1[2], p1[3], p1[0] );
	Lp2.SetPxPyPzE( p2[1], p2[2], p2[3], p2[0] );
	Lp3.SetPxPyPzE( p3[1], p3[2], p3[3], p3[0] );
	Lp4.SetPxPyPzE( p4[1], p4[2], p4[3], p4[0] );
	
	
	cout << "Testing int computeKD( TString, TString, TLorentzVector, int, TLorentzVector, int, TLorentzVector, int, TLorentzVector, int, double&, double&, double& );\n";
	
	test3.computeKD( (TString) "SMHiggs", (TString) "ZZ", Lp1, id1, Lp2, id2, Lp3, id3, Lp4, id4, KD3, ME13, ME23 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME13 << " " << ME23 << " " << KD3 << endl;
	
	
	
	/// TEST 4
	cout << "\n -- STARTING TEST 4 -- \n";
	double KD4, ME14, ME24;
	MEKD test4;
	
	vector<TLorentzVector> Set_Of_TLorentzVectors;
	
	Set_Of_TLorentzVectors.push_back( Lp1 );
	Set_Of_TLorentzVectors.push_back( Lp2 );
	Set_Of_TLorentzVectors.push_back( Lp3 );
	Set_Of_TLorentzVectors.push_back( Lp4 );
	
	
	cout << "Testing int computeKD( TString, TString, vector<TLorentzVector>, vector<int>, double&, double&, double& );\n";
	
	test4.computeKD( (TString) "SMHiggs", (TString) "ZZ", Set_Of_TLorentzVectors, Set_Of_IDs, KD4, ME14, ME24 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME14 << " " << ME24 << " " << KD4 << endl;
	
	
	
	/// TESTs Results
	cout << "\nTEST 1: REFERENCE\n";
	cout << "TEST 2: ";
	if( fabs(KD1-KD2) < Precision_of_interest && fabs(ME11-ME12) < Precision_of_interest && fabs(ME21-ME22) < Precision_of_interest )
		cout << "PASSED\n";
	else cout << "FAILED\n";
	
	cout << "TEST 3: ";
	if( fabs(KD1-KD3) < Precision_of_interest && fabs(ME11-ME13) < Precision_of_interest && fabs(ME21-ME23) < Precision_of_interest )
		cout << "PASSED\n";
	else cout << "FAILED\n";
	
	cout << "TEST 4: ";
	if( fabs(KD1-KD4) < Precision_of_interest && fabs(ME11-ME14) < Precision_of_interest && fabs(ME21-ME24) < Precision_of_interest )
		cout << "PASSED\n";
	else cout << "FAILED\n";
	
	
	/// TEST Block "precalculated"
	
// 	bool Test1_pass=false, test2_pass=false, test3_pass=false, test4_pass=false;
	
	cout << "\n ---------------------------------------------------- \n";
	cout << " -- Testing KD calculations from precalculated MEs -- \n";
	cout << " ---------------------------------------------------- \n";
	
	
	/// TEST 1
	cout << "\n -- STARTING TEST 1 -- \n";
	double KD1_p2, ME11_p2, ME21_p2;
	MEKD test1_p2;
	
	cout << "Testing int computeMEs( double[], int, double[], int, double[], int, double[], int );\n";
	
	test1_p2.computeMEs( p1, id1, p2, id2, p3, id3, p4, id4 );
	test1_p2.computeKD( (string) "SMHiggs", (string) "ZZ", KD1_p2, ME11_p2, ME21_p2 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME11_p2 << " " << ME21_p2 << " " << KD1_p2 << endl;
	
	
	
	/// TEST 2
	cout << "\n -- STARTING TEST 2 -- \n";
	double KD2_p2, ME12_p2, ME22_p2;
	MEKD test2_p2;
	
	cout << "Testing int computeMEs( vector<double*>, vector<int> );\n";
	
	test2_p2.computeMEs( Set_Of_Arrays, Set_Of_IDs );
	test2_p2.computeKD( (string) "SMHiggs", (string) "ZZ", KD2_p2, ME12_p2, ME22_p2 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME12_p2 << " " << ME22_p2 << " " << KD2_p2 << endl;
	
	
	
	/// TEST 3
	cout << "\n -- STARTING TEST 3 -- \n";
	double KD3_p2, ME13_p2, ME23_p2;
	MEKD test3_p2;
	
	cout << "Testing int computeMEs( TLorentzVector, int, TLorentzVector, int, TLorentzVector, int, TLorentzVector, int );\n";
	
	test3_p2.computeMEs( Lp1, id1, Lp2, id2, Lp3, id3, Lp4, id4 );
	test3_p2.computeKD( (string) "SMHiggs", (string) "ZZ", KD3_p2, ME13_p2, ME23_p2 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME13_p2 << " " << ME23_p2 << " " << KD3_p2 << endl;
	
	
	
	/// TEST 4
	cout << "\n -- STARTING TEST 4 -- \n";
	double KD4_p2, ME14_p2, ME24_p2;
	MEKD test4_p2;
	
	cout << "Testing int computeMEs( vector<TLorentzVector>, vector<int> );\n";
	
	test4_p2.computeMEs( Set_Of_TLorentzVectors, Set_Of_IDs );
	test4_p2.computeKD( (string) "SMHiggs", (string) "ZZ", KD4_p2, ME14_p2, ME24_p2 );
	
	cout << "Output: ME1 ME2 KD\n";
	cout << ME14_p2 << " " << ME24_p2 << " " << KD4_p2 << endl;
	
	
	
	/// TESTs Results
	cout << "\nTEST 1: ";
	if( fabs(KD1-KD1_p2) < Precision_of_interest && fabs(ME11-ME11_p2) < Precision_of_interest && fabs(ME21-ME21_p2) < Precision_of_interest )
		cout << "PASSED\n";
	else cout << "FAILED\n";
	
	cout << "TEST 2: ";
	if( fabs(KD1-KD2_p2) < Precision_of_interest && fabs(ME11-ME12_p2) < Precision_of_interest && fabs(ME21-ME22_p2) < Precision_of_interest )
		cout << "PASSED\n";
	else cout << "FAILED\n";
	
	cout << "TEST 3: ";
	if( fabs(KD1-KD3_p2) < Precision_of_interest && fabs(ME11-ME13_p2) < Precision_of_interest && fabs(ME21-ME23_p2) < Precision_of_interest )
		cout << "PASSED\n";
	else cout << "FAILED\n";
	
	cout << "TEST 4: ";
	if( fabs(KD1-KD4_p2) < Precision_of_interest && fabs(ME11-ME14_p2) < Precision_of_interest && fabs(ME21-ME24_p2) < Precision_of_interest )
		cout << "PASSED\n";
	else cout << "FAILED\n";
	
	
	return 0;
}