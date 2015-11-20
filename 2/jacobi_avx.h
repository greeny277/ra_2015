#include "Jacobi.h"

/**
 * @brief  Computes one Jacobi Iteration with AVX intrinsic.
 * The borders are kept untouched.
 *
 * @param oldGrid  owns entries of former computation. Read only.
 *
 * @param newGrid  stores results of computation based on oldGrid.
 *
 * @return No return value
 * */
void jacobi_avx(GRID_T *, GRID_T *, int, int);
