class Bursts {
  float lines[][]; // Stores line lengths, distances from center, thetas, and velocities
  int lineCount;

  // Note: lines are essentially graphed using polar coordinates
  // 0 - Distance center to back of line
  // 1 - Distance center to front of line
  // 2 - Theta of line
  // 3 - Velocity of line in pixels/frame

  Bursts() {
    lineCount = 2;//int(random(10, 100));
    lines = new float[4][lineCount];
    for (int lineNumber = 0; lineNumber < lineCount; lineNumber++) {
      resetLine(lineNumber);
    }
  }

  void drawBurst() {
    translate(width/2, height/2);
    stroke(255);
    for (int lineNumber = 0; lineNumber < lineCount; lineNumber++) {
      if (abs(lines[0][lineNumber] * cos(lines[2][lineNumber])) > width/2 || abs(lines[0][lineNumber] * sin(lines[2][lineNumber])) > height/2) {
        resetLine(lineNumber); // Spawns a new line to replace the offscreen one
      }
      rotate(lines[2][lineNumber]);
      line(lines[0][lineNumber], 0, lines[1][lineNumber], 0);
      lines[0][lineNumber] += lines[3][lineNumber];
      lines[1][lineNumber] += 2*lines[3][lineNumber];
    }
  }

  void resetLine(int lineNumber) {
    lines[0][lineNumber] = random(1, 5);
    lines[1][lineNumber] = random(1, 30);
    lines[2][lineNumber] = radians(random(0, 360));
    lines[3][lineNumber] = random(0.5, 2);
    println("Reset line " + lineNumber);
  }
}
