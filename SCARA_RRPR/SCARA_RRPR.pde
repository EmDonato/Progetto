//import peasy.*;
//PeasyCam cam;

float q1r=PI;
float q2r=0.0;
float q3r=100.0;
float q4r=(3*PI)/2;

float tasto=1;
float TT=-0.02;
float incR=0.5;
float incP=10.0;
float Pinz=30.0;

//Parametri link1
float q1=PI;
float L1=100.0;
float alph1=0.0;
float D1=100.0;

//Parametri link2
float q2=0.0;
float L2=100.0;
float alph2=0.0;
float D2=100.0;

//Parametri link3
float th3=0.0;
float q3=100.0;
float alph3=0.0;
float D3=0.0;

//Parametri polso R
float th4=-PI/2;
float L4=0.0;
float q4=(3*PI)/2;
float D4=0.0;

void setup(){
  size(1300,750,P3D);
  //cam = new PeasyCam(this, 400);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
}

 void draw(){
   background(#979CF5);
   translate(650,375);
   
   q1=q1+TT*(q1-q1r);
   q2=q2+TT*(q2-q2r); 
   q3=q3+TT*(q3-q3r);
   q4=q4+TT*(q4-q4r);
   
   SCARA();
 }
 
//funzione creazione cilindri
void cilindro(float r1,float r2,float h){
    int sides=30;
    float angle=360/sides;
    float halfHeight=h/2;
    // draw top of the tube
    beginShape();
    for (int i=0; i<sides; i++) {
        float x=cos(radians(i*angle))*r1;
        float y=sin(radians(i*angle))*r1;
        vertex(x,y,-halfHeight);
    }
    endShape(CLOSE);
    // draw bottom of the tube
    beginShape();
    for (int i=0; i<sides; i++) {
        float x=cos(radians(i*angle))*r2;
        float y=sin(radians(i*angle))*r2;
        vertex(x,y,halfHeight);
    }
    endShape(CLOSE);
    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<sides+1; i++) {
        float x1=cos(radians(i*angle))*r1;
        float y1=sin(radians(i*angle))*r1;
        float x2=cos(radians(i*angle))*r2;
        float y2=sin(radians(i*angle))*r2;
        vertex(x1,y1,-halfHeight);
        vertex(x2,y2,halfHeight);    
    }
    endShape(CLOSE);
}

void base(){
  fill(100);
  push();
  translate(0,10,0);
  box(80,20,80);
  pop();
  push();
  translate(0,20,0);
  box(100,20,100);
  pop();
}

//link rotoidale
void linkR(float theta, float d, float alpha, float a){  
  rotateY(theta);
  push();
  fill(100);
  strokeWeight(0.5);
  sphere(25);
  pop();
  translate(0,-d/2,0);
  push();
  rotateX(PI/2);
  cilindro(16,16,d);
  pop();
  translate(0,-d/2,0);
  rotateX(alpha);
  push();
  fill(100);
  strokeWeight(0.5);
  sphere(25);
  pop();
  translate(-a/2,0,0);
  push();
  rotateY(PI/2);
  cilindro(15,15,a);
  pop();
  translate(-a/2,0,0);
}

//link prismatico
void linkP(float theta, float d, float alpha, float a){ 
  rotateY(theta);
  push();
  fill(100);
  box(50,50,50);
  pop();
  translate(0,d/2,0);
  push();
  rotateX(PI/2);
  cilindro(16,16,d);
  pop();
  translate(0,d/2,0);
  rotateX(alpha);
  translate(-a/2,0,0);
  push();
  rotateY(PI/2);
  cilindro(15,15,a);
  pop();
  translate(-a/2,0,0);
}

 void polso(){
   linkR(th4,L4,q4,D4);
   pinza();
 }
 
 void pinza(){
   fill(100);
   push();
   translate(0,0,20);
   cilindro(24,12.5,25);
   pop();
   push();
   translate(0,0,35);
   box(20,70,10);
   translate(0,0,25);
   push();
   translate(0,-Pinz,0);
   box(20,10,40);
   pop();
   push();
   translate(0,Pinz,0);
   box(20,10,40);
   pop();
   pop();
   
 }
 
 void SCARA(){
   base();
   linkR(q1,L1,alph1,D1);
   linkR(q2,L2,alph2,D2);
   linkP(th3,q3,alph3,D3);
   polso();
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
   
   if(keyCode==UP){
     if(Pinz<30){Pinz+=1;}
   }
   if(keyCode==DOWN){
     if(Pinz>5){Pinz-=1;}
   }
 }
 
