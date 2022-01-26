/* Shreyash Mishra*
 *Head Basketball Assignment*
 ********************/

//Shreyash Mishra, ICS 3U1,Head Basketball, this project was made through restrictions to restrict all objects inside the canvas, multiple game states, and through collision detection

// Last worked on: January 26, 2022 <

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
PVector Position = new PVector(500, 400);
PVector Velocity = new PVector(0, 0);
PVector Acceleration = new PVector(0, 2);
float elasticity = 0.8;
float airResistance = 0;
int xSpeed;
int ySpeed;
int xButton = 20;
int yButton = 20;
ImageWithPosition steph; 
ImageWithPosition kobe;
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

  steph = new ImageWithPosition(player1, player1MovmentX, 300);
  kobe = new ImageWithPosition(player2, player2MovmentX, 300);
  time=millis();
  xSpeed = 2;
  ySpeed = 3;
  xButton = 0;
  yButton = 0;
}
//f
void draw() {
  if (gameState1 == 1) {
    background(backgroundGameState1);
    if (millis() > time + 1000) {
      fill(255, 255, 255);
      textSize(40);
      //  text("Click on 'h' or 'H' to access the how to play page!", 10, 200);

      // delay(3000); Used as a test to see how the  delay would work and found it to be extremely slow so I increased it to 1000 milliseconds
    }
    drawGameState1();
  }     
  if (gameState1 == 0) {
    background(0, 0, 0);
    String howToPlay = "How to play Head Basketball Remake";
    textSize(36);
    fill(255, 255, 255);
    text(howToPlay, 200, 100);
    rect(490, 150, 10, 400);
    textSize(24);
    text("Player 1", 190, 170);
    text("Player 2", 690, 170);
    text("Click on a to move left", 120, 230);
    text("Click on d to move right", 120, 330);
    text("Click on the left arrow key to move left", 530, 230);
    text("Click on the right arrow key to move right", 510, 330);
    //text("");
    //text();
    drawGameState0();
  }
  if (gameState1 == 2) {
    background(background);
    steph.setXpos(player1MovmentX);
    kobe.setXpos(player2MovmentX);
    steph.drawImage();
    kobe.drawImage();
    drawGameState2();
    if (millis() < time + 1000) {
      //  text("Click On Space To Play!", 100, 100);
      textSize(20);
      textSize(40);
      //   text("Click on 'h' or 'H' to access the how to play page!", 10, 200);

      // delay(3000); Used as a test to see how the  delay would work and found it to be extremely slow so I increased it to 1000 milliseconds
    }
  } 
  if (player1MovmentX < 30) {
    player1MovmentX = 30;
  }
  if (player1MovmentX > 850) {
    player1MovmentX = 850;
  }
  if ( player2MovmentX < 30) {
    player2MovmentX = 30;
  }
  if (player2MovmentX > 850) {
    player2MovmentX = 850;
  }

  //  if (gameState2 == 3) {
  //  text("Congrats you won!");
  //}
}
void drawGameState1() {
  fill(0, 0, 0);
  drawButton(10, 0, 200, 100);
  textSize(20);
  fill(255, 255, 255);
  text("Click on the button", 10, 20);
  text("to learn how to play", 10, 50);
  text("head basketball", 10, 80);
  fill(0, 0, 0);
  drawButton1(300, 0, 200, 100);

  fill(255, 255, 255);
  text("Click to play", 305, 20);
  text("headbasketball!", 305, 50);
}
void drawGameState0() {
  fill(255, 255, 255);
  drawButton2(0, 450, 175, 100);
  fill(0, 0, 0);
  text("Click to go to", 10, 500);
  text("homescreen!", 10, 530);
}
void drawGameState() {
}

void drawGameState2() {
  drawBall();
  checkIfBallHitEdge();
  moveBall();
  drawPlayer1Movment();
  drawPlayer2Movment();
  drawCollisonDetection();
}
void drawGameState3() {
}
void drawPlayer1Movment() {
  if (moveRight) {
    player1MovmentX += 10;
  }
  if (moveLeft) {
    player1MovmentX -= 10;
  }
}
void drawPlayer2Movment() {
  if (moveRight2) {
    player2MovmentX += 10;
  }
  if (moveLeft2) {
    player2MovmentX -= 10;
  }
}

//pvectors used here
void drawBall() {
  ellipse(Position.x, Position.y, 50, 50);

  fill(0, 0, 0);
}

void moveBall() {
  Velocity = Velocity.add(Acceleration);
  Velocity = Velocity.mult((0.9-airResistance)); // This slows the ball down a little bit each instant
  Position = Position.add(Velocity);
  Position.x=Position.x+xSpeed;
}
//pvectors end here

void checkIfBallHitEdge() {
  println(Position.x);
  if (Position.x < 0 || Position.x > width) {
    Velocity.x *= -1;
  }
  if (Position.y < 100) {
    Velocity.y *= -1;
  }
  if (Position.y > height-150) { // Strikes the ground
    Velocity.y *= -elasticity;
    Position.y = height-150;
    if (Position.x>width-20) {
      xSpeed=abs(xSpeed);
    }
    if (Position.x<50) {
      xSpeed=abs(xSpeed);
    }
    if (Position.x > width-40) {
      xSpeed = -abs(xSpeed);
    } else if (Position.y>height) {
    } else if (Position.y<20) {
      ySpeed = -ySpeed;
    }
  }
}

void drawButton(int xButton, int yButton, int Width, int tall) {
  rect(xButton, yButton, Width, tall);
  if (mouseX > xButton && mouseX < xButton + Width &&  mouseY > yButton && mouseY < yButton + tall && mousePressed) {
    gameState1 = 0;
  }
}
void drawButton1(int xButton, int yButton, int Width, int tall) {
  rect(xButton, yButton, Width, tall);
  if (mouseX > xButton && mouseX < xButton + Width &&  mouseY > yButton && mouseY < yButton + tall && mousePressed) {
    gameState1 = 2;
  }
}
void drawButton2(int xButton, int yButton, int Width, int tall) {
  rect(xButton, yButton, Width, tall);
  if (mouseX > xButton && mouseX < xButton + Width &&  mouseY > yButton && mouseY < yButton + tall && mousePressed) {
    gameState1 = 1;
  }
}
void drawCollisonDetection() {
  ArrayList<ImageWithPosition> collidingImages = new ArrayList();
  collidingImages.add(kobe);
  collidingImages.add(steph);


  for (ImageWithPosition imageBeingCheckedForCollision : collidingImages) {
    System.out.println(Position.x+"   "+imageBeingCheckedForCollision.getXpos()+"  w:"+imageBeingCheckedForCollision.getImage().width);
    xSpeed = -xSpeed;

    //System.out.println(Position.x+"ok");
    if (Position.x < imageBeingCheckedForCollision.getXpos()+imageBeingCheckedForCollision.getImage().width && Position.x > imageBeingCheckedForCollision.getXpos()) {
      // collisionCode here, refer to the currently looked at image as "img"


      //xSpeed = abs(xSpeed);
      System.out.println("yea I'm colliding"+imageBeingCheckedForCollision);
      xSpeed = -xSpeed;

    }
    if(Position.y < imageBeingCheckedForCollision.getYpos()+imageBeingCheckedForCollision.getImage().height && Position.y > imageBeingCheckedForCollision.getYpos()){
      //if(imageBeingCheckedForCollision == ){
   //if(colliding with y){
      //HERE the ball collides with both X and Y, meaning it's exactly on the image.
   }
}
    }
   // if(){
      
    //}
  }
  
}
class ImageWithPosition {
  private PImage player1;
  private int xPos, yPos;
  public ImageWithPosition(PImage player1, int xPos, int yPos) {
    this.player1 = player1;
    this.xPos = xPos;
    this.yPos = yPos;
  }

  public void drawImage() { 
    image(player1, xPos, yPos);
  }  
  public int getXpos() {
    return xPos;
  }
  public int getYpos() {
    return yPos;
  }

  public void setXpos(int newXpos) {
    this.xPos=newXpos;
  }
  public void setypos(int newYpos) {
    this.yPos = newYpos;
  }
  public PImage getImage() {
    return player1;
  }
}

void keyPressed() {
  if (gameState1 == 1) {
    if (keyCode == 32) {
      gameState1 = 2;
    }
    if (keyCode == 72) {
      gameState1 = 0;
    }
  } else if (gameState1 == 2) {
    if (keyCode == RIGHT) {
      moveRight = true;
    }
    if (keyCode == LEFT) {
      moveLeft = true;
    }
    if (keyCode == 68) {
      moveRight2 = true;
    }
    if (keyCode == 65) {
      moveLeft2 = true;
    }
   // if (keyCode == UP) {
     // Velocity.y = -70;
    //}
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
