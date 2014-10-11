import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float value; 
int circle_color;
int counter;

void setup(){
  size(400,400);
  frameRate(30);
  /* start oscP5, listening for incoming messages at port 8080 */
  oscP5 = new OscP5(this,8080);
  
}
void draw(){
  if (counter % 4 == 0) {
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
  rect(300,300, value *3, value *3);
  rect(100,300, value *3, value *3);
  rect(100,100, value *3, value *3);
  rect(300,100, value *3, value *3);
  counter = counter++;
}


void oscEvent(OscMessage theOscMessage){
  
  if(theOscMessage.checkAddrPattern("/varX") == true){
    value = theOscMessage.get(0).floatValue();
    println(value);
  }
}

