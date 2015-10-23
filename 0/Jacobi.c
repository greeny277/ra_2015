#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <limits.h>


#define GRID_T float

/* Variables */
static GRID_T *old_grid, *new_grid;

/* Method declarations */
static void init(GRID_T *, int, int);
static long help_strtol(char *);
static void prettyPrint(GRID_T *, int, int);

int main(int argc, char** argv){

	if(argc < 3){
		fprintf(stderr, "Too less arguments: Jacobi [width] [height]\n");
		exit(EXIT_FAILURE);
	}

	int width, height;
	width  = help_strtol(argv[1]);
	height = help_strtol(argv[2]);


	errno = posix_memalign((void **) &old_grid, 64, sizeof(GRID_T)*width*height);
	if(errno){
		perror("posix_memalign");
	}

	errno = posix_memalign((void **) &new_grid, 64, sizeof(GRID_T)*width*height);
	if(errno){
		perror("posix_memalign");
	}

	/* Initialize grids left and upper border with 1.0
	 * and the rest with 0.0 */
	init(old_grid, width, height);
	init(new_grid, width, height);

	prettyPrint(new_grid, width, height);
	prettyPrint(old_grid, width, height);

	free(old_grid);
	free(new_grid);
	return 0;
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
	return;
}
