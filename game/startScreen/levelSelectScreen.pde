void levelSelectScreen() {
  push();
  background(255);
  if(backButton.MouseIsOver()) {
    backButton.drawActiveButton();
  } else {
    backButton.drawButton();
  }
  if(level1Button.MouseIsOver()) {
    level1Button.drawActiveButton();
  } else {
    level1Button.drawButton();
  }
  pop();
}
