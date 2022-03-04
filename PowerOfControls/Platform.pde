class Platform{
  float x, y, w, h;
  
  Platform(float startX, float startY){
    x = startX;
    y = startY;
    w = 200;
    h = 20;
  }
  
  void grndFloor(float startX, float startY){
    x = startX;
    y = startY;
    w = width;
    h = 50;
  }
  
  void target(float startX, float startY){
    x = startX;
    y = startY;
    w = 50;
    h = 50;
  }
  
  void display(color col){
    noStroke();
    fill(col);
    rect(x, y, w, h);
  }
  
}
