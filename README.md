# GameOfLife

Conway's game of life implemented on a html canvas polling data from a q server via websockets
-----

  The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead, or "populated" or "unpopulated". Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:
    
    1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    2. Any live cell with two or three live neighbours lives on to the next generation.
    3. Any live cell with more than three live neighbours dies, as if by overpopulation.
    4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

##### *This implementation is different to that which is stated above. Namely, the world for these critters is not infinite. Cells at the borders have less neighbours than cells in the middle - so their are different conditions possible there


![alt tag](https://github.com/mkeenan-kdb/GameOfLife/blob/master/example.gif)
