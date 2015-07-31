import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem (PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  
  void moveOrigin(PVector force) {
    PVector f = force.get();
    origin.add(f);
  }
  
  void run() {
    moveOrigin (new PVector(random(-5,5),random(-5,5)));
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
  
}
