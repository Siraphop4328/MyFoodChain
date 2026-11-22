void drawTerrain(){
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  noFill();
  for(int y = 0; y < rows; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      
      vertex(x*scl, y*scl);
      vertex(x*scl, (y+1)*scl);

    }
    endShape();
  }

}