#include <stdlib.h>
#include <stdio.h>
#include <errno.h>


#include "vec_sum.h"

double vec_sum(GRID_T *vect, int length){
	
	double sum = 0;
	#pragma nounroll
	#pragma novector
	for(int i = 0; i < length; ++i){
		sum += vect[i];
	}
	return sum;
}

//Loop unrolling with factor 2
double vec_sum2(GRID_T *vect, int length){
	
	double sum0 = 0;
	double sum1 = 0;
	#pragma nounroll
	#pragma novector
	for(int i = 0; i < length; i += 2){
		sum0 += vect[i];
		sum1 += vect[i+1];
	}
	if(length % 2 == 1){
		sum0 += vect[length];
	}
	return (sum0 + sum1);
}

//Loop unrolling with factor 3
double vec_sum3(GRID_T *vect, int length){
	
	double sum0 = 0;
	double sum1 = 0;
	double sum2 = 0;
	#pragma nounroll
	#pragma novector
	for(int i = 0; i < length; i += 3){
		sum0 += vect[i+0];
		sum1 += vect[i+1];
		sum2 += vect[i+2];
	}
	if(length % 3 == 1){
		sum0 += vect[length];
	} else if (length % 3 == 2){
		sum0 += vect[length];
		sum1 += vect[length-1];
	}
	return (sum0 + sum1 + sum2);
}

//Loop unrolling with factor 4
double vec_sum4(GRID_T *vect, int length){
	
	double sum0 = 0;
	double sum1 = 0;
	double sum2 = 0;
	double sum3 = 0;
	#pragma nounroll
	#pragma novector
	for(int i = 0; i < length; i += 4){
		sum0 += vect[i+0];
		sum1 += vect[i+1];
		sum2 += vect[i+2];
		sum3 += vect[i+3];
	}
	int scrap = length % 4;
	for (int j = 0; j < scrap; ++j){
		sum0 += vect[length-j];
	}	

	return (sum0 + sum1 + sum2 + sum3);
}

//Loop unrolling with factor 8
double vec_sum8(GRID_T *vect, int length){
	
	double sum0 = 0;
	double sum1 = 0;
	double sum2 = 0;
	double sum3 = 0;
	double sum4 = 0;
	double sum5 = 0;
	double sum6 = 0;
	double sum7 = 0;
	#pragma nounroll
	#pragma novector
	for(int i = 0; i < length; i += 8){
		sum0 += vect[i+0];
		sum1 += vect[i+1];
		sum2 += vect[i+2];
		sum3 += vect[i+3];
		sum4 += vect[i+4];
		sum5 += vect[i+5];
		sum6 += vect[i+6];
		sum7 += vect[i+7];
	}
	int scrap = length % 8;
	for (int j = 0; j < scrap; ++j){
		sum0 += vect[length-j];
	}	

	return (sum0 + sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7);
}

//Optimierung automatisiert durch den Compiler
double vec_sumOpt0(GRID_T *vect, int length){
	double sum = 0;
	#pragma unroll(0)
	for(int i = 0; i < length; ++i){
		sum += vect[i];
	}

	return sum;
}

double vec_sumOpt2(GRID_T *vect, int length){
	
	double sum = 0;
	#pragma unroll(2)
	for(int i = 0; i < length; ++i){
		sum += vect[i];
	}

	return sum;
}

double vec_sumOpt3(GRID_T *vect, int length){
	
	double sum = 0;
	#pragma unroll(3)
	for(int i = 0; i < length; ++i){
		sum += vect[i];
	}

	return sum;
}

double vec_sumOpt4(GRID_T *vect, int length){
	
	double sum = 0;
	#pragma unroll(4)
	for(int i = 0; i < length; ++i){
		sum += vect[i];
	}

	return sum;
}

double vec_sumOpt8(GRID_T *vect, int length){
	
	double sum = 0;
	#pragma unroll(8)
	for(int i = 0; i < length; ++i){
		sum += vect[i];
	}

	return sum;
}
