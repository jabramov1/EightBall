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
    if (distance < r){
      other.alive = 0;
      other.vx=0;
      other.vy=0;
      other.x=1000*other.number;
      
    if (other.number==16&& BallsStill()){
      other.x=275;
      other.y=350;
      other.vx=0;
      other.vy=0;
      other.alive=1;
    }
  if (other.number==8 && BallsStill() && (Score.a !=7 && Score.b!=7)){
      other.x=400;
      other.y=400;
      other.vx=0;
      other.vy=0;
      other.alive=1;
  }
}
  }
}
