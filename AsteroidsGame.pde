//your variable declarations here
 boolean aIsPressed = false;
 boolean dIsPressed = false;
 boolean wIsPressed = false;
 boolean rIsPressed = false;
 
Star[] manyStars = new Star[350];
Spaceship ship;
public void setup() 
{
  size(500,500); 
  ship = new Spaceship();
  for(int i = 0 ; i < manyStars.length; i++){
    manyStars[i] = new Star();
    
  }
}
public void draw() 
{
  background(0);
  ship.show();
    if(aIsPressed == true){
   ship.turn(-10); 
  } 
  if(dIsPressed == true){
   ship.turn(10); 
  } 
  if(wIsPressed == true){
   ship.accelerate(.08); 
  }
  for(int i = 0 ; i < manyStars.length; i++){
    manyStars[i].show();
  }
 
  ship.move();
}
public void keyPressed(){
 //movement
  if(key == 'a'){
    aIsPressed = true;
  } 
  if(key == 'd'){
   dIsPressed = true;
  }
  if(key == 'w'){
   wIsPressed = true; 
  }
    if(key == 'r'){
    ship.Hyperspace(true);
  }

  
}
public void keyReleased(){
 if(key=='a'){
   aIsPressed = false;
 } 
 if (key=='d'){
  dIsPressed = false; 
 } 
 if(key == 'w'){
   wIsPressed = false; 
  }
  if(key == 'r'){
   rIsPressed = false; 
  }
  
}
