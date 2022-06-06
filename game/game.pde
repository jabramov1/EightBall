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
  size(1280,1000);
}

void draw(){
  
  background(121);
  for(int i = 0; i < balls.length; i++){
    balls[i].display();
    balls[i].move();
    balls[i].friction();
  }
  for(int i = 0; i < balls.length-1; i++){
    for(int j = i+1; j<balls.length; j++){
      balls[i].collision(balls[j]);
    }
  }
  
}
