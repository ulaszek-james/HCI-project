// Game State
boolean gameOver;
boolean levelSelect;
boolean paused;
boolean controls;
int currentLevel;

// Game Buttons
Button startButton;
Button controlButton;
Button backButton;
Button level1Button;
Button level2Button;
Button level3Button;

// Game controllers
boolean mk;

// Game Screens
ControlScreen controlScreen;

void settings() {
  size(700, 700);
}

void setup() {
  background(0);
  gameOver = true;
  paused = false;
  controls = false;
  currentLevel = 0;
  
  startButton = new Button("START", 26, 400, 400, width/3, height/10);
  controlButton = new Button("Controls",18, 40, 40, width/6, height/12);
  backButton = new Button("Back",18, 40, 40, width/6, height/12);
  level1Button = new Button("Level 1", 18, 160, 160, width/6, height/12);
  
  mk = true; // mouse and keyboard is default controller
  
  controlScreen = new ControlScreen();
  
}

void draw() {
  if (gameOver) {
    startGameScreen();
  } else {
    levelSelectScreen();
    if(currentLevel > 0) {
      runGame(currentLevel);
    }
  }
}

void runGame(int level) {
  push();
  background(255);
  fill(0);
  textSize(64);
  text("On Level"+level, 350, 350);
  pop();
}


void pauseGame() {
}
