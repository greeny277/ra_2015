/**
 * @file JacobiVanilla.h
 * @author Christian Bay
 * @date 15 Nov 2015
 * @brief File containing different variants of an iteration step
 * of a Jacobi iteration.
 *
 * Each variant implements the Jacobi Iteration in a different
 * manner.
 * With SSE, AVX or no optimazation.
 *
 * @see https://software.intel.com/sites/landingpage/IntrinsicsGuide/
 **/

#ifndef _JACOBI_VANILLA_H
#define _JACOBI_VANILLA_H

#include "Jacobi.h"

/**
 * @brief Computes one Jacobi Iteration without any optimizations.
 * The borders are kept untouched.
 *
 * @param oldGrid  owns entries of former computation. Read only.
 *
 * @param newGrid  stores results of computation based on oldGrid.
 *
 * @return No return value
 * */
void jacobi_normal(GRID_T *, GRID_T *, int, int);

#endif /* _JACOBI_VANILLA_H */
