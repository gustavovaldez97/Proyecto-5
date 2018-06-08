import processing.sound.*;

int x;
int y;
float outsideRadius = 150;
float insideRadius = 100;

SoundFile sound;

void setup() {
  size(600, 400);
  background(0);
  x = width/2;
  y = height/2;
  sound= new SoundFile(this, "Funky.aiff");
  sound.loop();
}

void draw() {
  background(0);
  
  int numPoints = int(map(mouseX, 0, width, 6, 60));
  float angle = 0;
  float angleStep = 180.0/numPoints;
  colorMode(HSB);
  fill(mouseY,100,100);  
  beginShape(QUAD_STRIP); 
  for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius;
    float py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
  sound.rate(map(mouseX, 0, width, 0.25, 4.0));
  sound.amp(map(mouseY, 0, width, 0.2, 1.0)); 
  sound.pan(map(mouseY, 0, width, -1.0, 1.0));
  
}
