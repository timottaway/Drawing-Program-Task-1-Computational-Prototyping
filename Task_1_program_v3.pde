//RMIT Computational Prototyping ARCH1477, Task 1, Semester 1, 2018
//Code by Tim Ottaway.

Tools t;
Buttons b;


//-------------------------------------

void setup() 
{
  //Set the Scene
  background(255,255,255);
  size(1800,900);
  
  //Initialize Classes
  b = new Buttons();
  t = new Tools();
    
  //Draw Buttons
  b.loadIcons();  //Load GUI
  
  
  
}

//-------------------------------------

void draw()
{
  b.buttonDisplay(); //Display GUI
 
}

void mouseDragged() 
{
  
  t.brush1();  
  
}

void mousePressed()
{
  t.readColour();
  b.colourBox(t.c);
  t.buttonDown();
  t.brush1();  
  
}

void keyPressed()
{
  t.changeSize();
  t.changeOpacity();
  
}