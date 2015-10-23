#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <time.h>

#include "Jacobi.h"
static long startTime(void);
static long stopTime(long);

void jacobiVanilla(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	GRID_T left, right, down, up;
	long sT = startTime();
	for(int i = 1; i < height-1; i++){
		for(int j = 1; j < width-1; j++){
			left = oldGrid[i*width + (j-1)];
			right = oldGrid[i*width + (j+1)];
			up = oldGrid[(i-1)*width + j];
			down = oldGrid[(i+1)*width + j];
			newGrid[i*width + j] = (left + right + down + up) * 0.25;
		}
	}
	long diff = stopTime(sT);
	printf("Time for one iteration in ns: %ld\n", diff);
	return;
}

/*
 * Returns current time in nanoseconds or -1
 * when an error occured
 */
static long startTime(void){
	struct timespec tp;
	if(clock_gettime(CLOCK_REALTIME, &tp)){
		perror("clock_gettime");
		return -1;
	}

	long ret = tp.tv_nsec + (tp.tv_sec * 10^9);

	return ret;
}

/*
 * Returns difference between currentTime and startTime
 * or -1 when an error occured
 */
static long stopTime(long startTime){
	struct timespec tp;
	if(clock_gettime(CLOCK_REALTIME, &tp)){
		perror("clock_gettime");
		return -1;
	}

	long endTime = tp.tv_nsec + (tp.tv_sec * 10^9);

	return endTime - startTime;
}

