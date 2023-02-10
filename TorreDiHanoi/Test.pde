import peasy.*;
PeasyCam cam;

// Raggio e altezza dei pali A,B e C
float raggioP=15.0;
float altezzaP=100.0;

//Coordinate Palo A (Default: quello a sinistra)
float posPaloAx=-100.0;
float posPaloAy= 0.0;
float posPaloAz= 0.0;

//Coordinate Palo B (Default: quello al centro)
float posPaloBx= 0.0;
float posPaloBy= 0.0;
float posPaloBz= 0.0;

//Coordinate Palo C (Default: quello a destra)
float posPaloCx= 100.0;
float posPaloCy= 0.0;
float posPaloCz= 0.0;

//Larghezza, altezza e profondità della Base
float XBASE=300.0;
float YBASE=20.0;
float ZBASE=100.0;

TorreDiHanoi Torre= new TorreDiHanoi(XBASE,YBASE,ZBASE);

//Altezza e raggio interno dischi
float HeightDisc=20.0;
float RintDisc=15.0;

//Disco UNO (grande)
float RestDiscUNO=40.0; //Raggio esterno
  disco UNO =  new disco(RintDisc,RestDiscUNO,HeightDisc);

//Coordinate iniziali
  float UNOx=-100.0;
  float UNOy=-YBASE/2-HeightDisc/2;
  float UNOz=0.0;

float RestDiscDUE=30.0; //Raggio esterno

//Disco DUE (medio)
  disco DUE =  new disco(RintDisc,RestDiscDUE,HeightDisc);
  
//Coordinate iniziali 
  float DUEx=-100.0;
  float DUEy=-YBASE/2-(3*HeightDisc)/2;
  float DUEz=0;
  
float RestDiscTRE=20.0; //Raggio esterno

//Disco TRE (piccolo) 
  disco TRE =  new disco(RintDisc,RestDiscTRE,HeightDisc);
  
//Coordinate iniziali
  float TREx=-100.0;
  float TREy=-YBASE/2-(5*HeightDisc)/2;
  float TREz=0;
  
void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
}

void draw(){
  background(#979CF5);
  fill(#C99951);
  push();
  UNO.DrawDisco(UNOx,UNOy,UNOz);
  pop();
  push();
  DUE.DrawDisco(DUEx,DUEy,DUEz);
  pop();
  push();
  TRE.DrawDisco(TREx,TREy,TREz);
  pop();
  push();
  Torre.DrawTh(0,0,0);
  pop();
  //strokeWeight(2);
  //push();
  //fill(255,0,0);
  //stroke(255,0,0);
  //line(0,0,0,200,0,0);
  //pop();
  //push();
  //fill(0,255,0);
  //stroke(0,255,0);
  //line(0,0,0,0,200,0);
  //pop();
  //push();
  //fill(0,0,255);
  //stroke(0,0,255);
  //line(0,0,0,0,0,200);
  //pop();
}
