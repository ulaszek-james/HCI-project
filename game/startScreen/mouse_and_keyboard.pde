// File that handles mouse and keyboard controller

void mousePressed() {
  if (mk && gameOver) { // at main menu
    if (!controls) { // only clickable while control menu is not open
      if (startButton.MouseIsOver()) {
        startButton.drawClickedButton();
        gameOver = false; // start game
      }
      if (controlButton.MouseIsOver()) { // open Control Window
        controls = true;
      } else {
        controls = false;
      }
    } else {
      if(!controlScreen.MouseIsOver()) {
        controls = false;
      }
    }
  }
}

void keyPressed() {
  //if (mk && (gameOver || paused)) { // Game Session Control (Stopped/Paused)
  //  if (key == ' ') { // SPACEBAR PRESS
  //    // start or resume game
  //    if (gameOver) { // game over or not started
  //      gameOver = false; // start game
  //      System.out.println("starting game");
  //    } else if (paused) {
  //      paused = false; // resume game
  //    }
  //  }

  //if (key == 'c') { // OPEN/CLOSE CONTROLS
  //  if(controls == false) {
  //    controls = true;
  //  } else {
  //    controls = false;
  //  }
  //}
}
