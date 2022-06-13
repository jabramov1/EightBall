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
float counter1;
 
 


Table table = new Table();
ScoreBoard Score= new ScoreBoard();


void setup(){
  size(1000,700);
}
void mouseReleased(){
  if (BallsStill()){
  power= dist(mouseX, mouseY, balls[15].x, balls[15].y);
  if (power>100){
  power=100;
}float dx=balls[15].x-mouseX;
 float dy=balls[15].y-mouseY;
 balls[15].vx=dx*power/800;
 balls[15].vy=dy*power/800;
counter1=0;
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
  for (Hole h : Holes) {
    h.display();
    for (int i = 0; i < 15; i ++) {
      h.pocketed(balls[i]);
    }
  }
  Score.changeScore();
  Score.changeTurn();
  for(int i = 0; i < balls.length-1; i++){
    for(int j = i+1; j<balls.length; j++){
      balls[i].collision(balls[j]);
    }
  }
  fill(0);
  textSize(15);
  text(frameRate,20,20);
  text("Score A : " +Score.a, 150,20);
  text("Score B : " +Score.b, 250,20);
  
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
void done(){
  if(Score.a==8 || Score.b==8){
    delay(600);
    background(255);
    textSize(20);
    text("Game over. Won!!!",400,400);
  }
}
  
