#include "jacobi_sse.h"

void jacobi_sse(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	int remainder;
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
			__m128d add_1 =  _mm_add_pd(up_row, below_row);
			__m128d add_2 =  _mm_add_pd(left_row, right_row);
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
	return;
}
