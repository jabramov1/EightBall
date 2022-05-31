class ball {
  PVector coor;
  PVector v;
  color c;
  int number;
  int alive = 1;
  
  ball (float x_, float y_, color col, int num) {
    coor = new PVector(x,y);
    v = new PVector(0,0);
    c = col;
    number = num;
  }
  void move() {
    coor.add(v);
  }
