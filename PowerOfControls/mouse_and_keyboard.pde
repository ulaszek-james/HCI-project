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
    }
    if (!controlScreen.MouseIsOver()) {
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

void keyPressed() {
  if (!gameOver && !paused) {
    System.out.println(paused);
    if ((keyPressed == true) && (key == CODED)) {
      if (keyCode == RIGHT) {
        right = true;
      }
      if (keyCode == LEFT) {
        left = true;
      }
      if (keyCode == UP) {
        up = true;
        player.jump = true;
      }
    }
    if (key == 'x') {
      //print("ATTACK");
      player.atck = true;
    }
  }
}

void keyReleased() {
  if (!gameOver && !paused) {
    if (key == 'p') {
      System.out.println("paused");
      paused = true;
      return;
    }
    player.idling = true;
    delay(250);//need a delay
    player.atck = false;
    left = false;
    right = false;
    up = false;
  }
  if (paused) {
    if (key == 'p') {
      paused = false;
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
