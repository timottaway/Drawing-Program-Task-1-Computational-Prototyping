class Tools
{
  //Tool Variables
  float x;
  float y;
  float tempX;
  float tempY;
  float sizeX;
  float sizeY;
  int currentSizeX;
  int currentSizeY;
  int penDefault = 7;
  int airbDefault = 45;
  float changeFactor = 0.35;
  boolean cursor;
  //boolean refresh;
  color c;
  int red;
  int green;
  int blue;
  int opacity;
  int toolX;
  int toolY;
  float toolAlpha;
  int colourStore_index;
  color[] colourStore = new color[c];
  
  //float penX;
  //float penY;
  //float penA;
  //float airbX;
  //float airbY;
  //float airbA;
     
//-------------------------------------
  
  void setColour(int _c)
  {
    c = _c;
    c = color(red,green,blue,opacity);
  }
  
  void setSize(int _x, int _y) 
  {
    x = _x;
    y = _y;
  }
  
  void setOpacity(int _opacity) //THIS FUNCTION WILL BE CALLED WHEN THE 'O' KEY IS HELD WHILE DRAGGING MOUSE LEFT OR RIGHT ON THE X AXIS TO CONTROL BRUSH OPACITY
  {
    opacity = _opacity;  
       
  }

//-------------------------------------

  void changeSize() //THIS FUNCTION WILL BE CALLED WHEN THE 'B' KEY IS HELD WHILE DRAGGING MOUSE LEFT OR RIGHT ON THE X AXIS TO CONTROL BRUSH SIZE 
  {
    //loop tells the brush size to increment everytime the mousex updates.
    
    if (mousePressed == true) { 
      x = currentSizeX;
      y = currentSizeY;
      b.bbrushSize();
      if (mouseX > (width/2)) {
        while ((x < 300) && (y < 300)) {
        
          sizeX = (mouseX/2) * changeFactor;
          sizeY = (mouseX/2) * changeFactor;
          x = x + 1;
          y = y + 1;
        //println(sizeX,sizeY);
        }

        
       } else if (mouseX < (width/2)) {
        while ((x < 300) && (y < 300)) {
        
          sizeX = (mouseX/2) * changeFactor;
          sizeY = (mouseX/2) * changeFactor;
          x = x + 1;
          y = y + 1;
        //println(sizeX,sizeY);
        
        }
      }
      
    }
  }  
  
  
  void changeOpacity()
  {
    if ((key == 'o' || key == 'O') && (mousePressed == true)) {
        opacity = ((int)mouseX/(int)width)*255;
        c = color(red,green,blue,opacity);
        println(opacity);
      } 
      
  }

  void readColour() 
  //THIS FUNCTION WILL BE CALLED TO READ COLOUR VALUES AND PARSE THEM 
  //IN TO THE 'setColour' FUNCTION WHEN MOUSE IS CLICKED 
  //WITHIN THE BOUNDS OF THE COLOUR WHEEL.
  { 
    if ((mouseX > 1400) && (mouseX < (1400+400)) && (mouseY > 30) && (mouseY < (30+400)) && c < color(255,255,255) ) {
      get(mouseX,mouseY);      
      c = get(mouseX,mouseY);
      println(mouseX,mouseY,c);
      //colourStore_index = 0;
      //colourStore[colourStore_index] = c; 
    }
  
  }
  
  void cursorStroke() //THIS FUNCTION IS THE DEFAULT BRUSH OUTLINE CURSOR THAT IS DISPLAYED WHEN NOT DRAWING.
  {
    if (mousePressed == true) {
      cursor = false;
    } else {
      cursor = true; 
      fill(0,0,0,0);
      stroke(0);
      ellipse(mouseX,mouseY,x,y);
      loadPixels();
    }
  }
  
  void brush1()  //, int _toolAlpha
  {
    //opacity = _toolAlpha;
    //c = color(c,opacity);
    //if (cursor == false) {    
      fill(c);
      noStroke(); //Fix stroke setting, not turning off when selecting drawing brushes
      ellipse(mouseX,mouseY,sizeX,sizeY);
      
      
    //} 
        
  }
  
    void buttonDown()
  {
    
    
    if ((mouseX > b.iconin) && (mouseX < (b.iconin+b.iconsize)) && (mouseY > b.peniconY) && (mouseY < (b.peniconY+b.iconsize)) ) {  
      t.sizeX = t.penDefault + t.x;//parse in size and alpha settings here for 'pen' tool from Tools class via main class
      t.sizeY = t.penDefault + t.y;
      //b.alphaValue = 255;
      
      if (t.c == color(255,255,255) || (t.sizeX > t.penDefault)) {
        t.c = color(0,0,0);
        b.colourValue = t.c;
        t.sizeY = t.sizeY * 2; 
      
      }} else if ((mouseX > b.iconin) && (mouseX < (b.iconin+b.iconsize)) && (mouseY > b.airbiconY) && (mouseY < (b.airbiconY+b.iconsize)) ) {   
          t.sizeX = t.airbDefault + t.x;//parse in size and alpha settings here for 'airbrush' tool from Tools class via main class
          t.sizeY = t.airbDefault + t.y;
          //b.alphaValue = 150;
          if (t.c == color(255,255,255)) {
            t.c = color(0,0,0);
            b.colourValue = t.c;
        
      }} else if ((mouseX > b.iconin) && (mouseX < (b.iconin+b.iconsize)) && (mouseY > b.erasericonY) && (mouseY < (b.erasericonY+b.iconsize)) ) {   
        t.sizeX = 20 + t.x;//parse in size and alpha settings here for 'eraser' tool from Tools class via main class
        t.sizeY = 20 + t.y;
        //b.alphaValue = 255;
        t.c = color(255,255,255);
        
        
      }
      
  }
    
    
}