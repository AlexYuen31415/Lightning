PImage lowtiergod;
PImage lowtiergodshower;
float strok = 2.5;

void lightning() {
  float x = (float)Math.random()*400;
  float y = 0;
  float chanceFork = 0;
  strok = 2.5;
  
  float lightningcolor = (int)(Math.random()*2);
  float c = (int)(Math.random()*255);
  float r = 0;
  float g = 0;
  float b = 0;
  
  if (lightningcolor == 0) {
    //yellow
    r = 255;
    g = 255;
    b = 0;
  } else {
    //gray scale
    r = c;
    g = c;
    b = c;
  }
  
  /*
  if (lightningcolor == 0) {
    //yellow
    r = c;
    g = c;
    b = 0;
  } else if (lightningcolor == 1) {
    //pink
    r = c;
    g = 0;
    b = c;
  } else {
    //blue
    r = 0;
    g = c;
    b = c;
  }
  
  
  ArrayList<Float> xs = new ArrayList<Float>();
  ArrayList<Float> ys = new ArrayList<Float>();
  
  while (y < 400) {
    float newX = x + random(-10, 10);
    float newY = y + random(10, 20);
    strokeWeight(7.5);
    stroke(205, 50);
    line(x, y, newX, newY);
    x = newX;
    y = newY;
    xs.add(x);
    ys.add(y);
  }
  
  int xsnum1 = 0;
  int ysnum1 = 0;
  while (xsnum1 < xs.size()-1) {
    strokeWeight(5);
    stroke(235, 75);
    line(xs.get(xsnum1), ys.get(ysnum1), xs.get(xsnum1+1), ys.get(ysnum1+1));
    xsnum1 ++;
    ysnum1 ++;
  }
  
  int xsnum2 = 0;
  int ysnum2 = 0;
  while (xsnum2 < xs.size()-1) {
    strokeWeight(2.5);
    stroke(255, 100);
    line(xs.get(xsnum2), ys.get(ysnum2), xs.get(xsnum2+1), ys.get(ysnum2+1));
    xsnum2 ++;
    ysnum2 ++;
  }
  */
  
  while (y < 400) {
    float newX = x + random(-10, 10);
    float newY = y + random(10, 20);
    
    strokeWeight(strok*3);
    stroke(r - 40, g - 40, b - 40, 25);
    line(x, y, newX, newY);
    
    strokeWeight(strok*2);
    stroke(r - 20, g - 20, b - 20, 50);
    line(x, y, newX, newY);
    
    strokeWeight(strok);
    stroke(r, g, b, 75);
    line(x, y, newX, newY);
    
    x = newX;
    y = newY;
    
    chanceFork += (float)Math.random();
    //System.out.println(chanceFork);
    if (chanceFork > 3) {
      strok = strok/1.67;
      forkedLightningLeft(x, y, r, g, b);
      forkedLightningRight(x, y, r, g, b);
      break;
    }
  }
  
}

void fork() {
  /*
  increasing variable representing the probability it forks
   - resets every fork
   - makes another lightning(); at coords xs.get(xsnum2) and ys.get(ysnum2)
   - set fork_1 approaches x=0 and fork_2 approaches x=400
  */
}

void forkedLightningLeft(float startX, float startY, float r, float g, float b) {
  float x = startX;
  float y = startY;
  float chanceFork = 0;
  
  while (y < 400) {
    float newX_1 = x + random(-10, 5);
    float newY_1 = y + random(10, 20);
    
    strokeWeight(strok*3);
    stroke(r - 40, g - 40, b - 40, 25);
    line(x, y, newX_1, newY_1);
    
    strokeWeight(strok*2);
    stroke(r - 20, g - 20, b - 20, 50);
    line(x, y, newX_1, newY_1);
    
    strokeWeight(strok);
    stroke(r, g, b, 75);
    line(x, y, newX_1, newY_1);
    
    x = newX_1;
    y = newY_1;
    
    chanceFork += (float)Math.random();
    //System.out.println(chanceFork);
    if (chanceFork > 3) {
      forkedLightningLeft(newX_1, newY_1, r, g, b);
      forkedLightningRight(newX_1, newY_1, r, g, b);
      break;
    }
  }
}

void forkedLightningRight(float startX, float startY, float r, float g, float b) {
  float x = startX;
  float y = startY;
  float chanceFork = 0;

  while (y < 400) {
    float newX_2 = x + random(-5, 10);
    float newY_2 = y + random(10, 20);
    
    strokeWeight(strok*3);
    stroke(r - 40, g - 40, b - 40, 25);
    line(x, y, newX_2, newY_2);
    
    strokeWeight(strok*2);
    stroke(r - 20, g - 20, b - 20, 50);
    line(x, y, newX_2, newY_2);
    
    strokeWeight(strok);
    stroke(r, g, b, 75);
    line(x, y, newX_2, newY_2);
    
    x = newX_2;
    y = newY_2;
    
    chanceFork += (float)Math.random();
    //System.out.println(chanceFork);
    if (chanceFork > 3) {
      forkedLightningLeft(newX_2, newY_2, r, g, b);
      forkedLightningRight(newX_2, newY_2, r, g, b);
      break;
    }
  }
}

int flashy = 0;
int flashy2 = 0;

void flash() {
  image(lowtiergod, 0, 0, 400, 400);
  if (flashy > 0) {
    fill(255, flashy);
    noStroke();
    rect(0, 0, 400, 400);
    /*
    fill(0, 0, 0, flashy);
    textSize(100);
    text("JOB", 100, 200);
    */
    tint(255, flashy2);
    image(lowtiergodshower, 100, 100, 200, 200);
    flashy -= 10;
    flashy2 -= 15;
  }
  noTint();
}

void setup()
{
  size(400,400);
  lowtiergod = loadImage("lowtiergod.jpeg");
  lowtiergodshower = loadImage("lowtiergodshower.jpeg");
  //frameRate(5);
}
void draw()
{
  flash();
  /*
  for (int light = 0; light < 5; light++)
  if (mousePressed) {
    lightning();
  }
  */
}
  
void mousePressed()
{
  lightning();
  flashy = 255;
  lightning();
  flashy2 = 255;
  lightning();
}
