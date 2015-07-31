/*
* Creative Coding
* Eating elements
* by Renzo Woutes
* Copyright (c) 2014
*
* This sketch draws a series of moving Elements (circles) according to the following rules:
* - start from a random position and move in a constant random direction
* - if the point reaches the boundary of the screen move in the opposite direction with new velocity
* - if the circles intersect then the largest circles eats the smallests circle.
* - the combined circles change direction being the difference between the two old directions
*/
float[] x;      // position
float[] y;
float[] xInc;   // change per frame
float[] yInc;
float[] size;   // size of the element
int numArray;   // number of elements
//float proximity;  // if distance between elements < proximity then draw a line between them

void setup() {
   size(500, 500);
   numArray = 100;
   // allocate arrays
   x= new float[numArray];
   y= new float[numArray];
   xInc= new float[numArray];
   yInc= new float[numArray];
   size= new float[numArray];

   // random starting position and direction
   for (int i=0; i<numArray; i++) {
      x[i] = random(width);
      y[i] = random(height);
      xInc[i] = random(-1, 1);
      yInc[i] = random(-1, 1);
      size[i] = random(5, 30);
   }
   strokeWeight(2);
}
void draw() {
  background(255);

  for (int i=0; i<numArray; i++) {
      for (int j=0; j<i; j++) {
         float dist = dist(x[i], y[i], x[j], y[j]  );
         if (dist <= (size[i]/2 + size[j]/2)) {
            // combine the two elements
            x[i] = x[j];
            y[i] = y[j];
            // new direction
            float newX = (xInc[i] + xInc[j]) / 2;
            float newY = (yInc[i] + yInc[j]) / 2;
            xInc[i] = newX;
            xInc[j] = newX;
            yInc[i] = newY;
            yInc[j] = newY;
         }
      }
   }
   // iterate over each point
   for (int i=0; i<numArray; i++) {
      x[i] += xInc[i];
      y[i] += yInc[i];
      // bounce off the sides of the window
      if (x[i] > width || x[i] < 0) {
         xInc[i] = xInc[i] > 0 ? -random(1) : random(1);
      }
      if (y[i] > height || y[i] < 0 ) {
         yInc[i] = yInc[i] > 0 ? -random(1) : random(1);
      }
      drawElement(x[i], y[i], xInc[i], yInc[i], size[i]);
   }
   
}
void drawElement(float x, float y, float dx, float dy, float size) {
   // draw the point in red
   noFill();
   stroke(255, 0, 0);
   point(x, y);
   // draw an arrow in the current direction of travel
   stroke(0, 100);
   float endX = x + (dx*20);
   float endY = y + (dy*20);
   float arX = x + (dx*15);
   float arY = y + (dy*15);
   line(x, y, endX, endY);
   line(endX, endY, arX + (dy * 5), arY - (dx * 5));
   line(endX, endY, arX - (dy * 5), arY + (dx * 5));
   stroke(128, 10);
   fill(255,0,0,50);
   ellipse(x, y, size, size);
}
