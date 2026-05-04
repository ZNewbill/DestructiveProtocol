//a Dungeon Crawler First Person Shooter by Willow (Zander) Newbill
//copyright 2026
float dt, prevTime = 0;
boolean leftPressed, pLeftPressed, rightPressed, pRightPressed;

float slowMoFactor = 1;

Camera camera;
Player player;
ArrayList<Circle> circles = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

AbilityDisplay ability1;

SceneInventory sceneInventory;

void setup() {
  size(1000, 800); 
  player = new Player(width/2, height/2);
  camera = new Camera(player);
  
  for(int i = 0; i < 10; i++) {
    Circle c = new Circle();
    circles.add(c);
  }
  
  ability1 = new AbilityDisplay(width/2, height-100, "eye.png", 3);
  
  sceneInventory = new SceneInventory();
  Inventory.resetInventory();
  
  Inventory.addItem("thunder", 2);
  sceneInventory.updateTiles();
  
  Inventory.removeItem("thunder", 2);
  sceneInventory.updateTiles();
  
}

void draw() {
  calcDeltaTime();
  background(255);
  
    
  // UPDATE BLOCK  
  camera.update();
  
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.update();
    if(b.isDead) bullets.remove(b);
  }
  
  
  
  player.update();
  
  ability1.update();
  sceneInventory.update();
  
  // DRAW BLOCK
  // THE MAGIC LINE.
  pushMatrix();
  translate(-camera.x, -camera.y);
  
  for(int i = 0; i < circles.size(); i++) {
     circles.get(i).draw(); 
  }
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.draw();
  }
  
  player.draw();
  
  popMatrix(); 
  
  // DRAW HUD AFTER THIS LINE.
  ability1.draw();
  
  sceneInventory.draw();
  
  // PREP FOR NEXT FRAME BLOCK
  Keyboard.update();
  pLeftPressed = leftPressed;
  pRightPressed = rightPressed;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}

void mousePressed() {
  if(mouseButton == LEFT) leftPressed = true;
  if(mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if(mouseButton == LEFT) leftPressed = false;
  if(mouseButton == RIGHT) rightPressed = false;
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}
