// file for managing controller options
class ControlScreen {
  float x; // top corner x
  float y; // top corner y
  float w; // width
  float h; // height
  
  String currentTab;
  
  Button controllerTab;
  Button soundTab;
  Button displayTab;
  Button gameplayTab;

  ControlScreen() {
    x = width/9-5;
    y = height/2-height/3;
    w = 550;
    h = 550;
    
    currentTab = "controller";
    
    controllerTab = new Button("Controller", 16, x+22, y+25, w/5, h/10);
    soundTab = new Button("Sound", 16, (x+22) + (w/5) + 20, y+25, w/5, h/10);
    displayTab = new Button("Display", 16, (x+22) + 2*(w/5) + 40, y+25, w/5, h/10);
    gameplayTab = new Button("Gameplay", 16, (x+22) + 3*(w/5) + 60, y+25, w/5, h/10);
    
  }

  void drawWindow() {
    push();
    fill(255, 255, 255);
    rect(x, y, w, h, 28);
    pop();
    drawButtons();
    drawCurrentTab();
  }
  
  void drawCurrentTab() {
    switch(currentTab) {
      case "controller":
        push();
        fill(0);
        textSize(16);
        text("Controller", x+(w/10)+22, (y+75) + (h/10));
        line( x+22, (y+85) + (h/10), w, (y+85) + (h/10));
        text("KeyBoard Movement:", x+(w/5)+22, (y+125) + (h/10));
        text("Forwards:          RIGHT ARROW", x+(w/3)+22, (y+165) + (h/10));
        text("Backwards:         LEFT ARROW", x+(w/3)+22, (y+205) + (h/10));
        text("Jump:              UP ARROW", x+(w/3)+22, (y+245) + (h/10));
        text("Attack:            'X' Key", x+(w/3)+22, (y+285) + (h/10));
        text("Inventory:         Press 'I'", x+(w/3)+22, (y+325) + (h/10));
        text("TO PAUSE & UNPAUSE PRESS P", x+(w/2)+22, (y+375) + (h/10));
        text("Click anywhere outside of box to return.", x+(w/2)+22, (y+400) + (h/10));
        pop();
        break;
        
      case "sound":
        push();
        fill(0);
        textSize(16);
        text("Sound", x+(w/10)+22, (y+75) + (h/10));
        line( x+22, (y+85) + (h/10), w, (y+85) + (h/10));
        pop();
        break;
        
      case "display":
        push();
        fill(0);
        textSize(16);
        text("Display", x+(w/10)+22, (y+75) + (h/10));
        line( x+22, (y+85) + (h/10), w, (y+85) + (h/10));
        pop();
        break;
        
      case "gameplay":
        push();
        fill(0);
        textSize(16);
        text("Gameplay", x+(w/10)+22, (y+75) + (h/10));
        line( x+22, (y+85) + (h/10), w, (y+85) + (h/10));
        pop();
        break;
    }
  }
  
  void drawButtons() {
    if(controllerTab.MouseIsOver()) {
      controllerTab.drawActiveButton();
    } else {
      controllerTab.drawButton();
    }
    if(soundTab.MouseIsOver()) {
      soundTab.drawActiveButton();
    } else {
      soundTab.drawButton();
    }
    if(displayTab.MouseIsOver()) {
      displayTab.drawActiveButton();
    } else {
      displayTab.drawButton();
    }
    if(gameplayTab.MouseIsOver()) {
      gameplayTab.drawActiveButton();
    } else {
      gameplayTab.drawButton();
    }
  }
  
  void setCurrentTab(String tab) {
    currentTab = tab;
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
