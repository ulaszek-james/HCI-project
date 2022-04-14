public class Knight {
  float posX, posY;
  float w = 10;
  float h = 18;
  float speedX;
  float speedY;
  boolean idling;
  boolean direction;
  boolean atck;
  boolean lngatck;
  boolean connected;
  float gravity;
  float pBeg;
  float pEnd;
  int numJumps;

  Knight() {
    posX = 50;
    posY = 600;
    idling = true;

    //true if right, false is left
    direction = true;
    atck = false;
    connected = true;
    gravity = 0.8;

    numJumps = 0;
  }

  void land(float destinationY) {
    connected = true;
    speedY = 0;
    numJumps = 0;
    posY = destinationY - 38;
  }

  void update() {
    if (left && newletter) {
      player.direction = false;
      speedX = -2;
      player.idling = false;
    }
    if (right && newletter) {
      player.direction = true;
      speedX = 2;
      player.idling = false;
    }
    if (!left && !right && !newletter) {
      speedX = 0;
    }
    if (left && right && newletter) {
      speedX = 0;
    }
    if (up) {
      if (connected && newletter) {
        speedY = -10;
        connected = false;
      }
    }

    if (connected == false) {
      speedY += gravity; //apply gravity when not on platform
    } else {
      speedY = 0;
    }
    if (posX < 0) {
      posX = 750;
      speedX = 0;
    }
    if (posX > 750) {
      posX = 0;
      speedX = 0;
    }

    posX += speedX;
    posY += speedY;
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
  
  void drawSpell(){
  if (direction == true) {
      image(KS[(frameCount / 5) % 4], posX, posY);
    } else {
      pushMatrix();
      scale(-1.0, 1.0);
      image(KS[(frameCount / 5) % 4], -posX, posY);
      popMatrix();
    }
  }
}
