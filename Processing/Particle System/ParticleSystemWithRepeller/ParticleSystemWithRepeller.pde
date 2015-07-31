ParticleSystem ps;
ArrayList<Repeller> repellers;

void setup() {
  size(640,360);
  ps = new ParticleSystem (new PVector(width/2, 50));
  repellers = new ArrayList<Repeller>(); 
  for (int i = 0; i<5; i++) {
    repellers.add(new Repeller(random(20,width-20), random(20,height-20),random(50,150)));
  }
}

void draw() {
  background (100);
  
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  
  for (Repeller repeller: repellers) {
    ps.applyRepeller(repeller);
    repeller.display();
  }
  
  ps.addParticle();
  ps.run();
}

