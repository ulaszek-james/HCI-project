// File that handles mouse and keyboard controller

void mousePressed() {
  if (mk && (gameOver || paused)) { // at main menu or paused menu
    if (!paused) { // at main menu
      if (!controls && startButton.MouseIsOver()) {
        startButton.drawClickedButton();
        gameOver = false; // start game
        //levelSelect = true; // go to level select screen
        return;
      }
    }
    if (controlButton.MouseIsOver()) { // open Control Window
      controls = true;
      println("TEST");
    }
    if (!controlScreen.MouseIsOver() && !controlButton.MouseIsOver()) {
      controls = false;
    } else {
      if (controls && controlScreen.controllerTab.MouseIsOver()) {
        controlScreen.controllerTab.drawClickedButton();
        controlScreen.setCurrentTab("controller");
      }
      if (controls && controlScreen.soundTab.MouseIsOver()) {
        controlScreen.soundTab.drawClickedButton();
        controlScreen.setCurrentTab("sound");
      }
      if (controls && controlScreen.displayTab.MouseIsOver()) {
        controlScreen.displayTab.drawClickedButton();
        controlScreen.setCurrentTab("display");
      }
      if (controls && controlScreen.gameplayTab.MouseIsOver()) {
        controlScreen.gameplayTab.drawClickedButton();
        controlScreen.setCurrentTab("gameplay");
      }
    }
  }

  if (mk && (levelSelect || paused)) { // at level select screen
    if (backButton.MouseIsOver()) { // return to main menu
      levelSelect = false;
      paused = false;
      gameOver = true;
    }
  }
}
