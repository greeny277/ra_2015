#include <stdlib.h>
#include <errno.h>


#define GRID_T float

static GRID_T *old_grid, *new_grid;

static int width, height;

static void init(GRID_T *);

int main(int argc, char** argv){

	width  = argv[1];
	height = argv[2];

	errno = posix_memalign(&old_grid, 64, width*height);
	if(errno){
		perror("posix_memalign");
	}

	errno = posix_memalign(&new_grid, 64, width*height);
	if(errno){
		perror("posix_memalign");
	}

	/* Initialize grids left and upper border with 1.0
	 * and the rest with 0.0 */
	init(old_grid);
	init(new_grid);

	free(&old_grid);
	free(&new_grid);
	return 0;
}

/* Method for initialization of a grid */
static void init(GRID_T *grid){
	return;
}
