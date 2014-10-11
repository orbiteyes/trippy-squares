import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float value; 
int circle_color;
int counter;

void setup(){
  size(800,800);
  frameRate(30);
  /* start oscP5, listening for incoming messages at port 8080 */
  oscP5 = new OscP5(this,8080);
  
}
void draw(){
  if (counter == 0) {
    background(0);
    stroke(255);
  }
  else if (counter % 9 == 0) {
    background(234,232,117);
    stroke(36,16,110);
  }
  else if (counter % 8 == 0) {
    background(36,16,110);
    stroke(234,232,117);
  }
  else if (counter % 4 == 0) {
    background(255);
    stroke(0);
  }
  else {
    background(0);
    stroke(255);
  }
  smooth(8);
  fill(50,150);
  strokeWeight(6);
  noFill();
  rectMode(CENTER);
  for(int i = 0; i < 5; i++) {
    for(int k = 0; k < 5; k++) {
      rect(100 + i*200, 100 + k*200, value *3, value *3);
    }
  }
}


void oscEvent(OscMessage theOscMessage){
  
  if(theOscMessage.checkAddrPattern("/varX") == true){
    value = theOscMessage.get(0).floatValue();
    println(value);
    if (value > 0.0) {
      counter++;
    }
  }
}
