import peasy.*;
PeasyCam cam;

//Coordinate centro base inferiore palo sinistro
float PalAx1;
float PalAx2;
float PalAx3;

//Coordinate centro base inferiore palo centrale
float PalBx1;
float PalBx2;
float PalBx3;

//Coordinate centro base inferiore palo destro
float PalCx1;
float PalCx2;
float PalCx3;

//Coordinate linguetta disco grande
float L_Disc1x;
float L_Disc1y;
float L_Disc1z;

//Coordinate linguetta disco medio
float L_Disc2x;
float L_Disc2y;
float L_Disc2z;

//Coordinate linguetta disco piccolo
float L_Disc3x;
float L_Disc3y;
float L_Disc3z;

//Coordinate posizione iniziale punto della pinza
float pinzIx;
float pinzIy;
float pinzIz;

float Hbase=15.0;
float Hpalo=80.0;

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
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
}

void draw(){
  background(#979CF5);
  push();
  rotateX(PI/2);
  rotateZ(PI/2);
  translate(0,-100,0);
  torreHanoi();
  pop();
  SCARA();
}

//funzione creazione cilindro cavo(raggio maggiore, raggio minore, altezza) 
void cilindroCavo(float r1,float r2,float h){
    float sides=30;
    float angle=360/sides;
    float halfHeight=h/2;
    int numPoints = 30;
    float angl = 0;
    float angleStep = 180.0/numPoints;
    float x = 0;
    float y = 0;
    //Tappo inferiore
    beginShape(TRIANGLE_STRIP); 
    for (int i = 0; i <= numPoints; i++) {
      float px = x+cos(radians(angl))*r1;
      float py = y+sin(radians(angl))*r1;
      angl += angleStep;
      vertex(px, py,-halfHeight);
      px = x+cos(radians(angl))*r2;
      py = y+sin(radians(angl))*r2;
      vertex(px, py,-halfHeight); 
      angl+=angleStep;
  }    
    endShape(CLOSE);
    //Tappo superiore
    beginShape(TRIANGLE_STRIP); 
    for (int i = 0; i <= numPoints; i++) {
      float px = x+cos(radians(angl))*r1;
      float py = y+sin(radians(angl))*r1;
      angl += angleStep;
      vertex(px, py,halfHeight);
      px = x+cos(radians(angl))*r2;
      py = y+sin(radians(angl))*r2;
      vertex(px, py,halfHeight); 
      angl+=angleStep;
  }    
    endShape(CLOSE);
    //Cilindro esterno
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<sides+1; i++) {
        float x1=cos(radians(i*angle))*r1;
        float y1=sin(radians(i*angle))*r1;
        float x2=cos(radians(i*angle))*r1;
        float y2=sin(radians(i*angle))*r1;
        vertex(x1,y1,-halfHeight);
        vertex(x2,y2,halfHeight);    
    }
    endShape(CLOSE);
    //Cilindro interno
     beginShape(TRIANGLE_STRIP);
    for (int i=0; i<sides+1; i++) {
        float x1=cos(radians(i*angle))*r2;
        float y1=sin(radians(i*angle))*r2;
        float x2=cos(radians(i*angle))*r2;
        float y2=sin(radians(i*angle))*r2;
        vertex(x1,y1,-halfHeight);
        vertex(x2,y2,halfHeight);    
    }
    endShape(CLOSE);
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
 //
 void torreHanoi(){
   fill(#C67426);
   base(230,60);
   push();
   translate(-80,0,0);
   disco1();
   translate(0,0,15);
   disco2();
   translate(0,0,15);
   disco3();
   pop();
   palo(-80,0);
   palo(0,0);
   palo(80,0);
 }
 //Per determinare la superfice della base rettangolare lato1-->lato maggiore, lato2-->lato minore
 void base(float lato1, float lato2){
   push();
   translate(0,0,-15);
   box(lato1,lato2,Hbase);
   pop();
 }
 //Input cordinate (x,y) nella superficie della base
 void palo(float Px, float Py){
   push();
   translate(Px,Py,32.5);
   cilindro(8,8,Hpalo);
   pop();
 }
 //disco grande
 void disco1(){
   cilindroCavo(35,10,15);
   push();
   translate(0,45,0);
   box(15,30,1);
   pop();
 }
 //disco medio
 void disco2(){
   cilindroCavo(25,10,15);
   push();
   translate(0,35,0);
   box(15,30,1);
   pop();
 }
 //disco piccolo
 void disco3(){
   cilindroCavo(15,10,15);
   push();
   translate(0,25,0);
   box(15,30,1);
   pop();
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
