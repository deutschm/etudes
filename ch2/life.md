# Cellular Automata and Computer Graphics

### Rules

1. The immediate neighbors of a cell are those cells ocuppying the eight horizontally, vertically, and diagonally adjacent cells.
eg. N N N
    N + N
    N N N
2. If a LIFE cell has fewer than two immediate neighbors, it dies of loneliness. If a LIFE cell has more than three immediate neighbors, it dies of overcrowding.
3. If an empty square has exactly three LIFE cells as immediate neighbors, a new cell is born in the square.
4. Births and deaths all take place exactly at the change of generations. Thus a dying ell may help birth a new one, but a newborn cell may not resurrect a dying cell, nor may one dying cell stave off death for another by lowering the local population density.

### Solution
The key to a good cellular automata program is a good method for counting neighbors. The brute force method for counting neighbors relys on catching edge and corner cases in a series of if-else statements which leads to slow generation. There torodial method allows the count for x and y to wrap around therefore placing the simulation on a torus. While this works in python, the implementation is awkward in julia. The third method for counting neighbors is to perform a convolution of the simulation grid. By displacing the grid by 1 in each direction (up, down, left, right and diagonally)using julia's circshift function and adding up the resultant 8 arrays, an array of neighbor counts is created. This can be iterated over and the rules can be applied to the original grid, therefore propagating only 1 array throughout the entire run of the program rather than creating a new array for each new generation. This method yields 10,000 generations of a 100x100 grid in 5.8 seconds (which could be reduced by print out less output). 