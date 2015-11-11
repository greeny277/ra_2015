/**
 * @brief  Computes one Jacobi Iteration. The borders will not be changed.
 *
 * @param oldGrid  owns entries of former computation. Read only.
 *
 * @param newGrid  stores results of computation based on oldGrid.
 *
 * @return No return value
 * */
void jacobi_avx(GRID_T *, GRID_T *, int, int);
void jacobi_normal(GRID_T *, GRID_T *, int, int);
void jacobi_sse(GRID_T *, GRID_T *, int, int);
