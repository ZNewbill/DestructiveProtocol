class InventoryTile {
  
  float x, y, w = Inventory.TILE_WIDTH, h = Inventory.TILE_HEIGHT;
  boolean isHovering = false;
  PImage itemImage;
  int itemAmount = 0;
  
  InventoryTile(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    isHovering = checkHover();
    //if(itemAmount <= 0) {
    //  clearTile();
    //}
  }
  
  void draw() {
    
    if(isHovering) {
      tint(#28F560);
    }
    if(itemImage != null) {
      image(itemImage, x, y);
    }
    noTint();
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(x, y, w, h);
    if(itemAmount > 0) {
      fill(255);
      textSize(16);
      textAlign(CENTER, CENTER);
      text(itemAmount, x + w - 5, y + h - 10);
    }
  }
  
  boolean checkHover() {
    return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
  }
  
  void setItem(String fileName, int amount) {
    itemImage = loadImage(fileName + ".png");
    itemImage.resize((int)w, (int)h);
    itemAmount = amount;
  }
  
  void clearTile() {
    itemAmount = 0;
    itemImage = null;
  }
}
