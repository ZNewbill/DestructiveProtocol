class AbilityDisplay {

  float x, y, z, w = 100, h = 100, d = 100;
  PImage img, mask;

  float cooldownStamp;
  float currentCooldown;
  boolean isCooldown = false;

  float startAngle = radians(-90);
  float endAngle;

  AbilityDisplay(float xPos, float yPos, String filePath, float coolDown) {

    x = xPos;
    y = yPos;
    cooldownStamp = coolDown;
    currentCooldown = coolDown;

    img = loadImage(filePath);
    img.resize((int)w, (int)h);
    mask = loadImage("mask.png");
    mask.resize((int)w, (int)h);
    img.mask(mask);
  }

  void update() {

    if (isCooldown) {
      currentCooldown -= dt;
      if (currentCooldown <= 0) {
        isCooldown = false;
        currentCooldown = cooldownStamp;
      }
    }

    endAngle = map(currentCooldown, 0, cooldownStamp, radians(-90), radians(270));
  }

  void draw() {

    image(img, x-w/2, y-h/2);

    if (isCooldown) {
      fill(0, 128);
      noStroke();
      arc(x, y, w, h, startAngle, endAngle);
      fill(255);
      textSize(44);
      textAlign(CENTER, CENTER);
      text(ceil(currentCooldown), x, y);
    }
    
  }
}
