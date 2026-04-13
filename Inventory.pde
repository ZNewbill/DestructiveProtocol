static public class Inventory {
  
  static public IntDict inventory;
  static public final float TILE_WIDTH = 50;
  static public final float TILE_HEIGHT = 50;
  
  public static void resetInventory() {
    inventory = new IntDict();
    inventory.clear();
  }
  
  public static void addItem(String itemName, int value) {
    if(inventory.hasKey(itemName)) {
      inventory.add(itemName, value);
    } else {
      inventory.set(itemName, value);
    }
  }
  
  public static void removeItem(String itemName, int value) {
    if(!inventory.hasKey(itemName)) return;
    
    inventory.sub(itemName, value);
    if(inventory.get(itemName) <= 0) {
      inventory.remove(itemName);
    }
    
  }
  
}
