class Hole{
  float x,y;
  float r;
  Hole(float x_, float y_, float rad){
    x=x_;
    y=y_;
    r=rad;
  }
  void display(){
    fill(20);
    circle(x,y,r*2);
    fill(255);
    line(x, y, 340, 80);
  }
  void pocketed(Ball other){
    float distance = dist(other.x, other.y, this.x, this.y);
    if (distance < other.radius-0.5){
      other.alive = 0;
    }
  }
}
