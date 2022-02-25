class Item {
  String type;
  public Item(passedType) {
      type = passedType; 
    }
    
    void use(String type) {
      if(type == "Sword") useSword();
      else if(type == "Potion") usePotion();
      else if(type == "Gun") useGun();
    }
    
    void useSword(){
      for (int i = 0; i < lvl1occ; i++) {
        lvl1entities[i].checkEntityCollision("Sword");
      }
    }
    
    void usePotion() {
      if (hearts < 3 && hearts > 0) {
        hearts += 1;
      }
    }
    
    void useGun() {
      for (int i = 0; i < lvl1occ; i++) {
        lvl1entities.checkEntityCollision("Bullet");
      }
    }
}
