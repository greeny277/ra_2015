#include <stdlib.h>
#include <limits.h>
#include <stdio.h>
#include <errno.h>
#include <inttypes.h>
#include <time.h>

/* structs */

/*structure for a cacheline instance */
typedef struct cacheline{
	uint32_t timestamp;
	uint32_t tag;

	char data[];
} cacheline;

/* Method declarations */
static long help_strtol(char *);
static cacheline *cache_init(int size_cache, int number_of_sets, int associativity, int size_cacheline);

int main(int argc, char **argv){
	if(argc < 7){
		fprintf(stderr, "Too less arguments: \
						 chache_simulator cache_size number_of_sets \
						 associativity size_of_cachelines replacement-strategy \
						 size_of_array\n");
		exit(EXIT_FAILURE);
	}

	/* FIXME: Do we need to scale the number of sets according to the cache size? */
	long size_cache     = help_strtol(argv[1]);

	long number_of_sets = help_strtol(argv[2]);
	long associativity  = help_strtol(argv[3]);
	long size_cacheline = help_strtol(argv[4]);
	char *replacement   = argv[5];
	long size_array     = help_strtol(argv[6]);

	cacheline *cache = cache_init(size_cache, number_of_sets, associativity, size_cacheline);
	if(!cache){
		exit(EXIT_FAILURE);
	}

	return EXIT_SUCCESS;
}

/** @brief Initiate cache depending on associativity, number
 *         of sets and cacheline size.
 */
static cacheline *cache_init(int size_cache, int number_of_sets, int associativity, int size_cacheline){
	cacheline *cache = malloc((sizeof(cacheline)+sizeof(char)*size_cacheline) * associativity * number_of_sets);
	if(!cache){
		perror("malloc");
	}
	return cache;
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
