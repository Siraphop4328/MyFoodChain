

void drawTerrain(){
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  noFill();
  float inc = 0.1;
  float yoff = 0;

  for(int y = 0; y < rows; y++){
    float xoff = 0;
    beginShape(TRIANGLE_STRIP);

    for(int x = 0; x < cols; x++){
      float z1 = map(noise(xoff, yoff), 0, 1, -100, 400);
      float z2 = map(noise(xoff, yoff + inc), 0, 1, -100, 400);

      vertex(x * scl, y * scl, z1);
      vertex(x * scl, (y + 1) * scl, z2);
      
      xoff += inc;
    }
    endShape();
    yoff += inc;
  }

}

