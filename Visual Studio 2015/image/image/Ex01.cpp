/**
 * Image Processing and Computer Graphics
 *
 * Exercise 1: Noise, basic operators and filters
 */
#define _CRT_SECURE_NO_DEPRECATE
#include <cstdlib>   /// contains: EXIT_SUCCESS
#include <iostream>  /// contains: std::cout etc.
#include "CMatrix.h"

int main(int argc, char** args) 
{  
  /// Tell the compiler not to throw warnings for unused variables
  /// Remove these lines if you want to use command line arguments.
  (void)argc;
  (void)args;

  /// Print something so we know the program actually runs
  std::cout << "Hello, World!\n";

  /// Define image
  CMatrix<float> aImage;
  /// Read image from a PGM file
  aImage.readFromPGM("lena.pgm");
  /// Add Gaussian noise here
  for (int y = 0; y < aImage.ySize(); ++y) {
    for (int x = 0; x < aImage.xSize(); ++x) {
      // (...)
    }
  }
  /// Write noisy image to PGM file
  aImage.writeToPGM("lenaNoisy.pgm");      

  return EXIT_SUCCESS;
}

