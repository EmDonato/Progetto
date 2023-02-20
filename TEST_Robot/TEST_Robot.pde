import peasy.*;
PeasyCam cam;

PShape base;
PShape Link1;
PShape Link2;
PShape Link3;

float q1=0.0;
float q2=0.0;
float q3=0.0;
float q4=0.0;

float q1r=0.0;
float q2r=0.0;
float q3r=0.0;
float q4r=0.0;

float tasto=1;
float TT=-0.02;
float incR=0.5;
float incP=10.0;


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
  
  q1=q1+TT*(q1-q1r);
  q2=q2+TT*(q2-q2r); 
  q3=q3+TT*(q3-q3r);
  q4=q4+TT*(q4-q4r);
  
  Robot SCARA = new Robot(q1,q2,q3,q4);
  SCARA.DrawRobot(0,0,0);
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
  
 void keyPressed(){
   if (keyCode=='1'){ tasto=1;}
   if (keyCode=='2'){ tasto=2;}
   if (keyCode=='3'){ tasto=3;}
   if (keyCode=='4'){ tasto=4;}
   if(keyCode==LEFT){
     if(tasto==1){
       q1r=q1r-incR;
     }
     if(tasto==2){
       q2r=q2r-incR;
     }
     if(tasto==3){
       q3r=q3r-incP;
     }
     if(tasto==4){
       q4r=q4r-incR;
     }
   }
   
   if(keyCode==RIGHT){
     if(tasto==1){
       q1r=q1r+incR;
     }
     if(tasto==2){
       q2r=q2r+incR;
     }
     if(tasto==3){
       q3r=q3r+incP;
     }
     if(tasto==4){
       q4r=q4r+incR;
     }
   }
 }  
