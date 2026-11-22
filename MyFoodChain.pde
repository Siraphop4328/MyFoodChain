

double simulationTime = 0;
float pace = 288;
int lastMillis = 0;

long totalSec;
int sec, min, hour, day, month, year;


int cols, rows;
int scl = 50;
int w;
int h;


void setup(){
  fullScreen(P3D);
  frameRate(60);
  noiseSeed((long) random(100000));
  
  w = 2000;
  h = 2000;

  cols = w/scl;
  rows = h/scl;

  lastMillis = millis();

  

}

void draw(){
  background(255);

  theStartOfTime();
  drawTerrain();


  

}
