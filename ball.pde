class Unicycle{
  float x, y;
  float dx, dy;
  float radius;
  public Unicycle(float x_, float y_, float radius_) {
    x = x_;
    y = y_;
    ss
    dx = 0;
    dy = 0;
  }
  void display() {
    ellipse(x, y, radius, radius);//set r to 40
    line(x, y, x, y-radius); 
  }
  void move() {
    x+=dx;
    y+=dy;
  }
  if (y >= height-radius/2 || y < radius/2){
      dy=0;
    }
  void gravity(){
    if (y>= height-radius/2){
    dy+=0.15;
    }
  }
  void increaseVelocity(){
    vx+=0.5;
  }
  void decreaseVelocity(){
    vx-=0.5;
  }
  
}
