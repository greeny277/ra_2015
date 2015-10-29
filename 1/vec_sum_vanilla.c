#include <stdlib.h>
#include <stdio.h>
#include <errno.h>


#include "vec_sum.h"

double vec_sum(GRID_T *vect, int length){
	
	double sum = 0;
	for(int i = 0; i < length; ++i){
		sum += vect[i];
	}
	return sum;
}
