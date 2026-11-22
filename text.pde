void drawHUD(){
  hint(DISABLE_DEPTH_TEST);
  String timeString = nf(year, 2) + " " + nf(month, 2) + " " + nf(day, 2) + " " + nf(hour, 2) + " " + nf(min, 2) + " " + nf(sec, 2);
  
  camera();
  noLights();
  fill(0);
  text(nf((float) simulationTime), 10, 20);
  text("Date: " +  timeString, 10, 40);
  text(pace, 10, 60);
  text(camPos.x + " " + -camPos.y + " " + camPos.z, 10, 80);
  hint(ENABLE_DEPTH_TEST);
  
}