#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

#include "JacobiVanilla.h"


void jacobi_sse(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	int remainder;
#ifdef FLOAT
	/* Each vector contains one value of the four Jacobi iteration step
	 * Either each upper, below, left or right value. */
	__m128 up_row, below_row, right_row, left_row;

	__m128 factor = _mm_set1_ps(0.25f);

	remainder = (width-2)%4;

	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-4; j += 4){
			//IACA_START
			up_row = _mm_loadu_ps(&(oldGrid[(i-1)*width + j]));
			below_row = _mm_loadu_ps(&(oldGrid[(i+1)*width + j]));

			right_row = _mm_loadu_ps(&(oldGrid[i*width + (j+1)]));
			left_row = _mm_loadu_ps(&(oldGrid[i*width + (j-1)]));

			/* Sum up n-th element of each vector */
			__m128 dest;
			__m128 add_1 =  _mm_add_ps(up_row, below_row);
			__m128 add_2 =  _mm_add_ps(left_row, right_row);
			dest =  _mm_add_ps(add_2, add_1);

			/* Multiplicat with 0.25 */
			dest = _mm_mul_ps(dest, factor);

			// Use unaligned store method. Normal one produces segmentation fault
			_mm_storeu_ps(&(newGrid[i*width + j]), dest);
		}
		//IACA_END
		// Loop over remainder
		for(int j = width - remainder - 1; j < width -1; j++){
			newGrid[i*width + j] = (oldGrid[i*width + (j-1)] + oldGrid[i*width + (j+1)] + oldGrid[(i-1)*width + j] + oldGrid[(i+1)*width + j]) * 0.25;
		}
	}
#endif
#ifdef DOUBLE
	remainder = (width-2)%2;
	/* Each vector contains one value of the four Jacobi iteration step
	 * Either each upper, below, left or right value. */
	__m128d up_row, below_row, right_row, left_row;

	__m128d factor = _mm_set1_pd(0.25f);

	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-2; j += 2){
			up_row = _mm_loadu_pd(&(oldGrid[(i-1)*width + j]));
			below_row = _mm_loadu_pd(&(oldGrid[(i+1)*width + j]));

			right_row = _mm_loadu_pd(&(oldGrid[i*width + (j+1)]));
			left_row = _mm_loadu_pd(&(oldGrid[i*width + (j-1)]));

			/* Sum up n-th element of each vector */
			__m128d dest;
			__m128 add_1 =  _mm_add_pd(up_row, below_row);
			__m128 add_2 =  _mm_add_pd(left_row, right_row);
			dest =  _mm_add_pd(add_2, add_1);

			/* Multiplicat with 0.25 */
			dest = _mm_mul_pd(dest, factor);

			// Use unaligned store method. Normal one produces segmentation fault
			_mm_storeu_pd(&(newGrid[i*width + j]), dest);
		}
		// Loop over remainder
		for(int j = width - remainder -1 ; j < width - 1; j++){
			newGrid[i*width + j] = (oldGrid[i*width + (j-1)] + oldGrid[i*width + (j+1)] + oldGrid[(i-1)*width + j] + oldGrid[(i+1)*width + j]) * 0.25;
		}
	}
#endif
	return;
}

void jacobi_normal(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-1; j++){
			newGrid[i*width + j] = (oldGrid[i*width + (j-1)] + oldGrid[i*width + (j+1)] + oldGrid[(i-1)*width + j] + oldGrid[(i+1)*width + j]) * 0.25;
		}
	}
	return;
}

void jacobi_avx(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	int remainder;
#ifdef FLOAT
	remainder = (width-2)%8;
	/* Each vector contains one value of the four Jacobi iteration step
	 * Either each upper, below, left or right value. */
	__m256 up_row, below_row, right_row, left_row;

	__m256 factor = _mm256_set1_ps(0.25);

	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-8; j += 8){
			up_row = _mm256_loadu_ps(&(oldGrid[(i-1)*width + j]));
			below_row = _mm256_loadu_ps(&(oldGrid[(i+1)*width + j]));

			right_row = _mm256_loadu_ps(&(oldGrid[i*width + (j+1)]));
			left_row = _mm256_loadu_ps(&(oldGrid[i*width + (j-1)]));

			/* Sum up n-th element of each vector */
			__m256 dest;
			__m256 add_1 =  _mm256_add_ps(up_row, below_row);
			__m256 add_2 =  _mm256_add_ps(left_row, right_row);
			dest =  _mm256_add_ps(add_2, add_1);

			/* Multiplicat with 0.25 */
			dest = _mm256_mul_ps(dest, factor);

			// Use unaligned store method. Normal one produces segmentation fault
			_mm256_storeu_ps(&(newGrid[i*width + j]), dest);
		}
		for(int j = width - remainder - 1; j < width -1; j++){
			newGrid[i*width + j] = (oldGrid[i*width + (j-1)] + oldGrid[i*width + (j+1)] + oldGrid[(i-1)*width + j] + oldGrid[(i+1)*width + j]) * 0.25;
		}
	}
	return;
#endif
#ifdef DOUBLE

	remainder = (width-2)%4;
	/* Each vector contains one value of the four Jacobi iteration step
	 * Either each upper, below, left or right value. */
	__m256d up_row, below_row, right_row, left_row;

	__m256d factor = _mm256_set1_pd(0.25);

	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-4; j += 4){
			up_row = _mm256_loadu_pd(&(oldGrid[(i-1)*width + j]));
			below_row = _mm256_loadu_pd(&(oldGrid[(i+1)*width + j]));

			right_row = _mm256_loadu_pd(&(oldGrid[i*width + (j+1)]));
			left_row = _mm256_loadu_pd(&(oldGrid[i*width + (j-1)]));


			/* Sum up n-th element of each vector */
			__m256 dest;
			__m256 add_1 =  _mm256_add_pd(up_row, below_row);
			__m256 add_2 =  _mm256_add_pd(left_row, right_row);
			dest =  _mm256_add_pd(add_2, add_1);
			/* Multiplicat with 0.25 */
			dest = _mm256_mul_pd(dest, factor);

			// Use unaligned store method. Normal one produces segmentation fault
			_mm256_storeu_pd(&(newGrid[i*width + j]), dest);
		}
		for(int j = width - remainder - 1; j < width -1; j++){
			newGrid[i*width + j] = (oldGrid[i*width + (j-1)] + oldGrid[i*width + (j+1)] + oldGrid[(i-1)*width + j] + oldGrid[(i+1)*width + j]) * 0.25;
		}
	}
	return;
#endif
}
