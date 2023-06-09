public class gridItem{
 boolean isOpened = false;
 int numNearbyMines;
 boolean isMine;
 PVector location = new PVector(0, 0);


 public gridItem(int a, int b){
   location.x = a;
   location.y = b;
 }
 
 public boolean checkIfMine(){
   return isMine;
 }
 
 public void setMine(){
   isMine = true;
 }
 
 public void incrementNearbyMineCount(){
   numNearbyMines += 1;
 }
 
 public void setLocation(int x, int y){
   location.x = x;
   location.y = y;
 }
 
 public int getLocationX(){
   return (int) location.x;
 }
 
  public int getLocationY(){
   return (int) location.y;
 }
 
 public int getNumMines(){
   return numNearbyMines;
 }
 
 public int open(int x, int y){
   if(isMine == true) {
     fill(255, 0, 0);
     square((x * 40), (y * 40), 40);
     return 0;
   } else if ((isMine == false) && (numNearbyMines > 0)){
     fill(255, 255, 255);
     square((x * 40), (y * 40), 40);
     if(numNearbyMines != 0){
       textSize(30);
       fill(0, 408, 612);
       text(numNearbyMines, (x * 40 + 5), (y* 40 + 35));
     }
     return 1;
   }
   else if ((numNearbyMines == 0)){
     fill(255, 255, 255);
     square((x * 40), (y * 40), 40);
     if(numNearbyMines != 0){
       textSize(30);
       fill(0, 408, 612);
       text(numNearbyMines, (x * 40 + 5), (y* 40 + 35));
     }
     return 2;
   }
   else{
     return 3;
   }
 }
 
 public int clearSpace(int x, int y){
   if(isMine == true) {
     return 0;
   } else if ((isMine == false) && (numNearbyMines > 0)){
     fill(255, 255, 255);
     square((x * 40), (y * 40), 40);
     if(numNearbyMines != 0){
       textSize(30);
       fill(0, 408, 612);
       text(numNearbyMines, (x * 40 + 5), (y* 40 + 35));
     }
     return 1;
   }
   else if ((numNearbyMines == 0)){
     fill(255, 255, 255);
     square((x * 40), (y * 40), 40);
     if(numNearbyMines != 0){
       textSize(30);
       fill(0, 408, 612);
       text(numNearbyMines, (x * 40 + 5), (y* 40 + 35));
     }
     return 2;
   }
   else{
     return 3;
   }
 }
 
}
