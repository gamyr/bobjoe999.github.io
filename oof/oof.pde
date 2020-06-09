class Player {
  int isComp;
  int speed = 5;
  int size = 50;
  int x = 250;
  int y = 250;
  int dead = 0;
  Player(int computer) {
    isComp = computer;
  }
  void forward() {
    if(isComp == 0) y += speed;
  }
  void left() {
    if(isComp == 0) rotate(1*PI/180);
  }
  void right() {
    if(isComp == 0) rotate(2*PI-(1*PI/180));
}
  void update() {
    if(isComp == 1) {
      x += random(-10,10);
      y += random(-10,10);
      if((x>width+size/2) || (x<-size/2) || (y>height+size/2) || (y<-size/2)) {
        dead = 1;
      }
    }
    fill(255);
    if(dead == 0) rect(x, y, size, size);
  }
}

Player[] players =  new Player[0];

void setup() {
  rectMode(CENTER);
  size(500, 500);
  players = (Player[])append(players, new Player(0));
}

void draw() {
  background(0);
  if(frameCount%(round(frameRate*3/10)*10) == 0) {
    players = (Player[])append(players, new Player(1));
  }
  for(int i = 1; i<players.length; i++) {
    players[i].update();
  }
}
