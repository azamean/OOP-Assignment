//Star class 

class Star {
  
  //Declare class variables
  
  float x;
  float y;
  float z;
  float pz;
  
  //Default star constructor
  
  Star() 
  {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    
    pz = z;    
  }
  
  //Method to show and draw stars
  
  void show()
  {
    fill(255);
     
     //Map sx, sy and previous x, y values to determine where to draw 
     //lines to show a "streaking" effect from stars
     
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);    
    float r = map(z, 0, width/2, 16, 0);
    
    ellipse(sx,sy,r,r);
    
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);
    
    pz = z;
    
    stroke(255);
    line(px, py, sx, sy);
    
  }
  
  //Update method to determine where to draw stars on the z-axis
  
  void update()
  {
    z = z - speed;
    
    if(z < 2)
    {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-width/2, width/2);
      pz = z;
    }
  }
  
  
  
}