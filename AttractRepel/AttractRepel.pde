import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
ArrayList<Attractor> attractors;
ArrayList<Cluster> clusters;

int numAttractors = 5;

Rect bounds;

VerletPhysics2D physics;

void setup () {
  size (900, 600);
  bounds = new Rect(0,0,width,height);
  physics = new VerletPhysics2D ();
  physics.setDrag (0.01);
  physics.setWorldBounds(bounds);
  physics.addBehavior(new GravityBehavior(new Vec2D(-0.01, 0.01)));
  
  
  //Create a cluster of Particles for the number of Attractors
  
  clusters = new ArrayList<Cluster>();
  attractors = new ArrayList<Attractor>();
  particles = new ArrayList<Particle>();
  
  for (int i = 0; i < numAttractors; i++) {
    Cluster c = new Cluster(random(1,100));
    c.setColor(color((int) random(0,255),(int) random(0,255),(int) random(0,255)));
    clusters.add(c);
    Attractor a = new Attractor(new Vec2D(random(width),random(height)));
    attractors.add(a);
    // add attractor to the cluster
    c.add(a);
    // add particles
    for (int j = 0; j < (int) random(3,25); j++) {
      Particle p = new Particle(new Vec2D(random(width),random(height))); 
      particles.add(p);
      // add particle to the cluster
      c.add(p);
    }    
  }
}


void draw () {
  background (255);  
  physics.update ();
  
  for (Cluster c: clusters) {
    c.display();
  }
  
  if (mousePressed) {
    //attractor.lock();
    //attractor.set(mouseX,mouseY);
  } else {
    //attractor.unlock();
  }
}

