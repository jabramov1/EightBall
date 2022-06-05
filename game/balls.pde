class Ball {
  float x, y;
  float vx, vy, mass;
  color c;
  int number;
  float radius;
  int play;
  int alive=1;

  Ball(float x_, float y_, color col, int num) {
    x = x_;
    y = y_;
    vy = 0 ;
    radius = 12.5;  
    vx = 0;
    mass = 0.5;
    c=col;
    if (num>7) {
      play=2;
    } else {
      play=1;
    }
    number=num;
  }
  void display() {
    if (vx!= 0) {
      vx *= .987;
    }
    if (vy!= 0) {
      vy *= .987;
    }
  
 
    if (alive == 1) {
      noStroke();
      if(play==2){
        fill(255);
        circle(x,y,25);
        fill(c);
        circle(x,y,22);
      }
      else{
      fill(c);
      circle(x, y, 25);
      }
      fill(255);
      circle(x,y, 10);
      textSize(8);
      fill(0);
      textAlign(CENTER);
      if (number != 100) {
      text(str(number), x + .2, y + 4);
      }
    }
  }
  void move() {
    x += vx;
    y += vy;
    if (x > width - radius) {
      x = width - radius;
      vx = -vx;
    }
    if (x < radius) {
      x = radius;
      vx = -vx;
    }
    if (y > height - radius) {
      y = height - radius;
      vy = -vy;
    }
    if (y < radius) {
      y = radius;
      vy = -vy;
    }
  }
}
