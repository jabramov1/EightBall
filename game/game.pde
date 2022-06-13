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
 float mX;
 float mY;
Hole[] Holes = {
  new Hole(85,150,22),
  new Hole(85,550,22),
  new Hole(500,145,22),
  new Hole(500,555,22),
  new Hole(915,150,22),
  new Hole(915,550,22),
};
float power;
 
 


Table table = new Table();


void setup(){
  size(1000,700);
}
void mouseReleased(){
  if (BallsStill()){
  power= dist(mouseX, mouseY, balls[15].x, balls[15].y);
  if (power>10){
  power=10;
}float dx=balls[15].x-mouseX;
 float dy=balls[15].y-mouseY;
 balls[15].vx=dx*power/60;
 balls[15].vy=dy*power/60;
}
}


void draw(){
  background(255);
  table.display();
  if (mousePressed && BallsStill()){
    mX=mouseX;
    mY=mouseY;
    float dx=balls[15].x-mouseX;
    float dy=balls[15].y-mouseY;
    stroke(#DC143C);
    line(mouseX , mouseY, balls[15].x +dx*0.9, balls[15].y+dy*0.9);
    stroke(255);
    line(balls[15].x, balls[15].y,mouseX,mouseY);
  }
 
  
  
  noStroke();
  for(int i = 0; i < balls.length; i++){
    balls[i].display();
    balls[i].move();
    balls[i].friction();
  }
  for(int i = 0; i < Holes.length; i++){
    Holes[i].display();
  }
  for(int i = 0; i < balls.length-1; i++){
    for(int j = i+1; j<balls.length; j++){
      balls[i].collision(balls[j]);
    }
  }
}
boolean BallsStill(){
  boolean ans = true;
  for(int i = 0; i < balls.length; i++){
    if (balls[i].vx !=0 || balls[i].vy !=0){
      ans=false;
      return ans;
    }
  }return ans;
}
