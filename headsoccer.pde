/* Shreyash Mishra*
 *Head Basketball Assignment*
 ********************/

//Shreyash Mishra, ICS 3U1,Head Basketball

// Last worked on: January 23, 2022 <
PImage background, backgroundGameState1, headbasketballbackground, player1, player2;
boolean moveRight, moveLeft, moveRight2, moveLeft2;
int canvasSizeX= 1000;
int canvasSizeY = 600;
int mainBackgroundX = 1000;
int mainBackgroundY = 600;
int gameState1 = 1;
int player1X = 100;
int player1Y = 200;
int player2X = 100;
int player2Y = 200;
int backgroundGameState1X= 1000;
int backgroundGameState1Y=600;
int time;
int player1MovmentX = 700;
int player2MovmentX = 100;


PVector Position = new PVector(250, 400);
PVector Velocity = new PVector(0, 0);
PVector Acceleration = new PVector(0, 5);
float elasticity = 0.8;
float airResistance = 0;

void setup() {
  //size of canvas is 1000 on the X-axis by 600 on the y-axis
  size(1000, 600);
  //Loaded images and called them, also made sure to resize them in order to match the canvas size or to make program more asthetically pleasing
  background = loadImage("headbasketballbackground.png");
  background.resize(mainBackgroundX, mainBackgroundY);
  backgroundGameState1 = loadImage("backgroundgamestate1.png");
  backgroundGameState1.resize(backgroundGameState1X, backgroundGameState1Y);
  player1 = loadImage("steph.png");
  //resized image for the steph curry png
  player1.resize(player1X, player1Y);
  player2 = loadImage("kobe.png");
  //resized the png
  player2.resize(player2X, player2Y);

  time=millis();
}

void draw() {
  if (gameState1 == 1) {
    background(backgroundGameState1);
    if (millis() > time + 1000) {
      text("Click On Space To Enter The Game!", 100, 100);
      textSize(50);
      // delay(3000); Used as a test to see how the  delay would work and found it to be extremely slow so I increased it to 1000 milliseconds
    }
    drawGameState1();
  }     
  if (gameState1 == 2) {
    background(background);
    image(player1, player1MovmentX, 300);
    image(player2, player2MovmentX, 300);
  } 
   if (player1MovmentX < 30) {
    player1MovmentX = 40;
  }
  if (player1MovmentX > 930) {
    player1MovmentX = 920;
  }
  if ( player2MovmentX < 30) {
    player2MovmentX = 40;
  }
  if (player2MovmentX > 930) {
    player2MovmentX = 920;
  }
  
  //  if (gameState2 == 3) {
  //  text("Congrats you won!");
  //}
}

void drawGameState1() {
}
void drawGameState2() {
    drawBall();
  checkIfBallHitEdge();
  moveBall();
  drawPlayer1Movment();
  drawPlayer2Movment();
  //drawBoundaries();

}
void drawGameState3() {
}
void drawPlayer1Movment() {
  if (moveRight) {
    player1MovmentX += 25;
  }
  if (moveLeft) {
    player1MovmentX -= 25;
  }
}
void drawPlayer2Movment() {
  if (moveRight2) {
    player2MovmentX += 25;
  }
  if (moveLeft) {
    player2MovmentX -= 25;
  }
}

//pvectors used here
void drawBall() {
  ellipse(Position.x, Position.y, 30, 30);
}

void moveBall() {
  Velocity = Velocity.add(Acceleration);
  Velocity = Velocity.mult((1-airResistance)); // This slows the ball down a little bit each instant
  Position = Position.add(Velocity);
}
//pvectors end here

void checkIfBallHitEdge() {
  if (Position.x < 0 || Position.x > width) {
    Velocity.x *= -1;
  }
  if (Position.y < 0) {
    Velocity.y *= -1;
  }
  if (Position.y > height) { // Strikes the ground
    Velocity.y *= -elasticity;
    Position.y = height;
  }
}


void keyPressed() {
  if (gameState1 == 1) {
    if (keyCode == 32) {
      gameState1 = 2;
    }
  } else if (gameState1 == 2) {
    if (keyCode == RIGHT) {
      moveRight = true;
      player1MovmentX += 25;
    }
    if (keyCode == LEFT) {
      moveLeft = true;
      player1MovmentX -= 25;
    }
    if (keyCode == 68) {
      moveRight2 = true; 
      player2MovmentX += 25;
    }
    if (keyCode == 65) {
      moveLeft2 = true; 
      player2MovmentX -= 25;
    }
    if (keyCode == UP) {
      Velocity.y = -70;
    }
  }
}




void keyReleased() {
  if (keyCode == RIGHT) {
    moveRight = false;
  }
  if (keyCode == LEFT) {
    moveLeft = false;
  }
  if (keyCode == 68) {
    moveRight2 = false;
  }
  if (keyCode == 65) {

    moveLeft2 = false;
  }
}
