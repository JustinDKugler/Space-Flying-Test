Bursts burst = new Bursts();

void setup() {
  size(800, 800);
  background(0);
  frameRate(60);
}

void draw() {
  background(0);
  burst.drawBurst();
}

void keyPressed() {
  burst.resetLine(0);
}
