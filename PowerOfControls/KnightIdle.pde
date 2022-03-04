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
  float pBeg;
  float pEnd;

  Knight() {
    posX = 50;
    posY = 600;
    idling = true;

    //true if right, false is left
    direction = true;
    
    jump = false;
    atck = false;

    connected = false;
    gravity = 0.4;
  }

  void land(){
    speedY = 0;
    connected = true;
    jump = false;
  }
  void update() {
    if (left) {
      player.direction = false;
      speedX = -1.25;
      player.idling = false;
    }
    if (right) {
      player.direction = true;
      speedX = 1.25;
      player.idling = false;
    }
    if(!left && !right){
      speedX = 0;
      speedY = 0;
    }
    if(left && right){
      speedX = 0;
    }
    if (jump) {
      if (speedY < 4) speedY += gravity;
      if (posY >= 600) {
        land();
      }
    }
    if (up && connected) {
      jump();
      speedY = -6;
    }
    if (posX > pEnd || posX < pBeg) {
      jump = true;
    }
    if (posX < 0) {
      posX = 750;
      speedX = 0;
    }
    if(posX > 750) {
      posX = 0;
      speedX = 0;
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
    jump = true;
    connected = false;
  }
}
