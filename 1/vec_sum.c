/*
 * ICC Version:
 * 1) intelmpi/4.1.3.048-intel
 * 2) mkl/11.0up05
 * 3) intel64/13.1up03
 *
 * GCC Version: 4.9.2
 */

#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <limits.h>
#include <time.h>
#include <sched.h>

#include "vec_sum.h"
#include "vec_sum_vanilla.h"


/* Method declarations */
static void init(GRID_T *, int);
static long help_strtol(char *);
static double getTime(struct timespec *);
static int loopV2(GRID_T *, int);

int main(int argc, char** argv){

	if(argc < 2){
		fprintf(stderr, "Too less arguments: vec_sum sizeOfVector\n");
		exit(EXIT_FAILURE);
	}

	cpu_set_t set;

	CPU_ZERO(&set);
	/* Add first available CPU to set */
	CPU_SET(0, &set);

	/* Perform all actions of this process on one CPU */
	if(sched_setaffinity(0, sizeof(cpu_set_t), &set)){
		perror("sched_setaffinity");
		exit(EXIT_FAILURE);
	}


	int size;
	size  = help_strtol(argv[1]);

	if(size <= 0){
		fprintf(stderr, "Usage: vec_sum sizeOfVector\n");
		fprintf(stderr, "Size must be greater than 0\n");
		exit(EXIT_FAILURE);
	}

	/* Variables */
	GRID_T *vec;

	/* Allocate memory with posix_memalign */
	errno = posix_memalign((void **) &vec, 64, 1024*size);
	if(errno){
		perror("posix_memalign");
		exit(EXIT_FAILURE);
	}

	//Calculate the number of elements = size
	int length = (1024 * size) / sizeof(GRID_T);
	

	/* Initialize the vector with a constant value */
	init(vec, length);

	int mups = loopV2(vec, length);
	if(mups == -1){
		exit(EXIT_FAILURE);
	}

	printf("------------------\n");
	printf("MUPS: %d\n", mups);

	free(vec);
	return 0;
}

/*
 * @brief Updated loop version with twice as many lu for each 
 * while-loop iteration
 */
static int loopV2(GRID_T *vec, int length){
	struct timespec start;
	struct timespec end;
	double endTime;
	double diff_sec = 0;
	double startTime = getTime(&start);
	if(startTime == -1){
		return -1;
	}
	
	double sum = 0.0f; 
	int lu = 1;
	do{
		sum = 0.0f;
		//for loop for execution and the copy of pointers
		for(int i = 0; i < lu; ++i)
		{
			sum = vec_sum(vec, length);
			if(sum == -1){
				return -1;
			}
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

	/*Testing*/
	//printf("------------------\n");
	//printf("Total amout of updates: %d\n", lu);
	//printf("Amout of time V2 uses: %f\n", diff_sec);

	printf("SUM: %f\n", sum);
	/* Scale lups to LOOP_TIME */
	return ( (length*lu) / diff_sec );
}


/* Method for initialization of a grid */
static void init(GRID_T *vec, int length){
	for(int i = 0; i < length; ++i){
		vec[i] = 1.0f;
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

static double getTime(struct timespec *tp){
	if(clock_gettime(CLOCK_MONOTONIC, tp)){
		perror("clock_gettime");
		return -1;
	}
	return (double)tp->tv_sec + (double)tp->tv_nsec / 1000000000.0;
}
