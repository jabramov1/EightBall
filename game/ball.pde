class ball {
  PVector coor;
  PVector v;
  color c;
  int number;
  float magnitude = 12.5 * .3;
  int alive = 1;

  
  ball (float x, float y, color col, int num) {
    coor = new PVector(x,y);
    v = new PVector(0,0);
    c = col;
    number = num;

  }

  void addvel() {
    coor.add(v); //updates ball position
  }
  
  void wallcollision() {
     if ((coor.x > 897.5) && (coor.y > 172 || coor.y < 528)) {
      coor.x = 897.5;
      v.x *= -1;
    } else if ((coor.x < 102.5) && (coor.y > 172 || coor.y < 528)) {
      coor.x = 102.5;
      v.x *= -1;
    } else if ((coor.y > 535) && ((coor.x > 107 && coor.x < 478) || (coor.x > 522 && coor.x < 893))) {
      coor.y = 535;
      v.y *= -1;
    } else if ((coor.y < 165) && ((coor.x > 107 && coor.x < 478) || (coor.x > 522 && coor.x < 893)))  {
      coor.y = 165;
      v.y *= -1;
    }
  }
  
  void ballCollision(ball other) {
    PVector distance = PVector.sub(other.coor,coor); //Distances between x and y of the balls
    float dis = distance.mag(); //distance between balls
 
    if (dis < 25.) {
      coor.add(v);
      other.coor.add(v);
      float dc = ((25 - dis) / 2.0);
      PVector ree = PVector.sub(other.coor,coor).normalize().mult(dc);
      other.coor.add(ree);
      coor.sub(ree);
      
      float angle = distance.heading();
      float si = sin(angle);
      float cosi = cos(angle);
      
      PVector[] bheld = { new PVector(), new PVector() };
      
      bheld[1].x = si * distance.y + cosi * distance.x;
      bheld[1].y = cosi * distance.y - si * distance.x;
      
      PVector[] vheld = { new PVector(), new PVector() };
      
      vheld[0].x = cosi * v.x + si * v.y;
      vheld[0].y = cosi * v.y - si * v.x;
      vheld[1].x = cosi * other.v.x + si * other.v.y;
      vheld[1].y = cosi * other.v.y - si * other.v.x;
      
      PVector[] finalvel = { new PVector(), new PVector() };
      
      finalvel[0].x = vheld[1].x;
      finalvel[0].y = vheld[0].y;
      finalvel[1].x = vheld[0].x;
      finalvel[1].y = vheld[1].y;
      
      PVector[] finalb = { new PVector(), new PVector() };
      
      finalb[0].x = cosi * bheld[0].x - si * bheld[0].y;
      finalb[0].y = cosi * bheld[0].y + si * bheld[0].x;
      finalb[1].x = cosi * bheld[1].x - si * bheld[1].y;
      finalb[1].y = cosi * bheld[1].y + si * bheld[1].x;
     
      coor.add(finalb[0]);
      
      v.x = cosi * finalvel[0].x - si * finalvel[0].y;
      v.y = cosi * finalvel[0].y + si * finalvel[0].x;
      other.v.x = cosi * finalvel[1].x - si * finalvel[1].y;
      other.v.y = cosi * finalvel[1].y + si * finalvel[1].x;
      }
  }
  
  void display() {
    if (v.x > 0) {
      v.x *= .987;
    }
    if (v.y > 0) {
      v.y *= .987;
    }
    if(v.x < 0) {
      v.x *= .987;
    }
    if(v.y < 0) {
      v.y *= .987;
    }
  
 
    if (alive == 1) {
      noStroke();
      fill(c);
      circle(coor.x, coor.y, 25);
      fill(255);
      circle(coor.x,coor.y, 10);
     // PFont font;
     // font = createFont("interstate-boldcompressed.ttf",10);
     // textFont(font);
      textSize(8);
      fill(0);
      textAlign(CENTER);
      if (number != 100) {
      text(str(number), coor.x + .2, coor.y + 4);
      }
    }
    
   
    
}
}

  

      
    
