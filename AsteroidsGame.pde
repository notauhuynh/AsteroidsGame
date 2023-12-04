//your variable declarations here
 boolean aIsPressed = false;
 boolean dIsPressed = false;
 boolean wIsPressed = false;
 boolean rIsPressed = false;
 ArrayList <Asteroid> manyAsteroids;
Star[] manyStars = new Star[350];
Spaceship ship;
public void setup() 
{
  size(500,500); 
  ship = new Spaceship();
  manyAsteroids = new ArrayList <Asteroid>();
  for(int i = 0 ; i < manyStars.length; i++){
    manyStars[i] = new Star();
  }
  for(int i = 0; i < 20; i++){
   manyAsteroids.add(new Asteroid()); 
    
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
  for(int i = 0; i < manyAsteroids.size(); i++){
    manyAsteroids.get(i).move();
    manyAsteroids.get(i).show();
    float t = dist((float)ship.getX(), (float)ship.getY(),(float)manyAsteroids.get(i).getX(), (float)manyAsteroids.get(i).getY());
    if(t < 20){
     manyAsteroids.remove(i); 
    }
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
