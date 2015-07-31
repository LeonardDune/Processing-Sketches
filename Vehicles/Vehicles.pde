ArrayList<Vehicle> vehicles;
PVector target;
int numVehicles = 2000;

void setup() {
  size(900,600);
  target = new PVector(width/2,height/2);
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
