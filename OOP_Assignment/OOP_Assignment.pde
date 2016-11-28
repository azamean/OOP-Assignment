//Import sound header files for minim

import ddf.minim.*;

//Include buttons

Button button, button2, button3, button4;

//Includes variables

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

//Setup method

void setup() 
{
   size(1200, 800);
   
   // Play spacey sounds using minim
   
   minim = new Minim(this);
   player = minim.loadFile("Space.mp3");
   player.play();
   
   //Generate stars
   
   for(int i = 0; i < stars.length; i++)
   {
     stars[i] = new Star();
   }
   
   // Place buttons
   
   button = new Button("Increase Speed", 1050, 300, 150, 80);
   button2 = new Button("Decrease Speed", 1050, 400, 150, 80);
   button3 = new Button("Display Statistics", 50, 10, 200, 80);
   button4 = new Button("Scan for \nAnomalies", 50, 690, 150, 100); 
    
}

//Draw method

void draw()
{  
  background(0);
  
  //Draw the buttons
  
  button.Draw();
  button2.Draw();
  button3.Draw();
  button4.Draw();
  displaySpeed();
  
  //Show the stars and translate them through
  //A push and pop matrix to center them without obstructing the buttons
  
  for(int i = 0; i < stars.length; i++)
  {
    pushMatrix();
    translate(width/2, height/2);
    stars[i].update();
    stars[i].show();
    popMatrix();
  }
  
  //Toggle the statistics and radar
  
  if(stats) displayStats();
  if(radar) showRadar();

}

//Check if mouse pressed

void mousePressed()
{
  //Check if mouse pressed on buttons
  
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
     //Btarget=random(8, 25);
  }
}

//Display the speed

void displaySpeed()
{       
      PFont font;
      font = loadFont("SWTORTrajan-16.vlw");
      String display = "Warp: " + speed / 3 + "\nCurrent Velocity";
      textFont(font, 30);
      text(display, width/2, 700); 
}

//Display statics method

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

//Radar method

void showRadar()
{
  //Draw the radar 
  
  fill(0);
  stroke(255);
  ellipse(125, 550, 250, 250);
  line(125, 675, 300, 675);
  line(178, 665, 275, 665);
  fill(175,15,15);
  stroke(0);
  triangle(205, 655, 240, 630, 260, 655);
  
  //Call the sine waves 
  
  waves();
}

  //Calculate the sine wave
  
  float wave(float x) {
  return A*pow(K/(K+pow(x, 4)), K)*cos(B*x-t);
}

//Sine wave generator method

void waves()
{
  
  float lastx = 0.0;
  float lasty = 550;
  
  
  
  for (float x=0; x<225; x+=step) {
    
    float tmpx = map(x, 0, 250, -1, 1);    
    float tmpy = wave(tmpx);
    float y = map(tmpy, -1, 1, 500, 600);
    
    //Draw sine waves, each wave is slightly offset by a ultiplier so that they overlap
    
    fill(255);
    stroke(255);
    line(lastx, lasty, x, y);
    line(lastx*1.05, lasty*0.95, x*1.05, y*0.95);
    line(lastx*0.90, lasty*0.97, x*0.90, y*0.97);
    line(lastx*0.92, lasty*0.92, x*0.92, y*0.92);
    line(lastx*0.96, lasty*0.99, x*0.96, y*0.99);
    
    lastx = x;
    lasty = y;
  }
  
  t += 0.3;  
  B += (speed-B)/10;

}