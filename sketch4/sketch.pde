class dotElement {
   float x,y, s;
   color c;
   dotElement (float posx, float posy, float size, color col) {
      x = posx;
      y = posy;
      s = size;
      c = col;
   }
   void display() {
      fill (col, 75);
      ellipse(x,y, s,s);
   }
}

Random generator;

void setup() {
   size(displayWidth, displayHeight);
   generator = new Random();

}

void draw() {
   float x = (float) generator.nextGaussian();
   float y = (float) generator.nextGaussian();
   float sd = 75;
   float xmean = width/2;
   float ymean = height/2;
   float posx = sd * x + xmean;
   float posy = sd * y + ymean;
   color col = color(255, 0, 0);
   float size = 5;
   dotElement dot = new dotElement(posx, posy, size, col);
   dot.display();


}