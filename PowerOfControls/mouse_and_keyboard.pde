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

void keyPressed() {
  if (!paused) {
    if ((keyPressed == true) && (key == CODED)) {
      if (keyCode == RIGHT) {
        right = true;
        newletter = true;
      } else if (keyCode == LEFT) {
        left = true;
        newletter = true;
      } else if (keyCode == UP) {
        up = true;
        newletter = true;
      }
    }
    if (key == 'x') {
      newletter = true;
      if (swordEquipped)
        player.atck = true;
      else if(!swordEquipped)
        player.lngatck = true;
    }
    if (key == 'p') {
      newletter = true;
      if (paused == false) {
        paused = true;
      }
    }
    if (key == 'i') {
      newletter = true;
      if (inventoryOpen == false) {
        inventoryOpen = true;
      } else {
        inventoryOpen = false;
      }
    }
  } else {
    if (key == 'p') {
      newletter = true;
      if (paused == true) {
        paused = false;
      }
    } else if (key == 'i') {
      newletter = true;
      if (inventoryOpen == true) {
        inventoryOpen = false;
      }
    }
  }
}

void keyReleased() {
  player.idling = true;
  //delay(250);//need a delay
  player.atck = false;
  player.lngatck = false;
  left = false;
  right = false;
  up = false;
  if (keyCode == LEFT || keyCode == RIGHT || keyCode == UP) {
    newletter = false;
  }
}
