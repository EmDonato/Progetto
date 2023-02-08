import peasy.*;
PeasyCam cam;

float Hbase=15.0;
float Hpalo=80.0;

void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 200);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
}

void draw(){
  background(#979CF5);
  torreHanoi();
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
