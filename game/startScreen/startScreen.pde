void startGameScreen() { // start screen
  background(0);
  textSize(64);
  textAlign(CENTER);
  text("The Power of Controls", 350, 350);
  
  showStartMenu();
}

void showStartMenu() { // holds start menu options
  if(controlButton.MouseIsOver()) {
    
    controlButton.drawActiveButton();
  } else {
    controlButton.drawButton();
  }
  
  if(startButton.MouseIsOver()) {
    startButton.drawActiveButton();
  } else {
    startButton.drawButton();
  }

  if (controls) {
    drawControlWindow();
  }
}
