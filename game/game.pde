Ball[] balls = {
  new Ball(725,350,color(237,229,0),1),
  new Ball(750,337.5,color(7,28,166),2),
  new Ball(750,362.5,color(166,7,30),3),
  new Ball(775,325,color(77,0,105),4),
  new Ball(775,350,color(207,114,0),5),
  new Ball(775,375,color(13,133,0),6),
  new Ball(800,312.5,color(135,20,0),7),
  new Ball(800,337.5,color(0),8),
  new Ball(800,362.5,color(237,229,0),9),
  new Ball(800,387.5,color(7,28,166),10),
  new Ball(825,300,color(166,7,30),11),
  new Ball(825,325,color(77,0,105),12),
  new Ball(825,350,color(207,114,0),13),
  new Ball(825,375,color(13,133,0),14),
  new Ball(825,400,color(135,20,0),15),
  new Ball(275,350,color(255),100),
};
int numBalls = 4;


void setup(){
  size(1280,720);
}

void draw(){
  background(121);
  for(int i = 0; i < balls.length; i++){
    balls[i].display();
    balls[i].move();
  }
  textSize(40);
  textMode(LEFT);
  fill(0);
  text("Billiard Ball Collisions", width/4+100, 200);
  for(int i = 0; i < balls.length-1; i++){
    for(int j = i+1; j<balls.length; j++){
      collision(balls[i], balls[j]);
    }
  }
  
}

void collision(Ball b1, Ball b2){
  // This solution fixes the glitch that occurs
  // with multiple ball collisions.

  float dx = b2.x - b1.x;
  float dy = b2.y - b1.y;
  float dist = sqrt(dx*dx+dy*dy);
  
  if(dist < b1.radius + b2.radius-1){
    float angle = atan2(dy,dx);
    float sin = sin(angle), cos = cos(angle);
    
    float x1 = 0, y1 = 0;
    float x2 = dx*cos+dy*sin;
    float y2 = dy*cos-dx*sin;
    
    // rotate velocity
    float vx1 = b1.vx*cos+b1.vy*sin;
    float vy1 = b1.vy*cos-b1.vx*sin;
    float vx2 = b2.vx*cos+b2.vy*sin;
    float vy2 = b2.vy*cos-b2.vx*sin;
    
    // resolve the 1D case
    float vx1final = ((b1.mass-b2.mass)*vx1+2*b2.mass*vx2)/(b1.mass+b2.mass);
    float vx2final = ((b2.mass-b1.mass)*vx2+2*b1.mass*vx1)/(b1.mass+b2.mass);
    
    vx1 = vx1final;
    vx2 = vx2final;
    
    // fix the glitch by moving ball part equal to the overlap
    // see video for more details(https://youtu.be/guWIF87CmBg)

    float absV = abs(vx1)+abs(vx2);
    float overlap = (b1.radius+b2.radius)-abs(x1-x2);
    x1 += vx1/absV*overlap;
    x2 += vx2/absV*overlap;

    // rotate the relative positions back
    float x1final = x1*cos-y1*sin;
    float y1final = y1*cos+x1*sin;
    float x2final = x2*cos-y2*sin;
    float y2final = y2*cos+x2*sin;
    
    
     // finally compute the new absolute positions
    b2.x = b1.x + x2final;
    b2.y = b1.y + y2final;
    
    b1.x = b1.x + x1final;
    b1.y = b1.y + y1final;
    
    //rotate vel back
    b1.vx = vx1*cos-vy1*sin;
    b1.vy = vy1*cos+vx1*sin;
    b2.vx = vx2*cos-vy2*sin;
    b2.vy = vy2*cos+vx2*sin;
   
    
    }
 
}
