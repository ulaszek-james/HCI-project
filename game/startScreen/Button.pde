class Button {
  String label;
  int fontSize;
  float x;    // top left corner x
  float y;    // top left corner y
  float w;    // width of button
  float h;    // height of button
  
  //default constructor
  Button(){
    label = "";
    x = 0;
    y = 0;
    w = 0;
    h = 0;
  }
  
  //constructor
  Button(String labelB, int fontsz, float xpos, float ypos, float _width, float _height) {
    label = labelB;
    fontSize = fontsz;
    x = xpos;
    y = ypos;
    w = _width;
    h = _height;
  }
  
  //draws the regular button
  void drawButton() {
    push();
    fill(color(142, 201, 237));
    strokeWeight(5);
    stroke(0);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    textSize(fontSize);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
    pop();
  }
  
  //draws the button if the mouse is over it
  void drawActiveButton() {
    float x1 = x - 10;
    float y1 = y - 5;
    float w1 = w + 20;
    float h1 = h + 10;
    push();
    fill(color(142, 201, 237));
    strokeWeight(5);
    stroke(0);
    rect(x1, y1, w1, h1, 10);
    textAlign(CENTER, CENTER);
    textSize(fontSize+6);
    fill(0);
    text(label, x1 + (w1 / 2), y1 + (h1 / 2));
    pop();
  }
  
  //changes the buttons color when selected
    void drawClickedButton() {
    float x1 = x - 10;
    float y1 = y - 5;
    float w1 = w + 20;
    float h1 = h + 10;
    fill(color(31, 242,31));
    strokeWeight(5);
    stroke(0);
    rect(x1, y1, w1, h1, 10);
    textAlign(CENTER, CENTER);
    textSize(34);
    fill(0);
    text(label, x1 + (w1 / 2), y1 + (h1 / 2));
  }

  
  //used to determine if button is being selected
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    else{
      return false;
    }
  }
}
