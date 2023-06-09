int gridSize = 20;
gridItem[][] grid = new gridItem[gridSize][gridSize];
int totalMines = 35;
int squaresLeft = (gridSize * gridSize) - totalMines; // When this hits zero, it will
boolean gameOver = false;
PImage minePhoto;

void setup() {
  minePhoto = loadImage("bomb.png");
  size(800, 800);

  // sets up the array of grids, fills each location with a gridItem object
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      fill(0, 255, 0);
      square((40 * i), (40 * j), 40);
      grid[i][j] = new gridItem(i, j);
    }
  }

  // Nested for loop that sets the mines in the grid, will keep looping to find a new location if the one selected already has a mine. When a mine is set, it will increment the nearby mine count of each square around it
  for (int i = 0; i < totalMines; i++) {
    int m = 0;
    int n = 0;
    m = (int) random(0, 20);
    n = (int) random(0, 20);
    if (grid[m][n].checkIfMine() == false) {
      grid[m][n].setMine();
      for (int a = -1; a < 2; a++) {
        for (int b = -1; b < 2; b++) {
          try {
            grid[m + a][n + b].incrementNearbyMineCount();
          }
          catch(Exception e) {
          }
        }
      }
    } else {
      while (grid[m][n].checkIfMine()) {
        m = (int) random(0, 20);
        n = (int) random(0, 20);
        if (grid[m][n].checkIfMine() == false) {
          grid[m][n].setMine();
          for (int a = -1; a < 2; a++) {
            for (int b = -1; b < 2; b++) {
              try {
                grid[m + a][n + b].incrementNearbyMineCount();
              }
              catch(Exception e) {
              }
            }
          }
          break;
        }
      }
    }
  }
}

//Mouse click functionality
void draw() {
  if ((squaresLeft != 0) && (gameOver == false)) {
    try { //I have a try here in case the mouse goes off the screen. That way, it won't stop the code if it does.
      if (mousePressed) {
        int locationX = (mouseX / 40);
        int locationY = (mouseY / 40);
        int result = grid[locationX][locationY].open(locationX, locationY);
        if (result == 0) {
          gameOver = true;
          textSize(100);
          fill(0, 408, 612);
          text("Game Lost", (200), (400));
        } else if (result == 1) {
          squaresLeft -= 1;
        } else if (result == 2) {
        }
      }
    }
    catch(Exception e) {
    }
  }
  if ((squaresLeft == 0) && (gameOver == false)) {
    textSize(100);
    fill(0, 408, 612);
    text("Game Won", (0), (0));
  }
}
