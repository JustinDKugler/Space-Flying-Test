class Bursts {
  float shape[][]; // Stores info: size, distance from center, theta, and velocity
  int shapeCount;
  int r, g, b;
  String type; // Shape burst displays
  float maxSpawnRadius;

  // Note: shape are essentially graphed using polar coordinates
  // 0 - Distance center to back of shape
  // 1 - Distance center to front of shape
  // 2 - Theta of shape
  // 3 - Velocity of shape in pixels/frame

  Bursts(String tempType, int amount, float tempMaxSpawnRadius, int tempR, int tempG, int tempB) {
    type = tempType;
    r = tempR;
    g = tempG;
    b = tempB;
    maxSpawnRadius = tempMaxSpawnRadius;

    shapeCount = amount;
    shape = new float[4][shapeCount];
    for (int shapeNumber = 0; shapeNumber < shapeCount; shapeNumber++) {
      resetShape(shapeNumber);
      // Make radius more varried at the start for smoother flying
      shape[1][shapeNumber] = random(0, 900); // R start from center, polar coord
      shape[3][shapeNumber] = 0.25 * pow(1.1, shape[1][shapeNumber]/4); // Starting velocity based on exponential speed function
    }
  }

  void drawBurst() {
    stroke(r, g, b);
    fill(r, g, b);

    for (int shapeNumber = 0; shapeNumber < shapeCount; shapeNumber++) {
      if (abs(shape[0][shapeNumber] * cos(shape[2][shapeNumber])) > width/2 || abs(shape[0][shapeNumber] * sin(shape[2][shapeNumber])) > height/2) {
        // the if statement above uses trig to convert polar coords to cartesian, then sees if they are offscreen
        resetShape(shapeNumber); // Spawns a new line to replace offscreen ones
      }
      pushMatrix(); // Without this, previous thetas affect future ones
      rotate(shape[2][shapeNumber]);
      switch (type) {
      case "line":
        line(shape[1][shapeNumber], 0, shape[1][shapeNumber] + shape[0][shapeNumber], 0);
        break;
      case "circle":
        ellipse(shape[1][shapeNumber], 0, 0.25*shape[0][shapeNumber], 0.05*shape[0][shapeNumber]);
        break;
      case "twinkleline":
        stroke(random(r, g));
        line(shape[1][shapeNumber], 0, shape[1][shapeNumber] + shape[0][shapeNumber], 0);
        break;
      default:
        println("ERROR: Unkown shape type");
        break;
      }
      popMatrix();
      shape[0][shapeNumber] += 0.5*shape[3][shapeNumber]; // Get bigger over time
      shape[1][shapeNumber] += shape[3][shapeNumber]; // Increase radius coord to mimic close perspective
      shape[3][shapeNumber] *= 1.1;
    }
  }

  void resetShape(int shapeNumber) {
    shape[0][shapeNumber] = random(1, 3); // Size
    shape[1][shapeNumber] = random(4, maxSpawnRadius); // R start from center, polar coord
    shape[2][shapeNumber] = radians(random(0, 360)); // Theta, polar coord
    shape[3][shapeNumber] = random(0.2, 0.3); // Velocity
    println("Reset line " + shapeNumber);
  }
}
