class Circle {
  float x, y;
  float diameter;
  
  Circle() {
    x = random(width);
    y = random(height);
    diameter = random(50, 150);
  }
  
  void draw() {
    fill(#E06C1D);
    ellipse(x, y, diameter, diameter);
  }
  
}
