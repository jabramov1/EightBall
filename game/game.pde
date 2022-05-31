float power, angle;

hole[] holes = {
  new hole(85,150,22),
  new hole(85,550,22),
  new hole(500,145,22),
  new hole(500,555,22),
  new hole(915,150,22),
  new hole(915,550,22),
};



ball[] balls = {
  new ball(500,350,color(237,229,0),1),
  new ball(500,337.5,color(7,28,166),2),
  new ball(500,362.5,color(166,7,30),3),
  new ball(500,325,color(77,0,105),4),
  new ball(500,350,color(207,114,0),5),
  new ball(500,375,color(13,133,0),6),
  new ball(500,312.5,color(135,20,0),7),
  new ball(500,337.5,color(0),8),
  new ball(500,362.5,color(237,229,0),9),
  new ball(500,307.5,color(7,28,166),10),
  new ball(500,300,color(166,7,30),11),
  new ball(500,305,color(77,0,105),12),
  new ball(500,300,color(207,114,0),13),
  new ball(500,305,color(13,133,0),14),
  new ball(500,300,color(135,20,0),15),
  new ball(500,300,color(255),100),
};



void setup() {
  frameRate(80);
  size(1000,700);
  balls[15].v.x = 30; //testing collision


}
