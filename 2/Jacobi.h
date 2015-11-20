#ifndef _JACOBI_H
#define _JACOBI_H


/*
 * GRID_T is the datatype of the grid entries
 */
#define GRID_T float

/*
 * Flags which determines the intrinsic variants
 * to be used. Choose same type as picked for GRID_T.
 */
#define FLOAT
//#define DOUBLE

#include "JacobiVanilla.h"

/*
 * How many seconds loop should run until it stops
 */
#define LOOP_TIME 1

/* De-/ Activate write of ppm files */
#define OUTPUT

#endif /* _JACOB_H */
