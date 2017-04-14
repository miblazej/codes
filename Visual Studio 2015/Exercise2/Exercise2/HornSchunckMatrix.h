/**
 * @author Nikolaus Mayer, 2015 (mayern@cs.uni-freiburg.de)
 *
 * @brief Image Processing and Computer Graphics
 *        Winter Term 2015/2016
 *        Exercise Sheet 2 (Image Processing part)
 *
 * Sparse matrix system for Horn-Schunck optical flow estimation
 */

/// Local files
#include "CMatrix.h"



class HornSchunckMatrix
{

public:

  /**
   * @brief Constructor
   * @param derivX Horizontal component of the input derivative
   * @param derivY Vertical component of the input derivative
   * @param derivT Time component of the input derivative
   * @param alpha Weighting factor alpha
   */
  HornSchunckMatrix(
      const CMatrix<float>& derivX, 
      const CMatrix<float>& derivY, 
      const CMatrix<float>& derivT,
      float alpha=1.f);

  /**
   * @brief Access to coefficient matrix entries (A in Ax=b)
   * @param x Horizontal axis index
   * @param y Vertical axis index
   * @returns Value at (x,y) in an imaginary HS matrix A (in Ax=b)
   */
  float operator()(
      int x, 
      int y) const;

  /**
   * @brief Result vector entries (b in Ax=b)
   * @param i Index
   * @returns Value at index i in the results vector b (in Ax=b)
   */
  float res(
      int i) const;

protected:

  /**
   * @brief Check whether a coordinate lies on the main diagonal
   * @param x Horizontal axis index
   * @param y Vertical axis index
   * @returns TRUE IFF x==y
   */
  inline bool on_main_diagonal(
      int x,
      int y) const;
  /**
   * @brief Check whether a coordinate lies near the main diagonal
   * @param x Horizontal axis index
   * @param y Vertical axis index
   * @returns TRUE IFF (x,y) is within Manhattan distance 1 from the
   *          main diagonal and within the matrix bounds
   */
  inline bool on_near_diagonal(
      int x,
      int y) const;
  /**
   * @brief Check whether a coordinate lies on an off diagonal
   * @param x Horizontal axis index
   * @param y Vertical axis index
   * @returns TRUE IFF (x,y) corresponds to a vertical neighbor entry
   *          in the HS matrix
   */
  inline bool on_far_diagonal(
      int x,
      int y) const;
  /**
   * @brief Check whether a coordinate lies on a block diagonal
   * @param x Horizontal axis index
   * @param y Vertical axis index
   * @returns TRUE IFF (x,y) lies on the "main diagonal" of one BLOCK
   *          if the HS matrix is devided into four equal-sized BLOCKs
   */
  inline bool on_off_block_diagonal(
      int x,
      int y) const;

  CMatrix<float> derivX, derivY, derivT;
  float ialpha;
  int pixelcount, width, height;

};

