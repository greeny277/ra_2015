/*
 * ICC Version:
 * 1) intelmpi/4.1.3.048-intel
 * 2) mkl/11.0up05
 * 3) intel64/13.1up03
 *
 * GCC Version: 4.9.2
 */
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
static int pretty_PPM_Print(GRID_T *, int, int, char *);
static double getTime(struct timespec *);
static int loopV2(GRID_T *, GRID_T *, int , int);
static void gridEntryMap(FILE *, GRID_T);
//static void copy_grid(GRID_T *, GRID_T *, int , int);
//static void prettyPrint(GRID_T *, int, int);

int main(int argc, char** argv){

	if(argc < 3){
		fprintf(stderr, "Too less arguments: Jacobi width height [outfile1]\n");
		exit(EXIT_FAILURE);
	}

	int width, height;
	width  = help_strtol(argv[1]);
	height = help_strtol(argv[2]);

	if(width <= 0 || height <= 0){
		fprintf(stderr, "Usage: Jacobi width height [outfile1]\n");
		fprintf(stderr, "width and height must be greater than 0\n");
		exit(EXIT_FAILURE);
	}

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

	int lupsV2 = loopV2(oldGrid, newGrid, width, height);
	if(lupsV2 == -1){
		exit(EXIT_FAILURE);
	}
	printf("%d\n", lupsV2);

	if(argc > 3){
		pretty_PPM_Print(newGrid, width, height, argv[3]);
	} else {
		pretty_PPM_Print(newGrid, width, height, "out1");
	}

	free(oldGrid);
	free(newGrid);
	return 0;
}

/*
 * @brief Updated loop version with twice as many lu for each
 * while-loop iteration
 */
static int loopV2(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	struct timespec start;
	struct timespec end;
	double endTime;
	double diff_sec = 0;
	double startTime = getTime(&start);
	if(startTime == -1){
		return -1;
	}
	GRID_T *tmp;
	int lu = 1;
	do{
		//for loop for execution and the copy of pointers
		for(int i = 0; i < lu; ++i)
		{
			jacobiVanilla(oldGrid, newGrid, width, height);

			tmp = oldGrid;
			oldGrid = newGrid;
			newGrid = tmp;
		}
		//double the number of repeats each time
		lu *= 2;

		//this funktion costs time -> we reduce the amout!
		endTime = getTime(&end);
		if(endTime == -1){
			return -1;
		}

		diff_sec = endTime - startTime;
	} while(diff_sec < LOOP_TIME);

	/*
	 *	1:	1->1 iteration	and lu = 2
	 *	2:	3->1+2 iter	and lu = 4
	 *	3:	7->1+2+4 iter	and lu = 8
	 * The number of reapts we execute in every iteration is 1 bigger than the sum of the iter before	
	 */
	--lu;

	/* Scale lups to LOOP_TIME */
	return (lu/diff_sec);
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


/*
 * @brief Writes a ppm file for the grid in _filename_
 * @return 0 on success
 *        -1 if an error occured
 */
static int pretty_PPM_Print(GRID_T *grid, int width, int height, char *filename){
	/* Create buffer for full filename with appendix */
	char completeFilename[strlen(filename) + 4 + 1];
	snprintf(completeFilename, strlen(filename)+5, "%s.ppm", filename);
	/* Opens file */
	FILE *f = fopen(completeFilename, "w+");
	if(f == NULL){
		perror("fopen");
		return -1;
	}
	/* Add header */
	fprintf(f, "P3\n");
	fprintf(f, "%dx%d\n", width, height);
	fprintf(f, "255\n");

	for(int i = 0; i< height; i++){
		for(int j = 0; j < width; j++){
			gridEntryMap(f, grid[width*i + j]);
		}
		fprintf(f, "\n");
	}
	fclose(f);
	return 0;
}

/*
 * @brief Map entry in grid to a rgb based output
 * and write it to f.
 *
 * @param f Filepointer
 * @param entry A grid pointer
 */
static void gridEntryMap(FILE *f, GRID_T entry){
	int red, blue, green = 0; 
	if(entry >= 0 && entry <= 0.25){
		red = 255;
		green = (entry * 255)/0.25;
		blue = 0;
	} else if(0.25 <= entry && entry <= 0.5){
		red = -(255/0.25)*(entry - 0.5);
		green = 255;
		blue = 0;
	} else if(0.5 <= entry && entry <= 0.75){
		red = 0;
		green = 255;
		blue = (entry * 255)/0.25;
	} else{
		red = 0;
		green = -(255/0.25)*(entry - 1);
		blue = 255;
	}
	fprintf(f, " %d %d %d", red, green, blue);
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
 *
static void copy_grid(GRID_T *oldGrid, GRID_T *newGrid, int width, int height){
	for(int i = 0; i< height; i++){
		for(int j = 0; j < width; j++){
			oldGrid[width*i + j] = newGrid[width*i + j];
		}
	}
}*/

/* Print Grid in asci art for debugging
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
*/
