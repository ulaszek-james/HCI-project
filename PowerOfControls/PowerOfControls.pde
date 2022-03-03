// Game State
boolean gameOver;
boolean levelSelect;
boolean paused;
boolean controls;

boolean left, right, up;

// Game Buttons
Button startButton;
Button controlButton;
Button backButton;

Knight player = new Knight();
Platform p = new Platform(100, 600);

// Game controllers
boolean mk;

// Game Screens
ControlScreen controlScreen;

//sprites
PImage knightIdleSprite;
PImage[] KI = new PImage[10];
PImage knightAtckSprite;
PImage[] KA = new PImage[4];
PImage knightForwardSprite;
PImage[] KF = new PImage[10];
PImage knightBackwardsSprite;
PImage[] KB = new PImage[10];
int cols = 10;
int w = 120;//tile width
int h = 80;//tile height

PImage ground;



void settings() {
  size(700, 700);
}

void setup() {
  background(0);

  imageMode(CENTER);
  gameOver = true;
  paused = false;
  controls = false;

  left = false;
  right = false;
  up = false;

  startButton = new Button("START", 26, 400, 400, width/3, height/10);
  controlButton = new Button("Controls", 18, 40, 40, width/6, height/12);
  backButton = new Button("Back", 18, 40, 40, width/6, height/12);

  mk = true; // mouse and keyboard is default controller

  controlScreen = new ControlScreen(); 

  ground = loadImage("ground.jpg");
  //sprites
  knightIdleSprite = loadImage("_Idle.png");
  for (int i = 0; i<KI.length; i++) {
    int tx = floor(i%cols)*w;
    int ty = floor(i/cols)*h;
    KI[i]=knightIdleSprite.get(tx, ty, w, h);
  }

  knightForwardSprite = loadImage("_Run.png");
  for (int i = 0; i<KF.length; i++) {
    int tx = floor(i%cols)*w;
    int ty = floor(i/cols)*h;
    KF[i]=knightForwardSprite.get(tx, ty, w, h);
  }

  knightAtckSprite = loadImage("_Attack.png");
  for (int i = 0; i<KA.length; i++) {
    int tx = floor(i%4)*w;
    int ty = floor(i/4)*h;
    KA[i]=knightAtckSprite.get(tx, ty, w, h);
  }
}

void draw() {
  if (gameOver) {
    startGameScreen();
  } else {
    levelSelectScreen();
    runGame();
  }
}

void runGame() {
  background(255);
  println("posx: " + player.posX);
  println("posy: " + player.posY);
  println("");

  //ground
  for (int i = 0; i < 700; i+=100) {
    image(ground, i, 750);
  }
  p.display();

  if (intersection(player, p)) {
    fill(255, 255, 0, 50);
    rect(0, 0, width, height);
    player.land();
  }
  player.update();

  gameOver = false;
  if (player.idling == true && player.atck == false) {
    player.drawIdle();
  } else if (player.atck == true) {
    player.drawAttack();
  } else {
    if (player.direction == true) {
      player.drawMoveForward();
    } else {
      player.drawMoveBackwards();
    }
  }

  //player.drawAttack();
}


void pauseGame() {
}

void keyPressed() {
  if ((keyPressed == true) && (key == CODED)) {
    if (keyCode == RIGHT) {
      right = true;
    }
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == UP) {
      up = true;
      player.jump = true;
    }
  }
  if (key == 'x') {
    //print("ATTACK");
    player.atck = true;
  }
}

void keyReleased() {
  player.idling = true;
  delay(250);//need a delay
  player.atck = false;
  left = false;
  right = false;
  up = false;
}

boolean intersection(Knight r1, Platform r2) {
  //distance on x axis
  float distanceX = (r1.posX + r1.w/2) - (r2.x + r2.w/2);
  println("distance between bar: " + distanceX);
  //distance on y axis
  float distanceY = (r1.posY + r1.h/2) - (r2.y + r2.h/2);

  //combined half-widths
  float combinedHalfW = r1.w/2 + r2.w/2;
  //combined half-heights
  float combinedHalfH = r1.h/2 + r2.h/2;

  //check for intersection
  if (abs(distanceX) < combinedHalfW) {
    if (abs(distanceY) < combinedHalfH) {
      return true;
    }
  }

  return false;
}
