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
 
 public PVector getLocation(){
   return location;
 }
 
 public void open(){
   fill(255,0,0);
   square((location.x), (location.y), 40);
 }
 
}
