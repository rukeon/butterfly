//http://www.youtube.com/watch?v=dq2-j98Gnac&list=UUaWw-ag6TW6jLQsF950sVfA

import processing.video.*;
Capture cam;
Flower rose;
Dot D;

PFont font;
ArrayList Dots = new ArrayList();
int centerX, centerY;
int threshold = 100;
int number = round(random(1,3));
int frameControl = 25;
int picture = 0;
float pathR, pathG, pathB;

void setup() {
  size(640, 480);
  rose = new Flower();
  frameRate(frameControl);
  font = loadFont("Butterflies-48.vlw");
  cam = new Capture(this, width, height, 30);

  cam.start();
}

void draw() {
  frameRate(frameControl);
  noStroke();
  background(0);
  if ( cam.available()) {
    cam.read();
    flip();
  }

//  image(cam, 0, 0);
  for (int i=0; i<Dots.size(); i++){
    Dot D = (Dot) Dots.get(i); 
    D.run(); 
  }

  int sumX = 0;
  int sumY = 0;
  int count = 0;

  for ( int x = 0; x < cam.width; x++) {
    for (int y = 0; y < cam.height; y++) {
      color c = cam.pixels[y*cam.width + x];
      float redity = red(c) - 0.5*green(c) - 0.5*blue(c);
      if ( redity > threshold) {
        count++;
        sumX += x;
        sumY += y;
      }
    }
  }

  if (count != 0) {
    centerX = sumX/count;
    centerY = sumY/count;
    rose.display();
  }
}

void mousePressed(){ 
  int r = round(random(1,3)); 
  for( int w = 0; w < number; w = w + 1){ 
   if( r == 1){ 
    Dot D = new Dot( new PVector(centerX,centerY), color(pathR, pathG, pathB, random(50,100)), random(7,25) ); 
    Dots.add(D); 
   }
   else{ 
     if( r ==2){ 
       Dot D = new Dot( new PVector(centerX,centerY), color(pathR, pathG, pathB, random(50,100)), random(7,30) );  
       Dots.add(D); 
   }  else { 
     Dot D = new Dot( new PVector(centerX,centerY), color(pathR, pathG, pathB, random(50,100)), random(7,27) );  
     Dots.add(D); 
     }
   }
  }
}

void  keyPressed(){
  if (key == 'k' || key == 'K') {
    for (int i=0; i<Dots.size(); i++){
      Dot D = (Dot) Dots.get(i); 
      Dots.remove(D); 
    } 
  }
  
  if ( key == 'f' || key == 'F') {
    println("Now frameControl is: " + frameControl);  
  }
 
  if (keyCode == UP) {
    frameControl += 1;
    println("Now frameControl is: " + frameControl);
  } else if (keyCode == DOWN) {
    frameControl -= 1;
    println("Now frameControl is: " + frameControl);
  }

  if (key == 'S' || key == 's') {
    save("butterflyLovesFlower" + picture + ".jpeg");
    picture += 1;    
  }  
}
