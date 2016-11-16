import ddf.minim.*;
Button button, button2, button3, button4;

Star[] stars = new Star[800];
float speed;
boolean stats = false;
boolean radar = false;
float Btarget = 9.0;
float A = 1.0;
float K = 8.0;
float B = 9.0;
float t = 0.0;
float step = 1;

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
   button3 = new Button("Display Statistics", 50, 10, 200, 80);
   button4 = new Button("Scan for \nAnomalies", 50, 690, 150, 100); 
    
}


void draw()
{  
  background(0);
  //translate(width/2, height/2);
  
  button.Draw();
  button2.Draw();
  button3.Draw();
  button4.Draw();
  displaySpeed();
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }
  
  if(stats) displayStats();
  if(radar) showRadar();

}

void mousePressed()
{
  if (button.mouseOver()) 
  {
    if(speed < 29)
    {
      speed = speed + 1;
    }
  }
  
  if (button2.mouseOver()) 
  {
    if(speed > 0)
    {
      speed = speed - 1;
    }
  }
    
  if (button3.mouseOver()) 
  {
     stats = !stats;
  }
  if (button4.mouseOver()) 
  {
     radar = !radar;
     Btarget=random(2, 10);
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

void displayStats()
{
  PFont font;
  font = loadFont("SWTORTrajan-16.vlw");
  
  String statistics = "Hull Integrity: " + ((100 - speed) * 0.98) + 
  "\nShield Strength: " + (100 - (speed*2)) * 0.9 + "\nWarp Core Stable" ;
  
  textFont(font, 14);
  fill(175, 15, 15);
  text(statistics, 110, 120); 
}

void showRadar()
{
  fill(0);
  stroke(255);
  ellipse(125, 550, 250, 250);
  line(125, 675, 300, 675);
  line(178, 665, 275, 665);
  fill(175,15,15);
  stroke(0);
  triangle(205, 655, 240, 630, 260, 655);
  
}

float wave(float x) {
  return A*pow(K/(K+pow(x, 4)), K)*cos(B*x-t);
}

void waves()
{
  float lastx = 0.0;
  float lasty = 550;
  for (float x=0; x<225; x+=step) {
    float tmpx = map(x, 0, 250, -3, 3);    
    float tmpy = wave(tmpx);
    float y = map(tmpy, -3, 3, 500, 600);
    fill(255);
    stroke(255);
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }
  t += 0.3;  
  B += (Btarget-B)/10;

}