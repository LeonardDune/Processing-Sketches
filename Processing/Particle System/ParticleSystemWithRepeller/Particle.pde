class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float mass = 1;
  
  color c;
  
  Particle (PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    mass = random (1,50);
    c = color(random(0,255),random(0,255),random(0,255));
    lifespan = 255.0;
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
  
  void display () {
    stroke(c, lifespan);
    fill (c,lifespan);
    ellipse(location.x, location.y,mass,mass);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
  
}
