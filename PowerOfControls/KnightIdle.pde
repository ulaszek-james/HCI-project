public class Knight {
  float posX, posY;
  float w = 10;
  float h = 18;
  float speedX;
  float speedY;
  boolean idling;
  boolean direction;
  boolean jump;
  boolean atck;
  boolean connected;
  float gravity;

  Knight() {
    posX = 50;
    posY = 600;
    idling = true;

    //true if right, false is left
    direction = true;
    
    jump = false;
    atck = false;

    connected = false;
    gravity = 0.6;
  }

  void land(){
    speedY = 0;
    connected = true;
  }
  void update() {
    if (left) {
      player.direction = false;
      speedX = -1;
      player.idling = false;
    }
    if (right) {
      player.direction = true;
      speedX = 1;
      player.idling = false;
    }
    if(!left && !right){
      speedX = 0;
      speedY = 0;
    }
    if(left && right){
      speedX = 0;
    }
    if (up) {
      speedY = -1;
    }
    //if (connected == false){
    //  speedY += gravity;
    //}
    if(posY > 750){
      posY = 0;
      speedY = 0;
    }
    
    posX += speedX;
    posY += speedY;
    //posY = 570;
  }

  void drawIdle() {
    if (direction == true) {
      image(KI[(frameCount / 5) % 10], posX, posY);
    } else {
      pushMatrix();
      scale(-1.0, 1.0);
      image(KI[(frameCount / 5) % 10], -posX, posY);
      popMatrix();
    }
  }

  void drawMoveForward() {
    image(KF[(frameCount / 5) % 10], posX, posY);
  }

  void drawMoveBackwards() {
    pushMatrix();
    scale(-1.0, 1.0);
    image(KF[(frameCount / 5) % 10], -posX, posY);
    popMatrix();
  }

  void drawAttack() {
    if (direction == true) {
      image(KA[(frameCount / 5) % 4], posX, posY);
    } else {
      pushMatrix();
      scale(-1.0, 1.0);
      image(KA[(frameCount / 5) % 4], -posX, posY);
      popMatrix();
    }
  }

  void jump() {
  }
}
