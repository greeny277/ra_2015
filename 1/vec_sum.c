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
static double loopV2(GRID_T *, int, int);
static double callback(int, GRID_T *, int);

/* Variables */
/* params for manual opt loops */
static int loopVariants[] = {-1, -2, -3, -4, -8};
/* params for automatic opt loops */
//static int loopVariants[] = {1, 2, 3, 4, 8};

#define NLoopV 5

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
	

	for(int i = 0; i < NLoopV; i++){
		/* Initialize the vector with a constant value */
		init(vec, length);

		int mups = ((loopV2(vec, length, loopVariants[i]))/(10^6));
		
		if(mups == -1){
			exit(EXIT_FAILURE);
		}

		printf("%d ", mups);
	}
	printf("\n");

	free(vec);
	return 0;
}

/*
 * @brief Updated loop version with twice as many lu for each 
 * while-loop iteration
 */
static double loopV2(GRID_T *vec, int length, int variant){
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
			sum = callback(variant, vec, length);
			if(sum == -1){
				fprintf(stderr, "Loop variant doesnt exist. Please check loopVariants values.\n");
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
		//printf("Seconds: %f\n", diff_sec);
		//printf("Size: %d\n", length);
		//printf("LU: %d\n", lu);
	} while(diff_sec < LOOP_TIME);

	/*
	 *	1:	1->1 iteration	and lu = 2
	 *	2:	3->1+2 iter	and lu = 4
	 *	3:	7->1+2+4 iter	and lu = 8
	 * The number of reapts we execute in every iteration is 1 bigger than the sum of the iter before	
	 */
	lu = lu/2;

	//printf("SUM: %f\n", sum);
	/* Scale lups to LOOP_TIME */
	return ( (double)(length*lu) / (double)diff_sec );
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

/*
 * @brief  Calls a certian loop method which possibly
 * optimizes the loopig procedure. Which method is chosen
 * depends on the variant variable.
 *
 * @param variant  determines which loop optimization
 * is chosen. A non-zero number calls a compiler
 * supported variant with pragma unroll(variant).
 * Negative numbers choose a method which manually
 * unrolls a loop without any compiler based opt-ins.
 * -1   No manualy unrolling
 * -2   manualy unrolling 2 values per loop step
 * -3   manualy unrolling 3 values per loop step
 * -4   manualy unrolling 4 values per loop step
 * -8   manualy unrolling 8 values per loop step
 *
 */
static double callback(int variant, GRID_T *vec, int length){
	double ret = 0;
	switch(variant){
		case 1:
			ret = vec_sumOpt0(vec, length);
		case 2:
			ret = vec_sumOpt2(vec, length);
		case 3:
			ret = vec_sumOpt3(vec, length);
		case 4:
			ret = vec_sumOpt4(vec, length);
		case 8:
			ret = vec_sumOpt8(vec, length);
		case -1:
			ret = vec_sum(vec, length);
		case -2:
			ret = vec_sum2(vec, length);
		case -3:
			ret = vec_sum3(vec, length);
		case -4:
			ret = vec_sum4(vec, length);
		case -8:
			ret = vec_sum8(vec, length);
	}
	return ret;
}
