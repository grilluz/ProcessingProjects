color RandomColor()
{
  float red, green, blue;
  
  red = random(0, 255);
  green = random(0, 255);
  blue = random(0, 255);
  
  return color(red, green, blue);
}