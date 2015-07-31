ParticleSystem ps;

void setup() {
  size(640,360);
  ps = new ParticleSystem (new PVector(width/2, height/2));
}

void draw() {
  background (100);
  
  PVector gravity = new PVector(0, 0.5);
  ps.applyForce(gravity);
  
  ps.addParticle();
  ps.run();
}

