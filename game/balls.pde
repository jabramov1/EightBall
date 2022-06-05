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
  void friction(){
    if (vx!= 0) {
      vx *= .987;
      if (abs(vx)<0.1){
        vx=0;
      }
    }
    if(vy!= 0){
      vy *= .987;
      if (abs(vy)<0.1){
        vy=0;
      }
    }
  }
  void display() {
  
 
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
  void move(){
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
  void collision(Ball other){
  float dx = other.x - this.x;
  float dy = other.y - this.y;
  float dist = sqrt(dx*dx+dy*dy);
  
  if(dist < this.radius + other.radius){
    float angle = atan2(dy,dx);
    float sin = sin(angle), cos = cos(angle);
    
    float x1 = 0, y1 = 0;
    float x2 = dx*cos+dy*sin;
    float y2 = dy*cos-dx*sin;
    
    float vx1 = this.vx*cos+this.vy*sin;
    float vy1 = this.vy*cos-this.vx*sin;
    float vx2 = other.vx*cos+other.vy*sin;
    float vy2 = other.vy*cos-other.vx*sin;

    float vx1final = ((this.mass-other.mass)*vx1+2*other.mass*vx2)/(this.mass+other.mass);
    float vx2final = ((other.mass-this.mass)*vx2+2*this.mass*vx1)/(this.mass+other.mass);
    
    vx1 = vx1final;
    vx2 = vx2final;
    


    float absV = abs(vx1)+abs(vx2);
    float overlap = (this.radius+other.radius)-abs(x1-x2);
    x1 += vx1/absV*overlap;
    x2 += vx2/absV*overlap;

    // rotate the relative positions back
    float x1final = x1*cos-y1*sin;
    float y1final = y1*cos+x1*sin;
    float x2final = x2*cos-y2*sin;
    float y2final = y2*cos+x2*sin;
    
    other.x = this.x + x2final;
    other.y = this.y + y2final;
    
    this.x = this.x + x1final;
    this.y = this.y + y1final;
    
    //rotate vel back
    this.vx = vx1*cos-vy1*sin;
    this.vy = vy1*cos+vx1*sin;
    other.vx = vx2*cos-vy2*sin;
    other.vy = vy2*cos+vx2*sin; 
    }
  }
}
