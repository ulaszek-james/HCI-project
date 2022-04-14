// File that handles controller input

import org.gamecontrolplus.gui.*;

import org.gamecontrolplus.*;
import net.java.games.input.*;
ControlIO control;
ControlDevice stick;
ControlHat hat;
boolean hat_left, hat_right, hat_up, hat_down;

void getUserInput() {
  hat_left = hat.left();
  hat_right = hat.right();
  hat_up = hat.up();
  hat_down = hat.down();
  
  if(!gameOver && !paused) {
    if(hat_left) {
      left = true;
      newletter = true;
    } else {
      left = false;
    }
    if(hat_right) {
      right = true;
      newletter = true;
    } else {
      right = false;
    }
    //if(!hat_right && !hat_left) {
    //  newletter = false;
    //  player.idling = true;
    //}
  }
}

void releaseDPad(float x, float y) {
  left = false;
  right = false;
  newletter = false;
  player.idling = true;
}

void pressA() {
  if (gameOver && !controls) { // at start screen
    gameOver = false;
    variant = false;
  } 
  else if (!gameOver && !paused) { // in-game
    up = true;
    newletter = true;
  }
}

void releaseA() {
  if(!gameOver) {
    player.idling = true;
    up = false;
    newletter = false;
  }
}

void pressB() {
  if (gameOver && !controls) {
    gameOver = false;
    variant = true;
  } else if (!gameOver && !paused) {
    newletter = true;
    if (swordEquipped && !player.atck) {
      player.atck = true;
    } 
    else if (!swordEquipped && !player.lngatck) {
      player.lngatck = true;
    }
  } else if(!gameOver && paused) {
    gameOver = true;
    paused = false;
  }
}

void releaseB() {
  if(!gameOver) {
    newletter = false;
    if (swordEquipped && player.atck) {
      player.atck = false;
    }
    else if(!swordEquipped && player.lngatck) {
      player.lngatck = false;
    }
  }
}

void leftToggle() {
  if (!gameOver) {
    swordEquipped = !swordEquipped;
  }
}

void rightToggle() {
  if (!gameOver) {
    swordEquipped = !swordEquipped;
  }
}

void controlToggle() {
  if(paused || gameOver) {
    controls = !controls;
  }
}

void handleStart() {
  if (!gameOver) {
    paused = !paused;
  }
}
