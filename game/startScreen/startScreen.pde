void startGameScreen() {
  background(0);
  textSize(64);
  textAlign(CENTER);
  text("The Power of Controls", 350, 350);

  showStartMenu();
}

void showStartMenu() {
  push(); // saves current drawing style
  textSize(18);
  textAlign(CENTER);
  text("C: CONTROLS", 80, 40);
  text("Press SPACEBAR to Start!", 350, 425);

  if (controls) {
    fill(255, 255, 255);
    rect(width/6,height/2-height/3, 450, 450, 28);
    fill(0);
    text("CONTROLS SCREEN", width/2, height/2);
  }

  pop();
}
