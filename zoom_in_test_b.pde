Bursts faintPeriperals = new Bursts("line", 10, 800, 50, 50, 20);
Bursts twinklelines = new Bursts("twinkleline", 10, 250, 0, 200, 0);
Bursts faintWhiteLines = new Bursts("line", 20, 100, 100, 100, 100);
Bursts yellowCircles = new Bursts("circle", 8, 100, 50, 50, 0);
Bursts whiteLines = new Bursts("line", 30, 50, 255, 255, 255);

void setup() {
  //size(800, 800, P2D);
  fullScreen(P2D);
  background(0);
  frameRate(60);
}

void draw() {
  background(0);
  translate(width/2, height/2); // Polar coords require origin at center for flying effect
  faintPeriperals.drawBurst();
  twinklelines.drawBurst();
  faintWhiteLines.drawBurst();
  yellowCircles.drawBurst();
  whiteLines.drawBurst();
}
