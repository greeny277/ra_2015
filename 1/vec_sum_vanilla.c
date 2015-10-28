#include <stdlib.h>
#include <stdio.h>
#include <errno.h>


#include "vec_sum.h"

GRID_T vec_sum(GRID_T *vect, int length){
	
	GRID_T sum = 0;
	for(int i = 0; i < length; i++){
		sum += vect[i];
	}
	return sum;
}
