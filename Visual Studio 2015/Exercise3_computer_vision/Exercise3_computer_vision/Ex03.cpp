/**
 * Image Processing and Computer Graphics
 *
 * Exercise 3: Local descriptors
 */

#define _CRT_SECURE_NO_WARNINGS
#define _USE_MATH_DEFINES

#include <cstdlib>   /// contains: EXIT_SUCCESS
#include <iostream>  /// contains: std::cout etc.
#include <cmath>
#include "CMatrix.h"
#include "CTensor.h"
#include "CFilter.h"

using namespace std;
using namespace NFilter;
// Functions declaration
void Gaussian_Filter3(float gk[][3]);

void Gaussian_Filter5(float gk[][5]);

float Eigen(float struct_tensor[][2]);

void Corner_Detector(CMatrix<float> img0,const char* name);

void Corner_Detector_col(CTensor<float> img0, const char* name);

void Corner_Detector_col1(CTensor<float> img0, const char* name);

template <typename T>
void Normalize(CMatrix<T>& m)
{
	const T maxv = m.max();
	const T minv = m.min();
	/// Rescale matrix values so their range is 1.0 wide
	m *= (T)1. / (maxv - minv);
	/// Shift -> range is [0, 1]
	m += -minv;
	/// Rescale -> range is [0, 255]
	m *= (T)255.;
}




int main(int argc, char** args) 
{  
  /// Tell the compiler not to throw warnings for unused variables
  /// Remove these lines if you want to use command line arguments.
  (void)argc;
  (void)args;

  /// Print something so we know the program actually runs
  std::cout << "Hello, World!\n";

  /**
   * EXERCISE 3
   */
  CMatrix<float> img0;
  CTensor<float> img1;
  CTensor<float> img2;
  CTensor<float> img3;
  CTensor<float> img4;
  CTensor<float> img5;

  img0.readFromPGM("Motion10163.pgm");
  img1.readFromPPM("barkimg2.ppm");
  img2.readFromPPM("img1.ppm");
  img3.readFromPPM("tennis500.ppm");
  img4.readFromPPM("tennis505.ppm");
  img5.readFromPPM("tueb01.ppm");
  
  Corner_Detector(img0,"motion10163_norm.pgm");
  cout << "1" << endl;
  Corner_Detector_col(img1, "barkimg2_cor.pgm");
  cout << "1" << endl;
  Corner_Detector_col(img2, "img1_cor.pgm");
  cout << "1" << endl;
  Corner_Detector_col(img3, "tennis500_cor.pgm");
  cout << "1" << endl;
  Corner_Detector_col(img4, "tennis505_cor.pgm");
  cout << "1" << endl;
  Corner_Detector_col(img5, "tueb01_cor.pgm");
  cout << "1" << endl;

  

  

  return EXIT_SUCCESS;
}

void Corner_Detector(CMatrix<float> img0,const char* name)
{
	// Size of img0
	int X, Y;
	X = img0.xSize();
	Y = img0.ySize();
	// Structure tensor calculation
	CDerivative<float> derivative(3);
	CMatrix<float> Ix(img0);
	NFilter::filter(Ix, derivative, 1);
	CMatrix<float> Iy(img0);
	NFilter::filter(Iy, 1, derivative);
	// Derivative convolution
	CMatrix<float> IxIx(Ix);
	CMatrix<float> IxIy(Ix);
	CMatrix<float> IyIy(Iy);
	for (int y = 0; y < Y; ++y) {
		for (int x = 0; x < X; ++x) {
			IxIx(x, y) *= Ix(x, y);
			IxIy(x, y) *= Iy(x, y);
			IyIy(x, y) *= Iy(x, y);
			
		}
	}
	
	float sigma = 3;
		CSmooth<float> gaussian(sigma, 3.f);
		filter(IxIx, gaussian, 0); // x
		filter(IxIx, 0, gaussian); // y
		filter(IxIy, gaussian, 0); // x
		filter(IxIy, 0, gaussian); // y
		filter(IyIy, gaussian, 0); // x
		filter(IyIy, 0, gaussian); // y


		float T, D;
		CMatrix<float> cornerness(img0.xSize(), img0.ySize());
		for (int y = 0; y < img0.ySize(); ++y) {
			for (int x = 0; x < img0.xSize(); ++x) {
				/// Average structure tensor entries over color channels
				const float A = IxIx(x, y);
				const float B = IxIy(x, y);
				const float C = IyIy(x, y);
				//const float determinant = A*C - B*B;
				//const float trace = A + C;
				//cornerness(x, y) = determinant - alpha*trace;
				T = A + C;
				D = (A*C) - (B*B);
				cornerness(x, y) = T / 2 - sqrt(((T*T) / 4) - D);
			}
		}
		CMatrix<float> cornerness_normalized(cornerness);
		Normalize(cornerness_normalized);
		cornerness_normalized.writeToPGM(name);
		
		
	

	

}

void Corner_Detector_col(CTensor<float> img0,const char* name)
{
	float sigma = 3.f;
	
	

	CSmooth<float> gaussian(sigma, 3.f);
	NFilter::filter(img0, gaussian, 0, 0);  // X direction
	NFilter::filter(img0, 0, gaussian, 0);  // Y direction
	// Size of img0
	int X, Y, Z;
	X = img0.xSize();
	Y = img0.ySize();
	Z = img0.zSize();
	// Structure tensor calculation
	CDerivative<float> derivative(3);
	CTensor<float> Ix(img0);
	CTensor<float> Iy(img0);
	/// Color image -> multiple channels
	for (int i = 0; i < Z; ++i) {
		CMatrix<float> chan(img0.xSize(), img0.ySize());

		img0.getMatrix(chan, i);
		NFilter::filter(chan, derivative, 0);
		Ix.putMatrix(chan, i);

		img0.getMatrix(chan, i);
		NFilter::filter(chan, 0, derivative);
		Iy.putMatrix(chan, i);
	}

	CTensor<float> IxIx(Ix);
	CTensor<float> IxIy(Ix);
	CTensor<float> IyIy(Iy);
	for (int y = 0; y < Y; ++y) {
		for (int x = 0; x < X; ++x) {
			for (int z = 0; z < Z; ++z) {
				IxIx(x, y, z) *= Ix(x, y, z);
				IxIy(x, y, z) *= Iy(x, y, z);
				IyIy(x, y, z) *= Iy(x, y, z);
			}
		}
	}
	
		sigma = 3;
		
		NFilter::filter(IxIx, gaussian, 0, 0);  // X direction
		NFilter::filter(IxIx, 0, gaussian, 0);  // Y direction
		NFilter::filter(IxIy, gaussian, 0, 0);  // X direction
		NFilter::filter(IxIy, 0, gaussian, 0);  // Y direction
		NFilter::filter(IyIy, gaussian, 0, 0);  // X direction
		NFilter::filter(IyIy, 0, gaussian, 0);  // Y direction

		
		float T, D;
		CMatrix<float> cornerness(img0.xSize(), img0.ySize());
		for (int y = 0; y < img0.ySize(); ++y) {
			for (int x = 0; x < img0.xSize(); ++x) {
				/// Average structure tensor entries over color channels
				const float A = (1./3)*(IxIx(x, y,0)+ IxIx(x, y, 1) + IxIx(x, y, 2));
				const float B = (1./ 3) * (IxIy(x, y, 0) + IxIy(x, y, 1) + IxIy(x, y, 2));
				const float C = (1./ 3) * (IyIy(x, y, 0) + IyIy(x, y, 1) + IyIy(x, y, 2));
				//const float determinant = A*C - B*B;
				//const float trace = A + C;
				//cornerness(x, y) = determinant - alpha*trace;
				T = A + C;
				D = (A*C) - (B*B);
				cornerness(x, y) = T / 2 - sqrt(((T*T) / 4) - D);
				
			}
		}


		CMatrix<float> cornerness_normalized(cornerness);
		Normalize(cornerness_normalized);
		cornerness.writeToPGM(name);
		
		

}


void Gaussian_Filter3(float gk[][3])
{
	float stdv = 1.0;
	float r, s = 2.0*stdv*stdv;
	double sum = 0.0;
	// kernel 3x3 generation
	for (int x = -1; x <= 1; x++)
	{
		for (int y = -1; y <= 1; y++)
		{
			r = sqrt(x*x + y*y);
			gk[x + 1][y + 1] = (exp(-(r*r) / s)) / (M_PI*s);
			sum += gk[x + 1][y + 1];
		}
	}

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			gk[i][j] /= sum;
		}
	}

}

void Gaussian_Filter5(float gk[][5])
{
	float stdv = 1.0;
	float r, s = 2.0*stdv*stdv;
	double sum = 0.0;
	// kernel 3x3 generation
	for (int x = -2; x <= 2; x++)
	{
		for (int y = -2; y <= 2; y++)
		{
			r = sqrt(x*x + y*y);
			gk[x + 2][y + 2] = (exp(-(r*r) / s)) / (M_PI*s);
			sum += gk[x + 2][y + 2];
		}
	}

	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 5; j++)
		{
			gk[i][j] /= sum;
		}
	}

}

// IN: Structure tensor
// OUT: Second eigenvalue
float Eigen(float struct_tensor[][2])
{
	float T = struct_tensor[0][0] + struct_tensor[1][1];
	float D = (struct_tensor[0][0] * struct_tensor[1][1]) - (struct_tensor[0][1] * struct_tensor[1][0]);
	return T / 2 - sqrt((pow(T, 2) / (4 - D)));

}


void Corner_Detector_col1(CTensor<float> image, const char* name)
{
	/// Load input image
	
	


	/// Pre-smooth input image
	{
		float sigma = 3.f;
		
		CSmooth<float> gaussian(sigma, 3.f);
		NFilter::filter(image, gaussian, 0, 0);  // X direction
		NFilter::filter(image, 0, gaussian, 0);  // Y direction
	}

	/// Compute derivative images
	CDerivative<float> derivative(3);
	CTensor<float> Ix(image);
	CTensor<float> Iy(image);
	/// Color image -> multiple channels
	for (int i = 0; i < image.zSize(); ++i) {
		CMatrix<float> chan(image.xSize(), image.ySize());

		image.getMatrix(chan, i);
		NFilter::filter(chan, derivative, 0);
		Ix.putMatrix(chan, i);

		image.getMatrix(chan, i);
		NFilter::filter(chan, 0, derivative);
		Iy.putMatrix(chan, i);
	}

	/// Combine derivative images
	CTensor<float> IxIx(Ix);
	CTensor<float> IxIy(Ix);
	CTensor<float> IyIy(Iy);
	for (int y = 0; y < image.ySize(); ++y) {
		for (int x = 0; x < image.xSize(); ++x) {
			for (int z = 0; z < image.zSize(); ++z) {
				IxIx(x, y, z) *= Ix(x, y, z);
				IxIy(x, y, z) *= Iy(x, y, z);
				IyIy(x, y, z) *= Iy(x, y, z);
			}
		}
	}

	/// Smooth combined derivative images
	
		float sigma = 3.f;
		
		CSmooth<float> gaussian(sigma, 3.f);
		NFilter::filter(IxIx, gaussian, 0, 0);  // X direction
		NFilter::filter(IxIx, 0, gaussian, 0);  // Y direction
		NFilter::filter(IxIy, gaussian, 0, 0);  // X direction
		NFilter::filter(IxIy, 0, gaussian, 0);  // Y direction
		NFilter::filter(IyIy, gaussian, 0, 0);  // X direction
		NFilter::filter(IyIy, 0, gaussian, 0);  // Y direction
	


	/// Compute local structure tensor maxima
	///         | A  B |   | IxIx  IxIy |
	/// J_rho = | B  C | = | IxIy  IyIy |
	/// Measure of cornerness c = determinant(J_rho) - alpha*trace(J_rho)
	
		float T;
		float D;

	CMatrix<float> cornerness(image.xSize(), image.ySize());
	for (int y = 0; y < image.ySize(); ++y) {
		for (int x = 0; x < image.xSize(); ++x) {
			/// Average structure tensor entries over color channels
			const float A = (1. / 3)*(IxIx(x, y, 0) + IxIx(x, y, 1) + IxIx(x, y, 2));
			const float B = (1. / 3)*(IxIy(x, y, 0) + IxIy(x, y, 1) + IxIy(x, y, 2));
			const float C = (1. / 3)*(IyIy(x, y, 0) + IyIy(x, y, 1) + IyIy(x, y, 2));
			const float determinant = A*C - B*B;
			const float trace = A + C;
			//cornerness(x, y) = determinant - alpha*trace;
			T = A + C;
			D = (A*C) - (B*B);
			cornerness(x, y) = T / 2 - sqrt(((T*T) / 4) - D);
		}
	}
	CMatrix<float> cornerness_normalized(cornerness);
	Normalize(cornerness_normalized);
	cornerness_normalized.writeToPGM(name);
}