// Game State
boolean gameOver;
boolean levelSelect;
boolean paused;
boolean controls;
boolean newletter;

boolean left, right, up, down;

// Game Buttons
Button startButton;
Button controlButton;
Button backButton;

Knight player = new Knight();
Platform p = new Platform(100, 600);
Platform p1 = new Platform(350, 550);
Platform p2 = new Platform(567, 367);
Platform p3 = new Platform(300, 245);
Platform groundFlr = new Platform(100, 100); 

//ENTITIES
Entity e1 = new Entity(400, 610);
Entity e2 = new Entity(300, 215);
float entityRange = 0;

// Game controllers
boolean mk;

// Game Screens
ControlScreen controlScreen;

//sprites
PImage bckgrnd;
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
  bckgrnd = loadImage("temp.jpg");
  groundFlr.grndFloor(0, 637);

  imageMode(CENTER);
  gameOver = true;
  paused = false;
  controls = false;

  left = false;
  right = false;
  up = false;

  startButton = new Button("START", 26, 400, 400, width/3, height/10);
  controlButton = new Button("Controls", 18, 40, 40, width/6, height/12);
  backButton = new Button("Back", 18, 40, width-120, width/6, height/12);

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
  background(bckgrnd);
  groundFlr.display(color(129, 133, 137));
  //println("posx: " + player.posX);
  //println("posy: " + player.posY);
  //println("");

  //ground
  for (int i = 0; i < 700; i+=100) {
    image(ground, i, 750);
  }
  p.display(color(129, 133, 137));
  p1.display(color(129, 133, 137));
  p2.display(color(129, 133, 137));
  p3.display(color(129, 133, 137));
  
  if(e1.e_health > 0){
    e1.drawEnt();
  }
  if(e2.e_health > 0){
    e2.drawEnt();
  }
 

  if (intersection(player, p)) {
    //fill(255, 255, 0, 50);
    //rect(0, 0, width, height);
    player.pBeg = p.x;
    player.pEnd = p.x + 200;
    player.land(p.y);
  } else if (intersection(player, p1)) {
    //fill(255, 255, 0, 50);
    //rect(0, 0, width, height);
    player.pBeg = p1.x;
    player.pEnd = p1.x + 200;
    player.land(p1.y);
  } else if (intersection(player, p2)) {
    //fill(255, 255, 0, 50);
    //rect(0, 0, width, height);
    player.pBeg = p2.x;
    player.pEnd = p2.x + 200;
    player.land(p2.y);
  } else if (intersection(player, p3)) {
    //fill(255, 255, 0, 50);
    //rect(0, 0, width, height);
    player.pBeg = p3.x;
    player.pEnd = p3.x + 200;
    player.land(p3.y);
  } else if (intersection(player, groundFlr)) {
    //fill(255, 255, 0, 50);
    //rect(0, 0, width, height);
    player.pBeg = groundFlr.x;
    player.pEnd = groundFlr.x + 200;
    player.land(groundFlr.y);
  } else {
    player.connected = false;
  }

  e1.moveEnt(1.5);
  e2.moveEnt(1.0);
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

  if (paused) {
    drawPausedScreen();
  }
}

void drawPausedScreen() {
  push();
  textSize(64);
  fill(0);
  text("Paused", 350, 350);
  pop();
  if (backButton.MouseIsOver()) {
    backButton.drawActiveButton();
  } else {
    backButton.drawButton();
  }

  if (controlButton.MouseIsOver()) {
    controlButton.drawActiveButton();
  } else {
    controlButton.drawButton();
  }

  if (controls) {
    controlScreen.drawWindow();
  }
}

void keyPressed() {
  if (!paused) {
    if ((keyPressed == true) && (key == CODED)) {
      if (keyCode == RIGHT) {
        right = true;
        newletter = true;
      }
      if (keyCode == LEFT) {
        left = true;
        newletter = true;
      }
      if (keyCode == UP) {
        up = true;
        newletter = true;
      }
    }
    if (key == 'x') {
      newletter = true;
      player.atck = true;
    }
    if (key == 'p') {
      newletter = true;
      if (paused == false) {
        paused = true;
      }
    }
  }
  else{
    if (key == 'p') {
      newletter = true;
      if (paused == true) {
        paused = false;
      }
    }
  }
}

void keyReleased() {
  player.idling = true;
  //delay(250);//need a delay
  player.atck = false;
  left = false;
  right = false;
  up = false;
  if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP) {
    newletter = false;
  }
}

boolean intersection(Knight r1, Platform r2) {
  //distance on x axis
  float distanceX = (r1.posX + r1.w/2) - (r2.x + r2.w/2);
  //println("distance between bar: " + distanceX);
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
