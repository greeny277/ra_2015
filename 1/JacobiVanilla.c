#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

#include "Jacobi.h"

void jacobiVanilla(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-1; j++){
			newGrid[i*width + j] = (oldGrid[i*width + (j-1)] + oldGrid[i*width + (j+1)] + oldGrid[(i-1)*width + j] + oldGrid[(i+1)*width + j]) * 0.25;
		}
	}
	return;
}
