

double simulationTime = 0;
//float pace = 288;
float pace = 3600;
int lastMillis = 0;

long totalSec;
int sec, min, hour, day, month, year;


int cols, rows;
int scl = 80;
int w;
int h;


color backgroundColor;
color[] skyColors;

String timeString;





//////////// 

void setup(){
  fullScreen(P3D);
  noStroke();
  
    colorsTerrain();
  
  frameRate(60);
  noiseSeed((long) random(100000));
  
  w = 3000;
  h = 3000;

  cols = w/scl;
  rows = h/scl;

  lastMillis = millis();

  skyColors = new color[] {
    color(0, 0, 20),    // 0h: Midnight / Night
    color(39, 39, 94),  // 6h: Sunrise
    color(110, 195, 245), // 12h: Midday
    color(245, 130, 90),  // 18h: Sunset
    color(0, 0, 20)     // 24h: Back to Midnight
  };

  
  setupCamera();
}



void draw(){


  

  backgroundColor = getSkyColorFromTime();
  background(backgroundColor);
  theStartOfTime();

  

  updateCamera();
  applyCamera();



  drawTerrain();
  drawHUD();



  
}
  




