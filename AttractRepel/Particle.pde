// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// class Spore extends the class "VerletParticle2D"
class Particle extends Node {

  float r;

  Particle (Vec2D loc) {
    super(loc);
    r = 8;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -0.01));
  }

  void display () {
    fill (col,150);
    stroke (col);
    strokeWeight(2);
    ellipse (x, y, r*2, r*2);
  }
}

