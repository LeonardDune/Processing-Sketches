import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;
Surface surface;

void setup() {
  size(900,700);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
  for (int i = 0; i < 7; i++) {
    Boundary bdy = new Boundary (100*i,height - 50*i,width/10, 5);
    boundaries.add(bdy);
  }
  
  surface = new Surface();
}

void draw() {
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  
  box2d.step();
  
  background(255);
  
  for (Boundary bd: boundaries) {
    bd.display();
  }
  
  for (Box b: boxes) {
    b.display();
  }
  
  surface.display();
}

