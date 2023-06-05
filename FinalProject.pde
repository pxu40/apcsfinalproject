int gridSize = 20;
gridItem[][] grid = new gridItem[gridSize][gridSize];
int totalMines = 20;

void setup() {
  PImage minePhoto = loadImage("bomb.png");
  size(800, 800);
  
  /*
  sets up the array of grids, fills each location with a gridItem object
  */
  for(int i = 0; i < grid.length; i++) {
    for(int j = 0; j < grid[i].length; j++){
      fill(0, 255, 0);
      square((40 * i), (40 * j), 40);
      grid[i][j] = new gridItem(i, j);
    }
  }
  
    for(int i = 0; i < totalMines; i++){
      int m = 0;
      int n = 0;
      m = (int) random(0, 20);
      n = (int) random(0, 20);
      if (grid[m][n].checkIfMine() == false){
        grid[m][n].setMine();
        for(int a = -1; a < 2; a++){
          for(int b = -1; b < 2; b++){
              try {
                grid[m + a][n + b].incrementNearbyMineCount();
              } catch(Exception e){
              }
          }
        }
      } else {
        while (grid[m][n].checkIfMine()){
          m = (int) random(0, 20);
          n = (int) random(0, 20);
          grid[m][n].setMine();
          for(int a = -1; a < 2; a++){
            for(int b = -1; b < 2; b++){
                try {
                  grid[m + a][n + b].incrementNearbyMineCount();
                } catch(Exception e){
                }
            }
        }
      }
    }
  }
}

void mouseClicked() {
  int locationX = (mouseX / 40);
  int locationY = (mouseY / 40);
  PVector correctSquare = grid[locationX][locationY].getLocation();
  fill(255,0,0);
  square((correctSquare.x), (correctSquare.y), 40);
}
