// file for managing controller options

void createControlWindow() {
  controlWindow = createShape(RECT, 0, 0, 100, 100);
  controlWindow.setFill(color(255, 255, 255));
  controlWindow.setStroke(true);
  
  controlWindow.setVisible(false);
}
