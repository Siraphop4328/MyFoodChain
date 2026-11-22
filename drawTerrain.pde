

void drawTerrain(){
  pushMatrix();
  

  rotateX(PI/2.0);
  translate(-w/2, -h/2);
  
  fill(200);
  float inc = 0.1;
  float yoff = 0;

  for(int y = 0; y < rows; y++){
    float xoff = 0;
    beginShape(TRIANGLE_STRIP);

    for(int x = 0; x < cols; x++){
      float z1 = map(noise(xoff, yoff), 0, 1, -500, 500);
      float z2 = map(noise(xoff, yoff + inc), 0, 1, -500, 500);

      vertex(x * scl, y * scl, z1);
      vertex(x * scl, (y + 1) * scl, z2);
      
      xoff += inc;
    }
    endShape();
    yoff += inc;
  }
  popMatrix();

}
