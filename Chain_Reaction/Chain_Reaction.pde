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

    int ctr = 0; // so that you don't check the same two balls twice
    if ( reactionStarted ) {
      for (int j = 0; j < balls.length - ctr; j++) {
        int compareIndex = (i + j) % balls.length;
        // if one of the two balls is reacting:
        if ( ( balls[i].state > 0 || balls[compareIndex].state > 0 )

        /*
          // Use distance formula to calculate if the balls are touching:
         && sqrt( pow( balls[i + j].x - balls[i].x, 2 )
         + pow( balls[i + j].y - balls[i].y, 2 ) )
         <= balls[i].rad + balls[i+j].rad )
         */

          && dist( balls[i].x, balls[i].y, balls[compareIndex].x, balls[compareIndex].y )
          <= balls[i].rad + balls[compareIndex].rad ) // and the balls are touching
        {
          // Make the balls react
          balls[i].state++;
          balls[compareIndex].state++;
        }
      }
    }
    ctr++;
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