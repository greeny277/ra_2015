/**
 * @brief  Computes one Jacobi Iteration. The borders will not be changed.
 *
 * @param oldGrid  owns entries of former computation. Read only.
 *
 * @param newGrid  stores results of computation based on oldGrid.
 *
 * @return No return value
 * */

double vec_sum(GRID_T*, int);
double vec_sum2(GRID_T*, int);
double vec_sum3(GRID_T*, int);
double vec_sum4(GRID_T*, int);
double vec_sum8(GRID_T*, int);
double vec_sumOpt0(GRID_T*, int);
double vec_sumOpt2(GRID_T *vect, int);
double vec_sumOpt3(GRID_T *vect, int);
double vec_sumOpt4(GRID_T *vect, int);
double vec_sumOpt8(GRID_T *vect, int);
