class Node extends VerletParticle2D {
  int r = 8;
  
  Node(Vec2D pos) {
    super(pos);
 } 
 
boolean overlap (Vec2D p) {
  if (distanceTo(p) < 2*r) {
    return true;
  }
  return false;
}
 
void display() {
  fill(0,150);
  stroke(0);
  ellipse(x,y,r*2,r*2);
  }
}
