import toxi.physics2d.constraints.*;
//import toxi.physics.*;
//import toxi.physics.constraints.*;
import toxi.physics2d.behaviors.*;
//import toxi.physics.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;
Particle p1;
Particle p2;

void setup() {
  size(640,360);

  // Creating a physics world
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0,0.5)));
  physics.setWorldBounds(new Rect(0,0,width,height));

  // Creating two Particles
  p1 = new Particle(new Vec2D(100,20));
  p2 = new Particle(new Vec2D(100,180));
  // Locking Particle 1 in place
  p1.lock();

  //[offset-down] Creating one Spring
  VerletSpring2D spring=new VerletSpring2D(p1,p2,80,0.01);

  // Must add everything to the world
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addSpring(spring);
}

void draw() {
  // Must update the physics
  physics.update();

  background(255);

  // Drawing everything
  line(p1.x,p1.y,p2.x,p2.y);
  p1.display();
  p2.display();

  if (mousePressed) {
    //[full] Moving a Particle according to the mouse
    p2.lock();
    p2.x = mouseX;
    p2.y = mouseY;
    p2.unlock();
    //[end]
  }
}

//[full] How cute is our simple Particle class?!
class Particle extends VerletParticle2D {

  Particle(Vec2D loc) {
    super(loc);
  }

  void display() {
    fill(175);
    stroke(0);
    ellipse(x,y,16,16);
  }
}
//[end]


