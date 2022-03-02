// Game State
boolean gameOver;
boolean paused;
boolean controls;

// Game Buttons
Button startButton;
Button controlButton;

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
  
  startButton = new Button("START", 26, 400, 400, width/3, height/10);
  controlButton = new Button("Controls",18, 40, 40, width/6, height/12);
  
  mk = true; // mouse and keyboard is default controller
  
  controlScreen = new ControlScreen();
}

void draw() {
  if (gameOver) {
    startGameScreen();
  } else {
    runGame();
  }
}

void runGame() {
  background(255);
}


void pauseGame() {
}
