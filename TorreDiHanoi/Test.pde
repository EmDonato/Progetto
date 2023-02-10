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

//Altezza, raggio interno dischi e lunghezza linguetta
float HeightDisc=20.0;
float RintDisc=15.0;

//Parametri linguetta (Il primo è quello che definisce quanto si sporge la linguetta dal disco)
float Linguetta=60.0;
float hLing=2.0;
float LargLing=10.0;

//Disco UNO (grande)
float RestDiscUNO=40.0; //Raggio esterno
  disco UNO =  new disco(RintDisc,RestDiscUNO,HeightDisc,Linguetta);

//Coordinate iniziali disco UNO (grande)
  float UNOx=-100.0;
  float UNOy=-YBASE/2-HeightDisc/2;
  float UNOz=0.0;

  //Coordinate iniziali punto presa della linguetta
  float PosLingUNOx=-100.0;;
  float PosLingUNOy=-YBASE/2-HeightDisc/2;
  float PosLingUNOz=(RestDiscUNO/2)+Linguetta;

//Disco DUE (medio)
float RestDiscDUE=30.0; //Raggio esterno
  disco DUE =  new disco(RintDisc,RestDiscDUE,HeightDisc,Linguetta);
  
//Coordinate iniziali disco DUE (medio)
  float DUEx=-100.0;
  float DUEy=-YBASE/2-(3*HeightDisc)/2;
  float DUEz=0;

  //Coordinate iniziali punto presa della linguetta
  float PosLingDUEx=-100.0;;
  float PosLingDUEy=-YBASE/2-(3*HeightDisc)/2;
  float PosLingDUEz=(RestDiscDUE/2)+Linguetta;
  
//Disco TRE (piccolo) 
float RestDiscTRE=20.0; //Raggio esterno
  disco TRE =  new disco(RintDisc,RestDiscTRE,HeightDisc,Linguetta);
  
//Coordinate iniziali disco TRE (piccolo)
  float TREx=-100.0;
  float TREy=-YBASE/2-(5*HeightDisc)/2;
  float TREz=0;
  
  //Coordinate iniziali punto presa della linguetta
  float PosLingTREx=-100.0;;
  float PosLingTREy=-YBASE/2-(5*HeightDisc)/2;
  float PosLingTREz=(RestDiscTRE/2)+Linguetta;
  
//Coordinate Livello Palo A (Ordinate dal più basso al più alto)
Float Lv1Ax=posPaloAx; Float Lv1Ay=-YBASE/2-HeightDisc/2;     Float Lv1Az=posPaloAz;
Float Lv2Ax=posPaloAx; Float Lv2Ay=-YBASE/2-(3*HeightDisc)/2; Float Lv2Az=posPaloAz;
Float Lv3Ax=posPaloAx; Float Lv3Ay=-YBASE/2-(5*HeightDisc)/2; Float Lv3Az=posPaloAz;

//Coordinate Livello Palo B (Ordinate dal più basso al più alto)
Float Lv1Bx=posPaloBx; Float Lv1By=-YBASE/2-HeightDisc/2;     Float Lv1Bz=posPaloBz;
Float Lv2Bx=posPaloBx; Float Lv2By=-YBASE/2-(3*HeightDisc)/2; Float Lv2Bz=posPaloBz;
Float Lv3Bx=posPaloBx; Float Lv3By=-YBASE/2-(5*HeightDisc)/2; Float Lv3Bz=posPaloBz;

//Coordinate Livello Palo C (Ordinate dal più basso al più alto)
Float Lv1Cx=posPaloCx; Float Lv1Cy=-YBASE/2-HeightDisc/2;     Float Lv1Cz=posPaloCz;
Float Lv2Cx=posPaloCx; Float Lv2Cy=-YBASE/2-(3*HeightDisc)/2; Float Lv2Cz=posPaloCz;
Float Lv3Cx=posPaloCx; float Lv3Cy=-YBASE/2-(5*HeightDisc)/2; Float Lv3Cz=posPaloCz;

void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
  smooth(8);
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
  push();
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
  pop();
}
