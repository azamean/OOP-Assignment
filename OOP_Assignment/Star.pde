class Star {
  float x, y, z;
  float pz;
  
  Star() 
  {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    
    pz = z;
    
  }
  void show()
  {
    fill(255);
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    
    float r = map(z, 0, width/2, 16, 0);
    
    ellipse(sx,sy,r,r);
  }
  
  void update()
  {
    if(z < 1)
    {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-width/2, width/2);
      pz = z;
    }
  }
  
  
  
}