class Dot { 

  PVector pos; 
  PVector vel; 
  PVector acc; 

  int[] xpos = new int[30];
  int[] ypos = new int[30];

  color c; 
  float s; 
  float rdom = random(10,90); 

  float maxSpeed = 10.0; 
  float drag = 0.9; 

  Dot( PVector _pos, color _c, float _s  ) { 
    pos = _pos; 
    c = _c;
    s = _s;

    vel = new PVector(random(-2,2),random(-2,2)); 
    acc = new PVector(); 
    
    for (int i = 0; i < xpos.length; i++) {
      xpos[i] = 0; 
      ypos[i] = 0;
    }
    
  }

  void run() {  
    move(); 
    display(); 
  }

  void display() { 
    fill(c); 
    int splat = round(random(0,2)); 
    textFont(font, s); 
    
    xpos[xpos.length-1] = centerX;
    ypos[ypos.length-1] = centerY;
    
    for (int i = 0; i < xpos.length - 1; i++) {
      xpos[i] = xpos[i + 1];
      ypos[i] = ypos[i + 1];
    }
    
    for(int i = 0; i < xpos.length; i++) {
    if(splat == 0) { 
      text("a", xpos[i]+random(10,20), ypos[i]+random(10,20)); 
    } 
    else { 
      if(splat == 1) { 
        text("t", xpos[i]+random(10,20), ypos[i]+random(10,20)); 
      }
      else { 
        text("g", xpos[i]+random(10,20), ypos[i]+random(10,20)); 
      }
    }
    }
  }

  void move() {
    vel.mult(drag); 
    vel.limit(maxSpeed); 
    pos.add(vel); 
    vel.add(acc); 
    acc.mult(0); 
  }
}


