int num = 10;
boolean attraction = false;
float clickX, clickY;

Particle[] p  = new Particle[num];

void setup()
{
  frameRate(30);
  
  size(600, 600); 
  for(int i = 0; i < num; i++) 
  {
    p[i] = new Particle(random(50, 200), RandomColor(), 0.5, 2);
  }
}

void draw()
{
  background(0);
  
  for(int i = 0; i < num; i++) 
  {    
    p[i].Create();
    p[i].Move(); //<>//
    
    if(mouseButton == RIGHT)
      p[i].AttractiveClick(clickX, clickY);

    if(p[i].IsHidden())
    {
      p[i].Show();
    }
  }
}

void mouseClicked()
{
  clickX = mouseX;
  clickY = mouseY;
  
  for(int i = 0; i < num; i++) 
  {  
    p[i].SetColor(RandomColor());
  }
}