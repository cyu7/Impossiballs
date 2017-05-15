Ball[] balls;

//global boolean to tell whether reaction has been triggered
boolean reactionStarted;

void setup() {
  size(600, 600);
  reactionStarted = false; // state var
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++ )
    balls[i] = new Ball();
}

void draw() {
  background(0);

  for (int i=0; i < balls.length; i++) {
    // fill(balls[i].r, balls[i].g, balls[i].b);
    fill(balls[i].c);
    ellipse(balls[i].x, balls[i].y, balls[i].rad, balls[i].rad);
    balls[i].move();

    /* does not work because it causes the program to crash:
    if ( reactionStarted ) {
      int ctr = 0; // so that you don't check the same two balls twice
      for (int j = 0; j < balls.length - ctr; j++) {
        // if one of the balls is reacting:
        if ( ( balls[i].state > 0 || balls[i + j].state > 0 )
          // Use distance formula to calculate if the balls are touching:
          && sqrt( pow( balls[i + j].x - balls[i].x, 2 )
          + pow( balls[i + j].y - balls[i].y, 2 ) )
          <= balls[i].rad + balls[i+j].rad )
        {
          // Make the balls react
          balls[i].state++;
          balls[i + j].state++;
        }
        ctr++;
      }
    }
    */
  }
}

void mouseClicked() {
  if ( !reactionStarted ) {
    balls[0].x = mouseX;
    balls[0].y = mouseY;
    balls[0].state++;
    reactionStarted = true;
  }
}