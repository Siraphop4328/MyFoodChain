

color getSkyColorFromTime(){
  float timeOfDay = (hour % 24.0) + (min / 60.0) + (sec / 3600.0);

  int intervals = skyColors.length - 1;
  float segmentLen = 24.0 / intervals;

  int idxA = constrain(floor(timeOfDay / segmentLen), 0, intervals - 1);
  int idxB = idxA + 1;
  float amt = (timeOfDay - idxA * segmentLen) / segmentLen;

  return lerpColor(skyColors[idxA], skyColors[idxB], amt);
}

