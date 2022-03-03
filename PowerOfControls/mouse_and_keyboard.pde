// File that handles mouse and keyboard controller

void mousePressed() {
  if (mk && gameOver) { // at main menu
    if (!controls) { // control menu not open
      if (startButton.MouseIsOver()) {
        startButton.drawClickedButton();
        gameOver = false; // start game
        levelSelect = true; // go to level select screen
      }
      if (controlButton.MouseIsOver()) { // open Control Window
        controls = true;
      } else {
        controls = false;
      }
    } else { // control menu open
      if(!controlScreen.MouseIsOver()) {
        controls = false;
      } else {
        if(controlScreen.controllerTab.MouseIsOver()) {
          controlScreen.controllerTab.drawClickedButton();
          controlScreen.setCurrentTab("controller");
        }
        if(controlScreen.soundTab.MouseIsOver()) {
          controlScreen.soundTab.drawClickedButton();
          controlScreen.setCurrentTab("sound");
        }
        if(controlScreen.displayTab.MouseIsOver()) {
          controlScreen.displayTab.drawClickedButton();
          controlScreen.setCurrentTab("display");
        }
        if(controlScreen.gameplayTab.MouseIsOver()) {
          controlScreen.gameplayTab.drawClickedButton();
          controlScreen.setCurrentTab("gameplay");
        }
      }
    }
  }
  
  if(mk && levelSelect) { // at level select screen
    if(backButton.MouseIsOver()) { // return to main menu
      levelSelect = false;
      gameOver = true;
    }
  }
}

//void keyPressed() {
 
//  //if(!gameOver && !paused && !levelSelect) { // in game
//     if((keyPressed == true) && (key == CODED)){
//       if(key == 'p') {
//         paused = true;
//       }
//       if(key == RIGHT){
//         player.posX += 1;
//       }
//    }
  //}
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
  //}
