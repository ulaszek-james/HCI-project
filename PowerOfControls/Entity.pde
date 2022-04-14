public class Entity {
  float e_posX, e_posY;
  float e_w = 10; // entity width
  float e_h = 25; // entity height
  float e_speedX, e_speedY;
  boolean e_direction;
  boolean e_jump;
  boolean e_atk;
  boolean e_connected;
  float e_gravity;
  float e_pBeg;
  float e_pEnd;
  int e_health;
  int MAX_HEALTH;
  float step = 0.5; 
  float start;
  boolean dead;
  
  Entity(float e_x, float e_y) {
    e_posX = e_x;
    e_posY = e_y;
    start = e_x;
    
    e_direction = true;
    e_jump = false;
    e_atk = false;
    e_connected = false;
    e_gravity = 0.9;
    
    e_health = 100;
    MAX_HEALTH = e_health;
    dead = false;
  }
  
  void drawEnt(){
    fill(0,0,0);
    //rect(e_posX, e_posY, e_w, e_h);
    pushMatrix();
    image(ES[(frameCount / 5) % 4], e_posX, e_posY);
    popMatrix();
    
    drawHealthBar();
    
    // entity is within sword animation distance & player is facing entity 
    float distX = player.posX - e_posX;
    float distY = player.posY - e_posY;

    if((distX > -60 && distX < 0 && distY >-40 && distY < 40 && player.direction == true && player.atck == true) || 
        (distX < 60 && distX > 0 && distY >-40 && distY < 40 && player.direction == false && player.atck == true)) 
      {
        e_health = e_health - 1;
        if(e_health < 0) { e_health = 0;}
      }
      if((distX > -60 && distX < 0 && distY >-40 && distY < 40 && player.direction == true && player.lngatck == true) || 
        (distX < 60 && distX > 0 && distY >-40 && distY < 40 && player.direction == false && player.lngatck == true)) 
      {
        e_health = e_health - 3;
        if(e_health < 0) { e_health = 0;}
      }
  }
  
  //
  void drawHealthBar(){
    // red healthbar at 25% or less health
    if (e_health <= MAX_HEALTH*0.25) { fill(255, 0, 0); }
    // yellow healthbar at 50% or less health
    else if (e_health <= MAX_HEALTH*0.50) { fill(255, 200, 0); }
    // green healthbar otherwise
    else { fill(0, 255, 0); }
    noStroke();
    
    // draw healthbar centered on entity, 15px above it
    rect(e_posX-(e_health-10)/2, e_posY-15, e_health, 5);
    stroke(0);
  }
  
  // function bounces the entity between a +-50 range
  // float arg is a multiplier for how fast the entity should move
  // stops movement after death
  void moveEnt(float multiplier){
    e_posX += step*multiplier;
    if(e_posX > start+50) { e_posX = start+50; step = -0.5; }
    if(e_posX < start-50) { e_posX = start-50; step = 0.5; }
    if(e_health == 0) {step = 0;}
  }
  
}
