class Surface {
  ArrayList<Vec2> surface;
  
  float angle = 0;
  float angleVel = 0.2;
  float amplitude = 100;
  
  Surface() {
    surface = new ArrayList<Vec2>();
    
    for (int x = 0; x <= width; x += 5) {
      float y = map(sin(angle),-1,1,0,height);
      surface.add(new Vec2(x,y));
      angle +=angleVel;
    }
    
    ChainShape chain = new ChainShape();
    
    Vec2[] vertices = new Vec2[surface.size()];
    
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }
  
  void display() {
    strokeWeight(1);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}
