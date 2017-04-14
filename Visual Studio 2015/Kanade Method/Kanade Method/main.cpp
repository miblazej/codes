
// To turn off the warning
#define _CRT_SECURE_NO_WARNINGS
// Includes
#include <cassert>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <stdexcept>

// Include local files 
#include "CFilter.h"
#include "CMatrix.h"
#include "CTensor.h"
#include "CTensor4D.h"
#include "CVector.h"
#include "flowToImage.h"
#include "NMath.h"



int main(void)
{
	/// Give the compiler a hint that we do not use argc/argv
	//(void)argc;
	//(void)argv;
	
	CMatrix<float> img0;
	CMatrix<float> img1;
	img0.readFromPGM("cropped-street_000009.pgm");
	img1.readFromPGM("cropped-street_000010.pgm");

	//Image size
	const int Y = img0.ySize();
	const int X = img0.xSize();

	// Smooth filter section
	float sigma_pre = 0.3;
	float sigma = 0.3;
	CSmooth<float> gaussian_presmooth(sigma_pre, 3.f);
	CSmooth<float> gaussian(sigma, 3.f);
	NFilter::filter(img0, gaussian_presmooth, gaussian_presmooth);
	NFilter::filter(img1, gaussian_presmooth, gaussian_presmooth);

	// Derivative filter section
	CDerivative<float> derivative(3);

	/// Compute derivatives in X/Y/time direction
	CMatrix<float> Ix(img0);
	NFilter::filter(Ix, derivative, 1);
	CMatrix<float> Iy(img0);
	NFilter::filter(Iy, 1, derivative);
	CMatrix<float> It(img1);

	CMatrix<float> IxIx(Ix);
	CMatrix<float> IxIy(Ix);
	CMatrix<float> IxIt(Ix);
	CMatrix<float> IyIy(Iy);
	CMatrix<float> IyIt(Iy);
	for (int y = 0; y < Y; ++y) {
		for (int x = 0; x < X; ++x) {
			It(x, y) -= img0(x, y);
			IxIx(x, y) *= Ix(x, y);
			IxIy(x, y) *= Iy(x, y);
			IxIt(x, y) *= It(x, y);
			IyIy(x, y) *= Iy(x, y);
			IyIt(x, y) *= It(x, y);
		}
	}

	if (sigma > 0.f) {
		/// [Class 6, slide 10]
		NFilter::filter<float>(IxIx, gaussian, gaussian);
		NFilter::filter<float>(IxIy, gaussian, gaussian);
		NFilter::filter<float>(IxIt, gaussian, gaussian);
		NFilter::filter<float>(IyIy, gaussian, gaussian);
		NFilter::filter<float>(IyIt, gaussian, gaussian);
	}
	float u1, v1;
	CTensor<float> LucasKanadeFlow(X, Y, 2);
	CTensor<float> LucasKanadeFlow2(X, Y, 2);
	float A, B, C, D, E, F, u, v;
	for (int y = 0; y < Y; ++y) {
		for (int x = 0; x < X ; ++x) {
			/// Compute known matrix entries
			A = IxIx(x, y);  B = IxIy(x, y);   E = -1.*IxIt(x, y);
			C = B;  D = IyIy(x, y);   F = -1.*IyIt(x, y);
			/// Solve for u, v
			u = (E*D - B*F) / (A*D - B*C);
			v = (F - C*u) / D;
			// A*B=C
			// B = inv(A)*C
			u1 = (B*F) / (B*C - A*D) - (D*E) / (B*C - A*D);
			v1 = (C*E) / (B*C - A*D) - (A*F) / (B*C - A*D);
			LucasKanadeFlow(x, y, 0) = u;
			LucasKanadeFlow(x, y, 1) = v;
			LucasKanadeFlow2(x, y, 0) = u1;
			LucasKanadeFlow2(x, y, 1) = v1;

		}
	}

	CTensor<float> LucasKanadeFlowRGB(X, Y, 3);
	CTensor<float> LucasKanadeFlowRGB2(X, Y, 3);
	flowToImage(LucasKanadeFlow, LucasKanadeFlowRGB);
	flowToImage(LucasKanadeFlow2, LucasKanadeFlowRGB2);
	LucasKanadeFlowRGB.writeToPGM("done.pgm");
	LucasKanadeFlowRGB2.writeToPGM("done2.pgm");

	// Horn Schnuck method

	CMatrix<float> img3;
	CMatrix<float> img4;
	img3.readFromPGM("cropped-street_000009.pgm");
	img4.readFromPGM("cropped-street_000010.pgm");

	// Selection of alpha parameter according to value selected  in exe_2
	float alpha = 200;

	// Computation of derivaties
	// Derivative filter section
	CDerivative<float> derivative_2(2);

	/// Compute derivatives in X/Y/time direction
	CMatrix<float> Ix_hs(img3);
	NFilter::filter(Ix_hs,derivative, 1);
	CMatrix<float> Iy_hs(img3);
	NFilter::filter(Iy, 1, derivative);
	CMatrix<float> It_hs(img4);
	It_hs -= img3;


	



}