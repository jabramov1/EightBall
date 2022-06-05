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
      play=1;
    } else {
      play=2;
    }
  }
  void display() {
    if (x > 0) {
      vx *= .987;
    }
    if (vy > 0) {
      vy *= .987;
    }
    if(x < 0) {
      vx *= .987;
    }
    if(vy < 0) {
      vy *= .987;
    }
  
 
    if (alive == 1) {
      noStroke();
      fill(c) ;
      circle(x, y, 25);
      fill(255);
      circle(x,y, 10);
     // PFont font;
     // font = createFont("interstate-boldcompressed.ttf",10);
     // textFont(font);
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
