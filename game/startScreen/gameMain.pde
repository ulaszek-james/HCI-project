// Game State
boolean gameOver;
boolean paused;
boolean controls;

// Game Buttons
Button startButton;
Button controlButton;

// Game controllers
boolean mk;

void settings() {
  size(700, 700);
}

void setup() {
  background(0);
  gameOver = true;
  paused = false;
  controls = false;
  mk = true; // mouse and keyboard is default controller
  
  startButton = new Button("START", 400, 400, width/3, height/10);
  controlButton = new Button("Controls", 80, 40, width/4, height/10);
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
