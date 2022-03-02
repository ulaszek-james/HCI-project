// file for managing controller options
class ControlScreen {
  float x; // top corner x
  float y; // top corner y
  float w; // width
  float h; // height

  ControlScreen() {
    x = width/6;
    y = height/2-height/3;
    w = 450;
    h = 450;
  }

  void drawWindow() {
    push();
    fill(255, 255, 255);
    rect(width/6, height/2-height/3, 450, 450, 28);
    fill(0);
    textSize(28);
    text("CONTROLS SCREEN", width/2, height/2);
    pop();
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    else{
      return false;
    }
  }
}
