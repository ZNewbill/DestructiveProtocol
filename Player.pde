class Player extends AABB {

  float angleToMouse;
  float dashSpeed = 2000;
  boolean isDashing = false;
  float dashCooldown = 1.5;
  boolean canMove = true;
  boolean canDash = true;
  
  float slowMoCooldown = 1;
  boolean isSlowMo = false;
  float xDirection = 0, yDirection = 0;
  float moveAngle;

  Player(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    setSize(100, 100);
    //velocity = new PVector(400, 400);
  }

  void update() {
    calcAngleToMouse();
    
    if(isSlowMo) {
      slowMoCooldown -= dt;
      if(slowMoCooldown <= 0) {
        isSlowMo = false;
        slowMoCooldown = 1;
        slowMoFactor = 1;
      }
    }

    if (isDashing) {
      dashCooldown -= dt;
      if (dashCooldown <= 0) {
        isDashing = false;
        canDash = true;
        dashCooldown = 1.5;
      }
      if (dashCooldown <= 1) {
        canMove = true;
      }
    }
    
    if(leftPressed && !pLeftPressed) {
      Bullet b = new Bullet(x, y, angleToMouse);
      bullets.add(b);
    }

    if(Keyboard.onDown(Keyboard.Q)) {
      if(!isSlowMo) {
        isSlowMo = true;
        slowMoFactor = 0.3;
        ability1.isCooldown = true;
      }
    }

    if (Keyboard.onDown(Keyboard.SHIFT)) {
      if (canDash) {
        isDashing = true;
        canMove = false;
        canDash = false;
        velocity.x += dashSpeed * cos(angleToMouse);
        velocity.y += dashSpeed * sin(angleToMouse);
      }
    }

    if (Keyboard.isDown(Keyboard.A)) {
      if (canMove) {
        velocity.x = -400;
        xDirection = -1;
      }
    }
    if (Keyboard.isDown(Keyboard.D)) {
      if (canMove) {
        velocity.x = 400;
        xDirection = 1;
      }
    }
    if (Keyboard.isDown(Keyboard.W)) {
      if (canMove) {
        velocity.y = -400;
        yDirection = -1;
      }
    }
    if (Keyboard.isDown(Keyboard.S)) {
      if (canMove) {
        velocity.y = 400;
        yDirection = 1;
      }
    }
    
    moveAngle = atan2(xDirection, yDirection);

    x += velocity.x * dt * slowMoFactor;
    y += velocity.y * dt * slowMoFactor;

    velocity.x *= 0.9;
    velocity.y *= 0.9;

    super.update();
  }

  void draw() {

    fill(#26DE30);
    pushMatrix();
    translate(x, y);
    rotate(moveAngle);
    rect(-halfW, -halfH, w, h);
    popMatrix();
  }

  void calcAngleToMouse() {
    float dx = mouseX - x + camera.x;
    float dy = mouseY - y + camera.y;
    angleToMouse = atan2(dy, dx);
  }
}
