#include <stdlib.h>
#include <limits.h>
#include <stdio.h>
#include <errno.h>

/* Method declarations */
static long help_strtol(char *);

int main(int argc, char **argv){
	if(argc < 6){
		fprintf(stderr, "Too less arguments: \
						 chache_simulator cache_size number_of_sets \
						 associativity size_of_cachelines replacement-strategy \
						 size_of_array\n");
		exit(EXIT_FAILURE);
	}
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
