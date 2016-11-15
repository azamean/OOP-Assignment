import ddf.minim.*;
Button button, button2;

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
   //smooth();
   button = new Button("Increase Speed", 650, 300, 150, 80);
   button2 = new Button("Decrease Speed", 650, 400, 150, 80);

}


void draw()
{  
  background(0);
  //translate(width/2, height/2);
  
  button.Draw();
  button2.Draw();
  displaySpeed();
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }

}

void mousePressed()
{
  if (button.mouseOver()) {
    print("Clicked"); 
    if(speed < 29){
      speed = speed + 1;
     }
  }
  
    if (button2.mouseOver()) {
    print("Clicked"); 
    if(speed > 0){
      speed = speed - 1;
    }
  }
}
void displaySpeed()
{       
      PFont font;
      font = loadFont("SWTORTrajan-16.vlw");
      String display = "Warp: " + speed / 3 + "\nCurrent Velocity";
      textFont(font, 30);
      text(display, width/2, 700); 
}