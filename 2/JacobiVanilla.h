/**
 * @brief  Computes one Jacobi Iteration. The borders will not be changed.
 *
 * @param oldGrid  owns entries of former computation. Read only.
 *
 * @param newGrid  stores results of computation based on oldGrid.
 *
 * @return No return value
 * */
void jacobiVanilla(GRID_T *, GRID_T *, int, int);
