void startGameScreen() {
  textSize(64);
  textAlign(CENTER);
  text("The Best Platformer", 350, 350);
  
  showStartMenu();
}

void showStartMenu() {
  push(); // saves current drawing style
  textSize(18);
  textAlign(CENTER);
  text("C: CONTROLS", 80, 40);
  
  text("Press SPACEBAR to Start!", 350, 425);
  
  pop();
}

void toggleOptions() {
  
}
