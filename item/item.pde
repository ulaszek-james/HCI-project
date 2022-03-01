class Item {
  String type;
  public Item(passedType) {
      type = passedType; 
    }
    
    void use(String type) {
      if(type == "Sword") useSword();
      else if(type == "Potion") usePotion();
      else if(type == "Bow") useBow();
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
    
    void useBow() {
      for (int i = 0; i < lvl1occ; i++) {
        lvl1entities.checkEntityCollision("Arrow");
      }
    }
}
