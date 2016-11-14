Star[] stars = new Star[800];

void setup() 
{
 size(800, 800);
 
 for(int i = 0; i < stars.length; i++)
 {
   stars[i] = new Star();
 }
 
}


void draw()
{
  background(0);
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].show();
  }
}