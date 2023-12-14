class Bullet extends Floater{
  public Bullet(Spaceship ship){
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myXspeed = ship.getMyXSpeed();
    myYspeed = ship.getMyYSpeed();
    myPointDirection = ship.getMyPointDirection();
    
    super.accelerate(6);
  }
  
  public void show(){
    ellipse((float)myCenterX,(float)myCenterY, 10,10); 
  }
   public double getX(){
   return myCenterX; 
  }
  public double getY(){
   return myCenterY; 
  }
  
  
  
 
  
}
