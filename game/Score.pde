class ScoreBoard{
  float a;
  float b;
  float turn;
  ScoreBoard(){
    a=0;
    b=0;
    turn=1;
  }
  void changeScore(){
    for(int i = 0; i < 7; i++){
      if (balls[i].alive==0&& balls[i].counter==0){
        a+=1;
        balls[i].counter+=1; 
      }
      for(int j =8 ; j < 15; j++){
        if (balls[j].alive==0&& balls[j].counter==0){
          b+=1;
          balls[j].counter+=1; 
        }
      }
    }
  }
}
