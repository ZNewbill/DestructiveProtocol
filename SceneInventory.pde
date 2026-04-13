class SceneInventory {
  
  int rows = 5;
  int cols = 5;
  ArrayList<InventoryTile> tiles = new ArrayList();
  
  float xOffset = 100, yOffset = 100;
  
  SceneInventory() {
    displayInventory();
  }
  
  void update() {
    for(int i = 0; i < tiles.size(); i++) {
      InventoryTile t = tiles.get(i);
      t.update();
    }
  }
  
  void draw() {
    
    for(int i = 0; i < tiles.size(); i++) {
      InventoryTile t = tiles.get(i);
      t.draw();
    }
    
  }
  
  void displayInventory() {  
    for(int i = 0; i < cols; i++) {
      for(int j = 0; j < rows; j++) {
        InventoryTile t = new InventoryTile(xOffset + Inventory.TILE_WIDTH * j, yOffset + Inventory.TILE_HEIGHT * i);
        tiles.add(t);
      }
    }   
  }
  
  void updateTiles() {
    
    if(Inventory.inventory.keyArray().length == 0) {
      Inventory.resetInventory();
      resetTiles();
    }
    
    for(int i = 0; i < Inventory.inventory.keyArray().length; i++) {      
      String itemName = Inventory.inventory.keyArray()[i];
      int itemAmount = Inventory.inventory.get(itemName);
      if(itemAmount <= 0) {
        tiles.get(i).clearTile();
        continue;
      }
      tiles.get(i).setItem(itemName, itemAmount);
    }    
  }
  
  void resetTiles() {
    for(int i = 0; i < tiles.size(); i++) {
      tiles.get(i).clearTile();
    }
  }
  
}
