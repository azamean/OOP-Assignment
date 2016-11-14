class Button
{
  String label;
  float x, y, w, h;
  
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB)
  {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
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
  
  boolean mouseOver()
  {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}