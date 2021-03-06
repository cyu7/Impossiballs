class Ball {
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    rad = 10;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
    state = 0;
  }

  void move() {
    if (state == 0)
    {
      x = x + dx;
      y = y + dy;
      bounce();
    } else if (state == 1)
    {
      if (rad > 100)
        state++;
      else
        rad++;
    } else if ( rad > 0 )
      rad--;
  }

  void bounce() {
    if ( x <= 0 || x >= ((width - rad) + rad/2)) {
      dx = -dx;
    }
    if ( y <= 0 || y >= ((height - rad) + rad/2)) {
      dy = -dy;
    }
  }
}