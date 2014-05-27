//==========================================================================
// This file has been automatically generated for C++ Standalone
// MadGraph 5 v. 1.5.9, 2013-04-01
// By the MadGraph Development Team
// Please visit us at https://launchpad.net/madgraph5
//==========================================================================

#ifndef HelAmps_HEF_MEKD_spinX_H
#define HelAmps_HEF_MEKD_spinX_H

#include <cmath> 
#include <complex> 

using namespace std; 

namespace MG5_HEF_MEKD_spinX
{
double Sgn(double e, double f); 

void oxxxxx(double p[4], double fmass, int nhel, int nsf, std::complex<double>
    fo[6]);

void vxxxxx(double p[4], double vmass, int nhel, int nsv, std::complex<double>
    v[6]);

void txxxxx(double p[4], double tmass, int nhel, int nst, std::complex<double>
    tc[18]);

void sxxxxx(double p[4], int nss, std::complex<double> sc[3]); 

void ixxxxx(double p[4], double fmass, int nhel, int nsf, std::complex<double>
    fi[6]);

void VVS2_0(complex<double> V1[], complex<double> V2[], complex<double> S3[],
    complex<double> COUP, complex<double> & vertex);

void FFV2_2(complex<double> F1[], complex<double> V3[], complex<double> COUP,
    double M2, double W2, complex<double> F2[]);

void VVT12_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void FFV5_3(complex<double> F1[], complex<double> F2[], complex<double> COUP,
    double M3, double W3, complex<double> V3[]);
void FFV5_7_3(complex<double> F1[], complex<double> F2[], complex<double>
    COUP1, complex<double> COUP2, double M3, double W3, complex<double> V3[]);

void VVV2_0(complex<double> V1[], complex<double> V2[], complex<double> V3[],
    complex<double> COUP, complex<double> & vertex);

void VVT11_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void VVV1_0(complex<double> V1[], complex<double> V2[], complex<double> V3[],
    complex<double> COUP, complex<double> & vertex);
void VVV1_2_0(complex<double> V1[], complex<double> V2[], complex<double> V3[],
    complex<double> COUP1, complex<double> COUP2, complex<double> & vertex);

void VVT2_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void VVS5_0(complex<double> V1[], complex<double> V2[], complex<double> S3[],
    complex<double> COUP, complex<double> & vertex);

void VVT13_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void VVT8_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void VVT7_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void FFV7_3(complex<double> F1[], complex<double> F2[], complex<double> COUP,
    double M3, double W3, complex<double> V3[]);

void FFV2_1(complex<double> F2[], complex<double> V3[], complex<double> COUP,
    double M1, double W1, complex<double> F1[]);

void VVS3_0(complex<double> V1[], complex<double> V2[], complex<double> S3[],
    complex<double> COUP, complex<double> & vertex);
void VVS3_4_5_0(complex<double> V1[], complex<double> V2[], complex<double>
    S3[], complex<double> COUP1, complex<double> COUP2, complex<double> COUP3,
    complex<double> & vertex);

void VVT3_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void VVS4_0(complex<double> V1[], complex<double> V2[], complex<double> S3[],
    complex<double> COUP, complex<double> & vertex);

void VVT10_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);
void VVT10_11_12_13_2_3_6_7_8_9_0(complex<double> V1[], complex<double> V2[],
    complex<double> T3[], complex<double> COUP1, complex<double> COUP2,
    complex<double> COUP3, complex<double> COUP4, complex<double> COUP5,
    complex<double> COUP6, complex<double> COUP7, complex<double> COUP8,
    complex<double> COUP9, complex<double> COUP10, complex<double> & vertex);

void VVT9_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

void VVT6_0(complex<double> V1[], complex<double> V2[], complex<double> T3[],
    complex<double> COUP, complex<double> & vertex);

}  // end namespace MG5_HEF_MEK

#endif  // HelAmps_HEF_MEKD_H
