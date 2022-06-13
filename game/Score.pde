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
        if (turn==1){ turn =2;}
        }
    }
      for(int j =8 ; j < 15; j++){
        if (balls[j].alive==0&& balls[j].counter==0){
          b+=1;
          balls[j].counter+=1;
          if (turn==2){ turn =1;}
        }
      }
        if (balls[7].alive==0 && balls[7].counter==0 && a==7 &&b<7){
          a+=1;
          balls[7].counter+=1;
        }
      if (balls[7].alive==0 && balls[7].counter==0 && b==7 && a<7){
          b+=1;
          balls[7].counter+=1;
      }
      if (balls[7].alive==0 && balls[7].counter==0 && b==7 && a==7){
        if (turn==1){
          a+=1;
          balls[7].counter+=1;
        }
         if (turn==2){
          b+=1;
        }
    }
  }
  
    
  void changeTurn(){
    if (BallsStill() && counter1==0){
      turn+=1;
    if(turn ==3){
      turn=1;
    }
    counter1+=1;
  }
}
}
