import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;
Cluster cluster;

void setup() {
  size (640,360);
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(3,5)));
  physics.setWorldBounds(new Rect(0,0,width,height));
  cluster = new Cluster(8,100,new Vec2D(width/2,height/2));
}

void draw() {
  physics.update();
  background(255);
  cluster.display();
  
  if (mousePressed) {
    
  }
    
}

void mouseDragged() {
  Vec2D p = new Vec2D(mouseX,mouseY);
  for (int i = 0; i < cluster.nodes.size(); i++) {
    Node n = cluster.nodes.get(i);
    if (n.overlap(p)) {
      n.setPreviousPosition(p);
    }
  }
}



