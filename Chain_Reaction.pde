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
   fill(balls[i].r , balls[i].g, balls[i].b;
   ellipse(balls[i].x , balls[i].y , balls[i].rad, balls[i].rad);
    balls[i].move();
  }
}

void mouseClicked() {
  if ( !reactionStarted ) {
    balls[0].x = mouseX;
  }
}