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
}

void handleA() {
  if(gameOver) { // at start screen
    gameOver = false;
    variant = false;
  }
  else if(!gameOver) { // in-game
    
  }
}

void handleB() {
  if(gameOver) {
    gameOver = false;
    variant = true;
  }
  else if(!gameOver) {
    newletter = true;
      if (swordEquipped)
        player.atck = true;
      else if(!swordEquipped)
        player.lngatck = true;
  }
}

void leftToggle() {
  if(!gameOver) {
    swordEquipped = !swordEquipped;
  }
  
}

void rightToggle() {
  if(!gameOver) {
    swordEquipped = !swordEquipped;
  }
}

void handleStart() {
  if(!gameOver) {
    paused = !paused;
  }
}
