#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <limits.h>
#include <time.h>

#include "Jacobi.h"
#include "JacobiVanilla.h"

/* Method declarations */
static void init(GRID_T *, int, int);
static long help_strtol(char *);
static void prettyPrint(GRID_T *, int, int);
static void pretty_PPM_Print(GRID_T *, int, int, char *);
static double getTime(struct timespec *);
static int loop(GRID_T *, GRID_T *, int , int);
static void copy_grid(GRID_T *, GRID_T *, int , int);

int main(int argc, char** argv){

	if(argc < 3){
		fprintf(stderr, "Too less arguments: Jacobi [width] [height]\n");
		exit(EXIT_FAILURE);
	}

	int width, height;
	width  = help_strtol(argv[1]);
	height = help_strtol(argv[2]);

	/* Variables */
	GRID_T *oldGrid, *newGrid;

	/* Allocate memory with posix_memalign */
	errno = posix_memalign((void **) &oldGrid, 64, sizeof(GRID_T)*width*height);
	if(errno){
		perror("posix_memalign");
	}

	errno = posix_memalign((void **) &newGrid, 64, sizeof(GRID_T)*width*height);
	if(errno){
		perror("posix_memalign");
	}

	/* Initialize grids left and upper border with 1.0
	 * and the rest with 0.0 */
	init(oldGrid, width, height);
	init(newGrid, width, height);

	int lups = loop(oldGrid, newGrid, width, height);
	if(lups == -1){
		exit(EXIT_FAILURE);
	}

	printf("------------------\n");
	printf("LUPS: %d\n", lups);

	printf("Final grid:\n");
	prettyPrint(newGrid, width, height);


	free(oldGrid);
	free(newGrid);
	return 0;
}

/*
 * @brief Call jacobiVanilla() in a loop until LOOP_TIME has
 * passed
 *
 * @param oldGrid holds same information as newGrid but
 *                kept unchanged
 * @param newGrid saves results of next iteration.
 *
 * @return Lattice (Grid) update per seconds (LUPS) or
 *        -1 on error case.
 */
static int loop(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	struct timespec start;
	struct timespec end;
	double diff_sec = 0;
	double startTime = getTime(&start);
	if(startTime == -1){
		return -1;
	}

	int lups = 0;
	while(diff_sec < LOOP_TIME){
		jacobiVanilla(oldGrid, newGrid, width, height);

		copy_grid(oldGrid, newGrid, width, height);

		double endTime = getTime(&end);
		if(startTime == -1){
			return -1;
		}

		diff_sec = endTime - startTime;

		lups++;
	}
	return lups;
}
/* Method for initialization of a grid */
static void init(GRID_T *grid, int width, int height){
	for(int i = 0; i < height; i++){
		for(int j = 0; j < width; j++){
			if(i == 0){
				/* Init first row */
				grid[j] = 1.0f;
				continue;
			} else if(j == 0){
				/* Init first entry of each column */
				grid[width*i] = 1.0f;
				continue;
			} else {
				grid[width*i + j] = 0.0f;
			}
		}
	}
	return;
}

/* Convert string to long */
static long help_strtol(char *string){
	errno = 0;
	long val;
	char *endptr;
	val = strtol(string, &endptr, 10);

	/* Check for various possible errors */

	if ((errno == ERANGE && (val == LONG_MAX || val == LONG_MIN))
			|| (errno != 0 && val == 0)) {
		perror("strtol");
		exit(EXIT_FAILURE);
	}

	if (endptr == string) {
		fprintf(stderr, "No digits were found\n");
		exit(EXIT_FAILURE);
	}

	return val;
}

/* Print Grid in asci art*/
static void prettyPrint(GRID_T *grid, int width, int height){
	printf("------BEGIN GRID--------\n");
	for(int i = 0; i < height; i++){
		for(int j = 0; j < width; j++){
			printf("%f  ", grid[width*i + j]);
		}
		printf("\n");
	}
	printf("------END GRID----------\n");
	printf("\n");
	return;
}

/* Creates _filename_ with ppm ending
 * @return 0 on success
 *        -1 if an error occured
 */
static int pretty_PPM_Print(GRID_T *grid, int width, int height, char *filename){
	/* Create buffer for full filename with appendix */
	char completeFilename[strlen(filename) + 4 + 1];
	snprintf(completeFilename, strlen(completeFilename), "%s.ppm", filename);
	/* Open file */
	FILE *f = fopen(completeFilename, "w");
	if(f == NULL){
		return -1;
	}
	/* Add header */
	fprintf(f, "P3\n");
	fprintf(f, "%dx%d\n", width, height);
	//TODO
	fclose(f);
}

/*
 * Returns realtime in seconds. If an error occurs
 * -1 instead.
 */
static double getTime(struct timespec *tp){
	if(clock_gettime(CLOCK_MONOTONIC, tp)){
		perror("clock_gettime");
		return -1;
	}
	return (double)tp->tv_sec + (double)tp->tv_nsec / 1000000000.0;
}

/*
 * @brief Copy entries from newGrid into oldGrid.
 */
static void copy_grid(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	for(int i = 0; i< height; i++){
		for(int j = 0; j < width; j++){
			oldGrid[width*i + j] = newGrid[width*i + j];
		}
	}
}
