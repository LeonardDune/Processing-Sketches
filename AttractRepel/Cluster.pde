class Cluster {

  // A cluster is a grouping of nodes
  ArrayList nodes;
  
  float diameter;
  
  color col;

  // We initialize a Cluster with a number of nodes, a diameter, and centerpoint
  Cluster(float d) {

    // Initialize the ArrayList
    nodes = new ArrayList();
    
    diameter = d;
    
    col = color(255);

  }
  
  void setColor (color c) {
    col = c;
  }
  
  void add(Node n) {
    nodes.add(n);
    n.setColor(col);
    
    // Connect this Node to existing nodes
    for (int i = 0; i < nodes.size(); i++) {
       VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
       physics.addSpring(new VerletMinDistanceSpring2D((VerletParticle2D) n,pi,diameter,0.01));
    }   
  }

  void display() {
    // Show all the nodes
    for (int i = 0; i < nodes.size(); i++) {
      Node n = (Node) nodes.get(i);
      n.display();
    }
    stroke(col,200);
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for (int j = i+1; j < nodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) nodes.get(j);
        line(pi.x,pi.y,pj.x,pj.y);
      }
    }
  } 
}
