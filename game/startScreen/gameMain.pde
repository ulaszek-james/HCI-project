// Game State
boolean gameOver;
boolean paused;
boolean controls;


// Game Options
String[] startMenu = {"Start", "Controls"};

// Game Winddows
PShape controlWindow;

void settings() {
  size(700, 700);
}

void setup() {
  background(0);
  gameOver = true;
  paused = false;
  controls = false;
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

void keyPressed() {
  if (gameOver || paused) { // Game Session Control (Stopped/Paused)
    if (key == ' ') { // SPACEBAR PRESS
      // start or resume game
      if (gameOver) { // game over or not started
        gameOver = false; // start game
        System.out.println("starting game");
      } else if (paused) {
        paused = false; // resume game
      }
    }

    if (key == 'c') { // OPEN/CLOSE CONTROLS
      if(controls == false) {
        controls = true;
      } else {
        controls = false;
      }
    }
  }
}
