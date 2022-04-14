// File that handles mouse and keyboard controller

void mousePressed() {
  if (mk && (gameOver || paused)) { // at main menu or paused menu
    if (!paused) { // at main menu
      if (!controls && startA_button.MouseIsOver()) {
        startA_button.drawClickedButton();
        variant = false;
        inventoryOpen = false;
        gameOver = false; // start game
        //levelSelect = true; // go to level select screen
        return;
      }
      if (!controls && startB_button.MouseIsOver()) {
        startB_button.drawClickedButton();
        variant = true;
        inventoryOpen = false;
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

  if (inventoryOpen) {
    if (swordButton.MouseIsOver()) {
      swordButton.drawClickedButton();
      println("equipping sword");
      swordEquipped = true;
      inventoryOpen = false;
    }
    if (spellButton.MouseIsOver()) {
      spellButton.drawClickedButton();
      println("equipping spell");
      swordEquipped = false;
      inventoryOpen = false;
    }
  }

  if (mk && (levelSelect || paused)) { // at level select screen
    if (backButton.MouseIsOver()) { // return to main menu
      levelSelect = false;
      paused = false;
      inventoryOpen = false;
      gameOver = true;
    }
  }
}
