/////////// CAM

PVector camPos;
float camYaw = 0;
float camPitch = -0.4;
boolean[] held = new boolean[256];
boolean shiftHeld = false;
int camLastMillis;

void setupCamera(){
  camPos = new PVector(0, 100 ,0);
  camLastMillis = millis();
}

PVector camForward(){
  return new PVector(
    sin(camYaw) * cos(camPitch),
    -sin(camPitch),
    -cos(camYaw) * cos(camPitch)
  );
}

void updateCamera(){
  int now = millis();
  float dt = (now - camLastMillis) / 1000.0;
  camLastMillis = now;

  float speed = 800 * (shiftHeld ? 4 : 1);

  PVector fwd = camForward();
  PVector right = new PVector(cos(camYaw), 0, sin(camYaw));
  PVector move = new PVector();

  if (held['w']) move.add(fwd);
  if (held['s']) move.sub(fwd);
  if (held['d']) move.add(right);
  if (held['a']) move.sub(right);
  if (held['e']) move.y -= 1;
  if (held['q']) move.y += 1;

  if(move.magSq() > 0) {
    move.normalize();
    move.mult(speed * dt);
    camPos.add(move);
  }
}

void applyCamera(){
  PVector f = camForward();
  camera(camPos.x, camPos.y, camPos.z, camPos.x + f.x, camPos.y + f.y, camPos.z + f.z, 0, 1, 0);
  perspective(PI/3.0, (float) width/height, 10, 30000);
}

void keyPressed() {
  if (key == CODED){
    if(keyCode == SHIFT) shiftHeld = true;
  }  
    else{
      int k = Character.toLowerCase(key);
      if(k < 256) held[k] = true;
    }
  }

void keyReleased() {
  if(key == CODED) {
    if(keyCode == SHIFT) shiftHeld = false;
  } else{
    int k = Character.toLowerCase(key);
    if(k < 256) held[k] = false;
  }
}

void mouseDragged() {
  camYaw += (mouseX - pmouseX) * 0.004;
  camPitch -= (mouseY - pmouseY) * 0.004;
  camPitch = constrain(camPitch, -HALF_PI + 0.01, HALF_PI - 0.01);
}
