void theStartOfTime(){

int now = millis();
  double dt = (now - lastMillis) / 1000.0;
  lastMillis = now;
  

  simulationTime += dt * pace;

  totalSec = (long) Math.floor(simulationTime);

  year = (int) totalSec / 31104000;
  month = (int) (totalSec % 31104000) / 2592000;
  day = (int) (totalSec % 2592000) / 86400;
  hour = (int) (totalSec % 86400) / 3600;
  min = (int) (totalSec % 3600) / 60;
  sec = (int) totalSec % 60;

  

  
 
  

  
}

