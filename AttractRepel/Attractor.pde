// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Attractor extends Node {

  float r;

  Attractor (Vec2D loc) {
    super (loc);
    r = 24;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*2, -0.1));
    physics.addBehavior(new AttractionBehavior(this, width, 0.1));
  }

  void display () {
    fill(col);
    noStroke();
    ellipse (x, y, r*2, r*2);
  }
}

