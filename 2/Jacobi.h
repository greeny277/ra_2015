#ifndef _JACOBI_H
#define _JACOBI_H

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <immintrin.h>

/*
 * GRID_T is the datatype of the grid entries
 */
#define GRID_T double

#include "iacaMarks.h"

#include "JacobiVanilla.h"
#include "jacobi_sse.h"
#include "jacobi_avx.h"

/*
 * How many seconds loop should run until it stops
 */
#define LOOP_TIME 1

/* De-/ Activate write of ppm files */
#define OUTPUT

#endif /* _JACOB_H */
