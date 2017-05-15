class Ball {
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  Ball() {
    intrandom(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 10;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
  }

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
  
  void bounce() {
    if ( x == 0 || x == ((width - rad) + rad/2)){
      dx = -dx;
    }
    if ( y == 0 || y == ((height - rad) + rad/2)){
      dy = -dy;
    }
  }
}