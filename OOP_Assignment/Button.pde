//Button class

class Button
{
  //Declare class variables
  String label;
  float x, y, w, h;
  
  //Default constructor
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB)
  {
    //x, y, width and height variables
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  //Draw method to draw buttons to screen
  
  void Draw() {
    //Import font
    PFont font;
    font = loadFont("SWTORTrajan-16.vlw");
    fill(0);
    stroke(255);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(255);
    textFont(font, 14);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  //Method to check if mouse if over a button, giving back a boolean result
  
  boolean mouseOver()
  {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}