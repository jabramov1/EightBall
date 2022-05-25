 void setup() {
   size(800, 800);
 }
 Unicycle dude = new Unicycle(20, 780, 40);
 void draw() {
   float addX= 0;
   ellipse(20, 780, 40, 40);
   line(20, 780, 20, 740);
 }
 void keyPressed(){
  if (keyCode==39){
    dude.increaseVelocity();
  }
  if (keycode=37){
    dude.decreaseVelocity();
  }
 }
