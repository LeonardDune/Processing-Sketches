import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Vehicle> vehicles;
Vec2 target;
int numVehicles = 200;

void setup() {
  size(640,360);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);

  // Create ArrayLists  
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < numVehicles; i++) {
   Vehicle v = new Vehicle (random (0,width), random(0,height), random(0.1,6), random(0.01,0.5));
   vehicles.add(v);
  }
  
}


void draw() {
  background(255);
  target.set(mouseX,mouseY);
  fill(0,150);
  stroke(0);
  ellipse(mouseX,mouseY,20,20);
  for (int i = 0; i < vehicles.size(); i++) {
    Vehicle v = vehicles.get(i);
    v.seek(target);
    v.update();
    v.display();
  }  
}


