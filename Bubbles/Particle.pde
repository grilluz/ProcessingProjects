class Particle
{
  private float speedX;
  private float speedY;
  
  private float x;
  private float y;
  private float size;
  private color c;
  
  private boolean display;
  private float opacity;
  private float fade;
  
  public Particle(float size, color c, float fade, float speed)
  {      
      this.Show();
      this.fade = fade;
      this.SetSize(size);
      this.SetSpeed(speed);
      this.SetColor(c);
      this.x = random(0, width);
      this.y = random(0, height);
  }
  
  public void Create()
  {    
    if(display) {
      noStroke();
      fill(c, this.opacity);
      ellipse(x, y, size, size);   //<>// //<>//
    }
  }
  
  public void Move()
  {
    if(display) {
      if(this.x <= 0 || this.x >= width)
      {
        this.speedX *= -1;
      }
      
      if(this.y <= 0 || this.y >= height)
      {
        this.speedY *= -1;
      }
      
      this.x += this.speedX;
      this.y += this.speedY;
      
      this.Fade();
      
      //if(this.opacity <= 0) 
      //  this.Hide();
    }
  }
  
  public void Fade()
  {
    opacity += fade;
    
    if(display == true && opacity <= 0) {
      fade *= -1;
      this.SetColor(RandomColor());
      this.SetSpeed(random(0, 5));
      this.SetSize(random(50, 200));
    }
      
    if(display == true && opacity >= 255)
      fade *= -1;
  }
  
  public void Show()
  {
    this.opacity = (int)random(100, 255);
    display = true;  
  }
  
  public void Hide()
  {
    display = false;  
  }
  
  public boolean IsHidden()
  {
    if(this.display == false)
      return true;
      
    return false;
  }
  
  public void SetColor(color c)
  {
    this.c = c;
  }
  
  public void SetSpeed(float s)
  {
      this.speedX = random(-s, s);
      this.speedY = random(-s, s);
      
      if(this.speedX == 0 || this.speedY == 0) {
        this.speedX += 1;
        this.speedY += 1;
      }
  }
  
  public void SetSize(float s)
  {
    if(s > 0)
      this.size = s;
    else
      this.size = random(10, 20);
  }
  
  public void AttractiveClick(float clickX, float clickY)
  {
    this.speedX = norm(clickX - this.x, 0, width) * 7;
    this.speedY = norm(clickY - this.y, 0, height) * 7;
  }
}