import peasy.*;
PeasyCam cam;

palo A =  new palo(50,25);
palo B =  new palo(3,2);
disco UNO =  new disco(50,25,50);
disco DUE =  new disco(3,1,2);

void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
}

void draw(){
  background(#979CF5);
  push();
  A.Draw(0,0,0);
  B.Draw(50,70,10);
  UNO.Draw(0,50,0);
  DUE.Draw(100,70,10);
  pop();
  strokeWeight(2);
  push();
  fill(255,0,0);
  stroke(255,0,0);
  line(0,0,0,20,0,0);
  pop();
  push();
  fill(0,255,0);
  stroke(0,255,0);
  line(0,0,0,0,20,0);
  pop();
  push();
  fill(0,0,255);
  stroke(0,0,255);
  line(0,0,0,0,0,20);
  pop();
}
