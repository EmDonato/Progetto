import peasy.*;
PeasyCam cam;

PShape base;
PShape Link1;
PShape Link2;
PShape Link3;

Robot SCARA = new Robot(0,0,0);
void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  base =loadShape("base.obj");
  Link1=loadShape("link1.obj");
  Link2=loadShape("link2.obj");
  Link3=loadShape("link3.obj");
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
  smooth(8); 
}

void draw(){
  background(#979CF5);
  SCARA.DrawRobot(PI,0,0);
  //shape(base);
  strokeWeight(3);
  push();
  fill(255,0,0);
  stroke(255,0,0);
  line(0,0,0,200,0,0);
  pop();
  push();
  fill(0,255,0);
  stroke(0,255,0);
  line(0,0,0,0,200,0);
  pop();
  push();
  fill(0,0,255);
  stroke(0,0,255);
  line(0,0,0,0,0,200);
  pop();
}
  
