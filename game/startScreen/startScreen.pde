void startGameScreen() { // start screen
  push();
  background(0);
  textSize(64);
  textAlign(CENTER);
  fill(255);
  text("The Power of Controls", 350, 350);
  showStartMenu();
  pop();
}

void showStartMenu() { // holds start menu options
  if(!controls && controlButton.MouseIsOver()) {
    controlButton.drawActiveButton();
  } else {
    controlButton.drawButton();
  }
  
  if(!controls && startButton.MouseIsOver()) {
    startButton.drawActiveButton();
  } else {
    startButton.drawButton();
  }

  if (controls) {
    controlScreen.drawWindow();
  }
}
