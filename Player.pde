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
    
    //PUT THE STATE MACHINE YA FUCKASS
     Zander Newbill Weapon State machine
//create a state machine that allows the player to change which weapon they're using

//CREATE weaponType variable
//CREATE PISTOL_STATE SET variable to 1
//CREATE SHOTGUN_STATE SET variable to 2
//CREATE ASSRIFLE_STATE SET variable to 3
//CREATE ROCKETLAUNCHER_STATE SET variable to 4
//CREATE assRifleFireType variable set to 1
//CREATE maxAmmo variable //this changes based on weapon type
//CREATE currAmmo variable //this decreases as bullets are fired
//CREATE maxMags variable
//CREATE currMags variable
//CREATE damage variable //changes based on weapon type


//ON game start {
//  currAmmo = maxAmmo
//  currMags = maxMags
//}

//SET weaponType to 1
//if(weaponType == 1) {
//SET maxAmmo to 36
//SET maxMags to 3
//SET damage to 15
//  If(mouseLeftPressed.onDown){
//    bullet b = new bullet()
//    bullets.add(b)
//    currAmmo--
//  }
//}

//if(weaponType == 2) {
//  SET maxAmmo to 24
//  SET maxMags to 3
//  SET damage to 24
//  If(mouseLeftPressed.onDown){
//    bullet b = new bullet()
//    bullets.add(b)
//    currAmmo--
//  }
//}

//if(weaponType == 3) {
//  SET maxAmmo to 64
//  SET maxMags to 3
//  SET damage to 35
//  if(assRifleFireType == 1) {
//    if(mouseLeftPressed.onDown) {
//      bullet b = new bullet
//      bullets.add(b)
//      currAmmo--
//    }
//  }
//if(assRifleFireType == 2) {
//    if(mouseLeftPressed.isDown) {
//      bullet b = new bullet
//      bullets.add(b)
//      currAmmo --
//    }
//  }
//}

//if(weaponType == 4) {
//  SET maxAmmo to 8
//  SET maxMags to 8
//  SET damage to 85
//}
    
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
