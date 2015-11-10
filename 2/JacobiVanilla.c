#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <immintrin.h>

#include "Jacobi.h"

static void jacobi_avx(GRID_T *, GRID_T *, int, int);
static void jacobi_normal(GRID_T *, GRID_T *, int, int);
static void jacobi_sse(GRID_T *, GRID_T *, int, int);

void jacobiVanilla(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
#ifdef FLOAT
	jacobi_sse(oldGrid, newGrid, width, height);
	return;
#endif

#ifdef DOUBLE
	jacobi_avx(oldGrid, newGrid, width, height);
	return;
#endif

	jacobi_normal(oldGrid, newGrid, width, height);
	return;
}

static void jacobi_sse(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	/* Each vector contains one value of the four Jacobi iteration step
	 * Either each upper, below, left or right value. */
	__m128 up_row, below_row, right_row, left_row;

	__m128 factor = _mm_set_ps(0.25f, 0.25f, 0.25f, 0.25f);

	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-4; j += 4){
			up_row = _mm_set_ps(oldGrid[(i-1)*width + j], oldGrid[(i-1)*width + (j+1)], oldGrid[(i-1)*width + (j+2)], oldGrid[(i-1)*width + (j+3)]);
			below_row = _mm_set_ps(oldGrid[(i+1)*width + j], oldGrid[(i+1)*width + (j+1)], oldGrid[(i+1)*width + (j+2)], oldGrid[(i+1)*width + (j+3)]);

			right_row = _mm_set_ps(oldGrid[i*width + (j+1)], oldGrid[i*width + (j+2)], oldGrid[i*width + (j+3)], oldGrid[i*width + (j+4)]);
			left_row = _mm_set_ps(oldGrid[i*width + (j-1)], oldGrid[i*width + j], oldGrid[i*width + (j+1)], oldGrid[i*width + (j+2)]);

			/* Sum up n-th element of each vector */
			__m128 dest;
			dest =  _mm_add_ps(up_row, below_row);
			dest =  _mm_add_ps(dest, right_row);
			dest =  _mm_add_ps(dest, left_row);

			/* Multiplicat with 0.25 */
			dest = _mm_mul_ps(dest, factor);

			// Use unaligned store method. Normal one produces segmentation fault
			_mm_storeu_ps(&(newGrid[i*width + j]), dest);
		}
	}
	return;
}

static void jacobi_normal(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-1; j++){
			newGrid[i*width + j] = (oldGrid[i*width + (j-1)] + oldGrid[i*width + (j+1)] + oldGrid[(i-1)*width + j] + oldGrid[(i+1)*width + j]) * 0.25;
		}
	}
	return;
}

static void jacobi_avx(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	/* Each vector contains one value of the four Jacobi iteration step
	 * Either each upper, below, left or right value. */
	__m256d up_row, below_row, right_row, left_row;

	__m256d factor = _mm256_set_pd(0.25, 0.25, 0.25, 0.25);

	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-4; j += 4){
			up_row = _mm256_set_pd(oldGrid[(i-1)*width + j], oldGrid[(i-1)*width + (j+1)], oldGrid[(i-1)*width + (j+2)], oldGrid[(i-1)*width + (j+3)]);
			below_row = _mm256_set_pd(oldGrid[(i+1)*width + j], oldGrid[(i+1)*width + (j+1)], oldGrid[(i+1)*width + (j+2)], oldGrid[(i+1)*width + (j+3)]);

			right_row = _mm256_set_pd(oldGrid[i*width + (j+1)], oldGrid[i*width + (j+2)], oldGrid[i*width + (j+3)], oldGrid[i*width + (j+4)]);
			left_row = _mm256_set_pd(oldGrid[i*width + (j-1)], oldGrid[i*width + j], oldGrid[i*width + (j+1)], oldGrid[i*width + (j+2)]);

			/* Sum up n-th element of each vector */
			__m256d dest;
			dest =  _mm256_add_pd(up_row, below_row);
			dest =  _mm256_add_pd(dest, right_row);
			dest =  _mm256_add_pd(dest, left_row);

			/* Multiplicat with 0.25 */
			dest = _mm256_mul_pd(dest, factor);

			// Use unaligned store method. Normal one produces segmentation fault
			_mm256_storeu_pd(&(newGrid[i*width + j]), dest);
		}
	}
	return;
}
