class Camera {
 
  float x, y, z;
  Player target;
  float tx, ty; // Target's x and y coordinates.
  
  Camera(Player p) {
    target = p;
    tx = target.x - width/2;
    ty = target.y - height/2;
    x = tx;
    y = ty;
  }
  
  void update() {
    tx = target.x - width/2;
    ty = target.y - height/2;
    
    
    // For Camera Easing Effect
    float dx = tx - x;
    float dy = ty - y;   
    x += dx * 0.1;
    y += dy * 0.1;
    
  }
  
}
