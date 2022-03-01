// Game State
boolean gameOver = true;
boolean paused = false;
boolean controlScreen = false;


// Game Options
String[] startMenu = {"Start", "Controls"};

void settings() {
  size(700, 700);
}

void setup() {
  background(0);
}

void draw() {
  if(gameOver) {
    startGameScreen();
  } else {
    runGame();
  }
}

void runGame() {
  background(255);
}

void showControls() {
  shape(
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
    
    if(key == 'c') { // Open Controls Menu
      if(!controlScreen) { // display control screen
        showControls();
      }
    }
  }
}
