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


class Player {
  String direction = "";
  String olddirection = direction;
  String[] directions = {"right", "left", "up", "down"};
  int isComp;
  int speed = 5;
  int size = 50;
  int x = 250;
  int y = 250;
  int dead = 0;
  Player(int isComp) {
    this.isComp = isComp;
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
  void shootright() {
    
  }
  void update() {
    if(frameCount%(round(frameRate*0.1/10)*10) == 0) {
      direction = directions[int(random(directions.length))];
      olddirection = direction;
    }
    if(isComp == 1) {
      switch(direction) {
        //case "up":
        //  y -= speed;
        //  println(direction);
        case "right":
          x += speed;
          println(direction);
        //case "left":
        //  x -= speed;
        //  println(direction);
        case "down":
          y += speed;
          println(direction);
      }
    }
    if((x>width+size/2) || (x<-size/2) || (y>height+size/2) || (y<-size/2)) {
      dead = 1;
    }
    fill(255);
    if(dead == 0) rect(x, y, size, size);
  }
}


class Bullet {
  int speed = 10;
  int x;
  int y;
  String direction;
  Bullet(int x, int y, String direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
  }
  void update() {
    switch(direction) {
      case "right":
        x += speed;
    }
  }
}
