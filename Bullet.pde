class Bullet extends AABB {
  
  float moveAngle;
  float bulletSpeed = 1600;
  
  Bullet(float xPos, float yPos, float angle) {
    x = xPos;
    y = yPos;
    moveAngle = angle;
    velocity.x = bulletSpeed * cos(moveAngle);
    velocity.y = bulletSpeed * sin(moveAngle);
    setSize(10, 10);
  }
  
  void update() {
    x += velocity.x * dt * slowMoFactor;
    y += velocity.y * dt * slowMoFactor;
    
    super.update();
    
    if(x > camera.x + width || x < camera.x || y > camera.y + height || y < camera.y) isDead = true;
  }
  
  void draw() {
    fill(255, 0, 0);
    ellipse(x, y, w, h);
  }
  
}
