// File that handles mouse and keyboard controller

void mousePressed() {
  if(mk && gameOver) { // at main menu
    if(startButton.MouseIsOver()) {
      startButton.drawClickedButton();
      gameOver = false; // start game
    }
    if(controlButton.MouseIsOver()) {
      controls = true;
    } else {
      controls = false;
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
