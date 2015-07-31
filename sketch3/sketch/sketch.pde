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
int[] fc;
int[] lc;
int numArray;   // number of elements

color[] colors = {color(0,0,255), color(255, 0, 0), color(128)};

float proximity = 50;

void setup() {
   size(500, 500);
   numArray = 1000;
   // allocate arrays
   x= new float[numArray];
   y= new float[numArray];
   xInc= new float[numArray];
   yInc= new float[numArray];
   fc = new int[numArray];
   lc = new int[numArray];
   size= new float[numArray];

   // random starting position and direction
   for (int i=0; i<numArray; i++) {
      x[i] = random(width);
      y[i] = random(height);
      xInc[i] = random(-1, 1);
      yInc[i] = random(-1, 1);
      fc[i] = (int) random(1,3);
      lc[i] = (int) random(1,3);
      size[i] = random(5, 100);
   }
   strokeWeight(0.2);
   frameRate(300);
}
void draw() {
  background(255);

  for (int i=0; i<numArray; i++) {
      for (int j=0; j<i; j++) {
         float dist = dist(x[i], y[i], x[j], y[j]);
              
         // if two elements collide, combine them
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
            // change color of the smallest one
            if (size[i] < size[j]) {
              fc[i] = (int) random(2,3);
              lc[i] = (int) random(1,3);
            } else {
              fc[j] = (int) random(2,3);
              lc[j] = (int) random(1,3);
            }
         }

         // if two elements are within a certain proximity, draw a line between them         
         if (dist <= proximity && dist > (size[i]/2 + size[j]/2)) {
           stroke(colors[2], 30);
           line(x[i], y[i], x[j], y[j]);
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
      drawElement(x[i], y[i], size[i], colors[fc[i]-1], colors[lc[i]-1]);
   }
   
}
void drawElement(float x, float y, float size, color fc, color lc) {
   stroke(lc,50);
   fill(fc,10);
   ellipse(x, y, size, size);
}


