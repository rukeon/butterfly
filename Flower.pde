class Flower {
  float num;

  Flower(){
    num = 0;
    pathR = 0;
    pathG = 0;
    pathB = 0;
  }

  void display(){
    translate(centerX, centerY);
    for (int i = 0; i < 360; i+=30) {
      float x = sin(radians(i+frameCount)) * 50;
      float y = cos(radians(i+frameCount)) * 50;
      pushMatrix();
      translate(x, y);
      rotate(radians(-i));
      branch(20, i);
      popMatrix();
    }
    num+=0.02;  
  }

  void branch(int l, int i) {
    float theta = sin(num)*90;
 
    line(0, 0, 0, l);
    translate(0, l);
   
    l *= 0.66;
    
    if(centerX > width/2){
      if(centerY > height/2){
      //winter
        pathR = (((float)255/width)*(-1)*(centerX-width)+theta)+125*sin(i+num*3);
        pathG = (50+theta)+125*sin(i+num*3);
        pathB = (((float)255/height)*(-1)*(centerY-height)+theta)+125*sin(i+num*3);      
      } else {
        //spring
        pathR = (((float)255/width)*centerX+theta)+125*sin(i+num*3);
        pathG = (50+theta)+125*sin(i+num*3);
        pathB = (((float)255/height)*centerY+theta)+125*sin(i+num*3);
      }
    } else {
      if(centerY > height/2){
      //fall
        pathR = (((float)255/width)*centerY+theta)+125*sin(i+num*3);
        pathG = (50+theta)+125*sin(i+num*3);
        pathB = (((float)255/height)*centerX+theta)+125*sin(i+num*3);      
      } else {
      //summer
        pathR = (((float)255/width)*centerX+theta)+125*sin(i+num*3);
        pathG = (50+theta)+125*sin(i+num*3);
        pathB = (((float)255/height)*(-1)*(centerY-height)+theta)+125*sin(i+num*3);      
      }
    }
   
    if (l > 2) {
      stroke(pathR, pathG, pathB);
//      println(pathR, pathG, pathB);
      pushMatrix();
      rotate(radians(theta));
      branch(l, i);
      popMatrix();
   
      stroke(pathR, pathG, pathB);
      pushMatrix();
      rotate(-radians(theta));
      branch(l, i);
      popMatrix();
    } else {
      noStroke();
//      println(pathR, pathG, pathB);
      fill(pathR, pathG, pathB);
      ellipse(0, 0, 5, 5);
    }
  }    
  
}
