

float[] heightStops = {0.3, 0.38, 0.45, 0.78};
color[] heightColors;



void colorsTerrain() {
  heightColors = new color[] {
    color(30, 70, 160),    // deep water
    color(220, 205, 140),  // sand
    color(90, 160, 70),    // grass
    color(245, 245, 250)   // snow
  };
  
}

color heightColor(float n) {
  if(n <= heightStops[0]) return heightColors[0];
  for (int i = 1; i < heightStops.length; i++) {
    if (n <= heightStops[i]) {
      float amt = (n - heightStops[i-1]) / (heightStops[i] - heightStops[i-1]);
      return lerpColor(heightColors[i-1], heightColors[i], amt);    
    }
  }
  return heightColors[heightColors.length - 1];
}




void drawTerrain(){
  
  pushMatrix();
  

  rotateX(PI/2.0);
  translate(-w/2, -h/2);
  
  
  float inc = 0.1;
  float yoff = 0;

  for(int y = 0; y < rows; y++){
    float xoff = 0;
    beginShape(TRIANGLE_STRIP);

    for(int x = 0; x < cols; x++){
      float n1 = noise(xoff, yoff);
      float n2 = noise(xoff, yoff + inc);

      float z1 = map(n1, 0, 1, -400, 400);
      float z2 = map(n2, 0, 1, -400, 400);

      fill(heightColor(n1));
      vertex(x * scl, y * scl, z1);
      fill(heightColor(n2));
      vertex(x * scl, (y + 1) * scl, z2);
      
      xoff += inc;
    }
    endShape();
    yoff += inc;
  }
  popMatrix();

}
