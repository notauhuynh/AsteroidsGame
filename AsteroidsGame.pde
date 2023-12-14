//your variable declarations here
private boolean aIsPressed = false;
private boolean dIsPressed = false;
private boolean wIsPressed = false;
private boolean kIsPressed = false;
public ArrayList <Asteroid> manyAsteroids;
public ArrayList <Asteroid> bigAsteroids;
public Star[] manyStars = new Star[350];
public Spaceship ship;
public ArrayList <Bullet> pew;
public int health = 5;
public int numOfAsteroids = 1;
public void setup()
{
  size(500, 500);
  ship = new Spaceship();
  pew = new ArrayList <Bullet>();
  manyAsteroids = new ArrayList <Asteroid>();
  bigAsteroids = new ArrayList <Asteroid>();
  for (int i = 0; i < manyStars.length; i++) {
    manyStars[i] = new Star();
  }
  for (int i = 0; i < 20; i++) {
    manyAsteroids.add(new Asteroid());
    if (i%2 == 0) {
      bigAsteroids.add(new BigAsteroid());
    }
  }
}
public void draw(){
  
  
  if(health > 0){
   background(0); 
  } 
  ship.show();
  if (aIsPressed == true) {
    ship.turn(-10);
  }
  if (dIsPressed == true) {
    ship.turn(10);
  }
  if (wIsPressed == true) {
    ship.accelerate(.08);
  }
  for (int i = 0; i < manyStars.length; i++) {
    manyStars[i].show();
  }
  for (int i = 0; i < manyAsteroids.size(); i++) {
    manyAsteroids.get(i).move();
    manyAsteroids.get(i).show();

    float t = dist((float)ship.getX(), (float)ship.getY(), (float)manyAsteroids.get(i).getX(), (float)manyAsteroids.get(i).getY());

    if (t < 20) {
      manyAsteroids.remove(i);
      health--;
    }
  }
  for (int i = 0; i < bigAsteroids.size(); i++) {
    bigAsteroids.get(i).move();
    bigAsteroids.get(i).show();
    float d = dist((float)ship.getX(), (float)ship.getY(), (float)bigAsteroids.get(i).getX(), (float)bigAsteroids.get(i).getY());
    if (d < 55) {
      bigAsteroids.remove(i);
      health--;
    }
  }

  ship.move();
  for (int i = 0; i < pew.size(); i++) {
    pew.get(i).show();
    pew.get(i).move();
  }
  for (int i = 0; i < manyAsteroids.size(); i++) {
    for (int g = 0; g < pew.size(); g++) {
      float d = dist((float)pew.get(g).getX(), (float)pew.get(g).getY(), (float)manyAsteroids.get(i).getX(), (float)manyAsteroids.get(i).getY());

      if (d < 20) {
        pew.remove(g);
        manyAsteroids.remove(i); 
        break;
      }
    }
  }
 for (int i = 0; i < bigAsteroids.size(); i++) {
    for (int g = 0; g < pew.size(); g++) {
      float d = dist((float)pew.get(g).getX(), (float)pew.get(g).getY(), (float)bigAsteroids.get(i).getX(), (float)bigAsteroids.get(i).getY());
      double temp = bigAsteroids.get(i).getX();
      double temp2 = bigAsteroids.get(i).getY();
      if (d < 55) {
        pew.remove(g);
        bigAsteroids.remove(i);
        manyAsteroids.add(new Asteroid(temp,temp2));        
        manyAsteroids.add(new Asteroid(temp,temp2));    
        break;
      }
    }
  }
  int numOfAsteroids = manyAsteroids.size() + bigAsteroids.size();
  textSize(10);
  text("number of asteroids left: " + numOfAsteroids, 20, 30);
  text("health: " + health, 20, 20);
  if(health <= 0){
   noLoop();
   stop();
   ship = null;
   textSize(30);
   fill(#D16161);
   text("You died! Refresh to try again.", 20,250);
  }
  if(numOfAsteroids == 0){
   noLoop();
   ship = null;
   textSize(30);
   fill(#62E86A);
   text("Good job! Refresh to play again.", 20, 250);
    
  }
}

public void keyPressed() {
  //bullet
  if (key == 'k') {
    kIsPressed = false;
  }

  //movement
  if (key == 'a') {
    aIsPressed = true;
  }
  if (key == 'd') {
    dIsPressed = true;
  }
  if (key == 'w') {
    wIsPressed = true;
  }
  if (key == 'r') {
    ship.Hyperspace(true);
  }
  if(kIsPressed == true){
   pew.add(new Bullet(ship)); 
  } 

}
public void keyReleased() {
   if (key == 'k') {
   pew.add(new Bullet(ship)); 
  
  }
  if (key=='a') {
    aIsPressed = false;
  }
  if (key=='d') {
    dIsPressed = false;
  }
  if (key == 'w') {
    wIsPressed = false;
  }
}


  
