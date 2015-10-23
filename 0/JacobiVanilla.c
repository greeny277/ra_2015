#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

#include "Jacobi.h"

void jacobiVanilla(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	GRID_T left, right, down, up;
	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-1; j++){
			left = oldGrid[i*width + (j-1)];
			right = oldGrid[i*width + (j+1)];
			up = oldGrid[(i-1)*width + j];
			down = oldGrid[(i+1)*width + j];
			newGrid[i*width + j] = (left + right + down + up) * 0.25;
		}
	}
	return;
}
