/**
 * @author Nikolaus Mayer, 2015 (mayern@cs.uni-freiburg.de)
 *
 * @brief Image Processing and Computer Graphics
 *        Winter Term 2015/2016
 *        Exercise Sheet 2 (Image Processing part)
 *
 * Sparse matrix system for Horn-Schunck optical flow estimation
 */

/// System/STL
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
/// Local files
#include "CMatrix.h"
#include "HornSchunckMatrix.h"


/**
 * @brief Square a number
 * @param value Input
 * @returns Square of input "value"
 */
template <typename T>
inline T HSM_square(T value)
{
  return value*value;
}


/**
 * Constructor
 */
HornSchunckMatrix::HornSchunckMatrix(const CMatrix<float>& derivX, 
                                     const CMatrix<float>& derivY, 
                                     const CMatrix<float>& derivT,
                                     float alpha) 
{
  this->derivX = CMatrix<float>(derivX);
  this->derivY = CMatrix<float>(derivY);
  this->derivT = CMatrix<float>(derivT);

  this->ialpha = 1.f/alpha;
  this->width  = derivT.xSize();
  this->height = derivT.ySize();
  this->pixelcount = derivT.xSize() * derivT.ySize();
}


/**
 * Check position on various diagonals
 */
inline bool HornSchunckMatrix::on_main_diagonal(int x, int y) const
{
  return ( x == y );
}

inline bool HornSchunckMatrix::on_off_block_diagonal(int x, int y) const
{
  return ( x%pixelcount == y%pixelcount );
}

inline bool HornSchunckMatrix::on_near_diagonal(int x, int y) const
{
  return ( ( abs(x-y) == 1 ) and 
           ( (x > 0 and x < pixelcount-1) or
             (x > pixelcount and x < 2*pixelcount-1) )
         );
}

inline bool HornSchunckMatrix::on_far_diagonal(int x, int y) const
{
  return ( ( abs(x-y) == width ) and 
           ( (x >= width and x < pixelcount-width) or
             (x >= pixelcount+width and x < 2*pixelcount-width) )
         );
}



/**
 * Element access
 */
float HornSchunckMatrix::operator()(int x, int y) const 
{
  //out of bounds
  if(x < 0 or x >= 2*pixelcount or 
     y < 0 or y >= 2*pixelcount)
    return 0.f;

  //main diagonal
  else if (on_main_diagonal(x,y))	
  {
    /// The main diagonal smoothness term is determined by the number of
    /// valid neighbor pixels
    float smo = // Upper neighbor
                ((y != 0 and y != pixelcount) ? -1.f : 0.f) +
                // Left neighbor
                ((x != 0 and x != pixelcount) ? -1.f : 0.f) +
                // Right neighbor
                ((x != pixelcount-1 and x != 2*pixelcount-1) ? -1.f : 0.f) +
                // Lower neighbor
                ((y != pixelcount-1 and y != 2*pixelcount-1) ? -1.f : 0.f);

    //data term
    if (x < pixelcount)
      return -ialpha * HSM_square(derivX(x%width, (int)(x/width))) + smo;
    else
      return -ialpha * HSM_square(derivY(x%width, (int)((x-pixelcount)/width))) + smo;
  }

  //smoothness near off diagonals
  else if (on_near_diagonal(x,y))	
    return 1.f;

  //smoothness far off diagonals
  else if (on_far_diagonal(x,y))
    return 1.f;

  //off diagonals, DATA term
  else if(on_off_block_diagonal(x,y) and x < pixelcount)
    return -ialpha *
      derivX(x%width, (int)(x/width)) * 
      derivY(x%width, (int)(x/width));
  else if(on_off_block_diagonal(x,y) and x >= pixelcount)
    return -ialpha *
      derivX(x%width, (int)((x-pixelcount)/width)) * 
      derivY(x%width, (int)((x-pixelcount)/width));

  //trivial case: will be called the most (sparse matrix)
  else
    return 0.f;
}


/** 
 * Result vector entries (b in Ax=b)
 */
float HornSchunckMatrix::res(int i) const
{
  if (i < pixelcount)
    return ialpha *
           derivX(i%width, (int)(i/width)) * 
           derivT(i%width, (int)(i/width));
  else 
    return ialpha *
           derivY(i%width, (int)((i-pixelcount)/width)) * 
           derivT(i%width, (int)((i-pixelcount)/width));
}



