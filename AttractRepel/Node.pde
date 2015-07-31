class Node extends VerletParticle2D {
  
  color col;

  Node(Vec2D pos) {
    super(pos);
    col = color(255);
  }
  
  void setColor(color c) {
    col = c;
  } 

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
  }
}
