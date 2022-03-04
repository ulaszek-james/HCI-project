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
Platform p1 = new Platform(350, 550);

Entity e1 = new Entity(400, 610);
Entity e2 = new Entity(200, 570);

// counter to control entity movement
float entityRange = 0;

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
  levelSelect = false;
  paused = false;
  controls = false;

  left = false;
  right = false;
  up = false;

  startButton = new Button("START", 26, 235, 400, width/3, height/10);
  controlButton = new Button("Controls", 18, 40, width-120, width/6, height/12);
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
    // levelSelectScreen();
    runGame();
  }
}

void runGame() {
  gameOver = false;
  background(255);
  println("posx: " + player.posX);
  println("posy: " + player.posY);
  println("");
  
  println("Entity dist: " + (player.posX-e1.e_posX));
  println("Entity health: " + e1.e_health);

  //ground
  for (int i = 0; i < 700; i+=100) {
    image(ground, i, 750);
  }
  p.display();
  p1.display();
  
  e1.drawEnt();
  e2.drawEnt();

  if (intersection(player, p)) {
    push();
    fill(255, 255, 0, 50);
    rect(0, 0, width, height);
    player.pBeg = p.x;
    player.pEnd = p.x + 200;
    player.land();
    pop();
  }
  
  if (intersection(player, p1)) {
    push();
    fill(255, 255, 0, 50);
    rect(0, 0, width, height);
    player.pBeg = p1.x;
    player.pEnd = p1.x + 200;
    player.land();
    pop();
  }
  player.update();

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
    
  if(paused) {
    drawPausedScreen();
  }
  
  // Move entities
  e1.moveEnt(1.5);
  e2.moveEnt(1);
  
  //player.drawAttack();
}


void drawPausedScreen() {
  push();
  textSize(64);
  fill(0);
  text("Paused", 350, 350);
  pop();
  if(backButton.MouseIsOver()) {
    backButton.drawActiveButton();
  } else {
    backButton.drawButton();
  }
  
  if(controlButton.MouseIsOver()) {
    controlButton.drawActiveButton();
  } else {
    controlButton.drawButton();
  }
  
  if(controls) {
    controlScreen.drawWindow();
  }
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
  float combinedHalfH = r1.h/2 + r2.h/2 + 20; // added 20 to appear on top of the platform

  //check for intersection
  if (abs(distanceX) < combinedHalfW) {
    if (abs(distanceY) < combinedHalfH) {
      return true;
    }
  }

  return false;
}
