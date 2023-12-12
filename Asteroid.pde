
class Asteroid extends Floater{
 protected double myRotationSpeed;
  public Asteroid() {
    myRotationSpeed = Math.random()* 2 - 1;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;    
    yCorners[0] = -8;    
    xCorners[1] = 7;    
    yCorners[1] = -8;    
    xCorners[2] = 13;    
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] =-11;
    yCorners[4] = 8;
    xCorners[5] = -13; 
    yCorners[5] = 0;

    myCenterX = Math.random()* 500;
    myCenterY = Math.random()* 500;

    myXspeed = Math.random()* 1.5 - 1;
    myYspeed = Math.random()* 1.5 - 1;

    myPointDirection = 0;

    myColor = 255;
  }
  public void setXCenter(double x){
    myCenterX = x;
  }
  public void setYCenter(double y){
    myCenterY = y;
  }
  public double getX(){
   return myCenterX; 
  }
  public double getY(){
   return myCenterY; 
  }
  public void move(){
    turn(myRotationSpeed * 5);
    super.move();
  } 
  
}
