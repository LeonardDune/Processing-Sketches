class Cluster {
  ArrayList<Node> nodes;
  
  float diameter;
  
  Cluster (int n, float d, Vec2D center) {
    nodes = new ArrayList<Node>();
    diameter = d;
    
    for (int i = 0; i < n; i++) {
      nodes.add(new Node(center.add(Vec2D.randomVector())));
    }
    
    for (int i = 0; i < nodes.size()-1; i++) {
      VerletParticle2D ni = nodes.get(i);
      for (int j = i+1; j < nodes.size(); j++) {
        VerletParticle2D nj = nodes.get(j);
        physics.addSpring(new VerletSpring2D(ni,nj,diameter,0.01));
      }
    }
  }
  
  void display() {
    stroke(0);
    for (int i = 0; i < nodes.size(); i++) {
      Node ni = nodes.get(i);
      ni.display();
      if (i < nodes.size()) {
        for (int j = i+1; j < nodes.size(); j++) {
          Node nj = nodes.get(j);
          line(ni.x,ni.y,nj.x,nj.y);
        }
      }
    }
  }
}
