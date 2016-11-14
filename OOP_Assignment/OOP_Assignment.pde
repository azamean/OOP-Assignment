import ddf.minim.*;

Star[] stars = new Star[800];
float speed;

Minim minim;
AudioPlayer player;


void setup() 
{
 size(800, 800);
   minim = new Minim(this);
   player = minim.loadFile("Space.mp3");
   player.play();
 
 for(int i = 0; i < stars.length; i++)
 {
   stars[i] = new Star();
 }
 
}


void draw()
{
  speed = map(mouseX, 0, width, 0, 50);
  
  background(0);
  translate(width/2, height/2);
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }
}