class Buttons
{
  PImage pen;
  PImage airb;
  PImage eraser;
  PImage colourw;
  PImage brushSize;
  int iconin;
  int iconsize;
  int peniconY;
  int airbiconY;
  int erasericonY;
  int colourwiconin;
  int colourwY;
  color colourValue;
  int alphaValue;
  float toolSizeX;
  float toolSizeY;
  int brushSizeX;
  int brushSizeY;
    
//-------------------------------------
  
  void loadIcons()
  {
    iconin = 60;
    iconsize = 100;
    peniconY = 60;
    airbiconY = peniconY*4;
    erasericonY = peniconY*7;
    colourwiconin = width-400;
    colourwY = 30;
    pen = loadImage("Pen.png");
    airb = loadImage("Airb.png");
    eraser = loadImage("Eraser.png");  
    colourw = loadImage("Colourw.png");
    brushSize = loadImage("brushSize.png"); 
  }
  
  void buttonDisplay()
  {
    brushSizeX = t.currentSizeX;
    brushSizeY = t.currentSizeY;
    image(pen,iconin,peniconY,iconsize,iconsize);
    image(airb,iconin,airbiconY,iconsize,iconsize);
    image(eraser,iconin,erasericonY,iconsize,iconsize);  
    image(colourw,colourwiconin,30,400,400);
    image(brushSize,colourwiconin,682,brushSizeX,brushSizeY);
    textSize(32);
    text("Press B and drag mouse Left and Right to Adjust Brush size",iconin,height-30); 
    fill(0, 0, 0);
  }
  
  void colourBox(color _colourValue)
  {
    colourValue = _colourValue;
    
    fill(colourValue); 
    stroke(0);
    rect(colourwiconin+115,colourwY*15,175,175);
  }
  
  void brushSize()
  {
    t.currentSizeX = (int)t.x;
    t.currentSizeY = (int)t.y;
    image(brushSize,colourwiconin,682,t.currentSizeX,t.currentSizeY);
  }
  
}