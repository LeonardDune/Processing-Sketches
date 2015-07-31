class Vehicle {
  
  Body body;
  float r = 5.0;
  float maxspeed;
  float maxforce;  
  
  Vehicle (float x, float y, float ms, float mf) {
    maxspeed = ms;
    maxforce = mf;
    makeVehicle (new Vec2 (x,y), r);
    
  }
  
  void makeVehicle (Vec2 vec; float r_) {
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(vec));

    body = box2d.createBody(bd);

    body.setLinearVelocity(new Vec2(0, 0));
    body.setAngularVelocity(0);    
    
    
    body.createFixture(fd);


    
    float theta = vec.heading() + PI/2;
    
  }
}
