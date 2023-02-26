import peasy.*;
PeasyCam cam;

PShape base;
PShape Link1;
PShape Link2;
PShape Link3;
PShape Link4;
PShape Link5;
PShape Link6;

////Coordinate Palo A (Default: quello a sinistra)
float posPaloAy= 0.0;

////Coordinate Palo B (Default: quello al centro)
float posPaloBy= 0.0;

////Coordinate Palo C (Default: quello a destra)
float posPaloCy= 0.0;

// Raggio e altezza dei pali A,B e C
float raggioP=15.0;
float altezzaP=70.0;

//Larghezza, altezza e profondità della Base
float XBASE=500.0;
float YBASE=20.0;
float ZBASE=300.0;

//Posizione traslazione base
float xBaseTrasl = 0.0;
float yBaseTrasl = 0.0;
float zBaseTrasl = -400.0;

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
  float UNOxx = 0.0;
  float UNOyy = 0.0;
  float UNOzz = 0.0;

  //Coordinate iniziali punto presa della linguetta
  float PosLingUNOx=-100.0;;
  float PosLingUNOy=-YBASE/2-HeightDisc/2;
  float PosLingUNOz=(RestDiscUNO/2)+Linguetta;
  
//Disco DUE (medio)
float RestDiscDUE=30.0; //Raggio esterno
  disco DUE =  new disco(RintDisc,RestDiscDUE,HeightDisc,Linguetta);
  
//Coordinate iniziali disco DUE (medio)
  float DUExx = 0.0;
  float DUEyy = 0.0;
  float DUEzz = 0.0;

  //Coordinate iniziali punto presa della linguetta
  float PosLingDUEx=-100.0;
  float PosLingDUEy=-YBASE/2-(3*HeightDisc)/2;
  float PosLingDUEz=(RestDiscDUE/2)+Linguetta;
  
//Disco TRE (piccolo) 
float RestDiscTRE=20.0; //Raggio esterno
  disco TRE =  new disco(RintDisc,RestDiscTRE,HeightDisc,Linguetta);
  
//Coordinate iniziali disco TRE (piccolo)
  float TRExx = 0.0;
  float TREyy = 0.0;
  float TREzz = 0.0;

TorreDiHanoi Torre= new TorreDiHanoi(XBASE,YBASE,ZBASE);
float q1=0.0;
float q2=0.0;
float q3=0.0;
float q4=0.0;
float q5=0.0;
void setup() {
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
  smooth(8);
  
  // Leggere il contenuto del file di testo creato precedentemente
  String[] lines = loadStrings("dati.txt");
  float posPaloAx = float(lines[0]);
  float posPaloAz = float(lines[1]);
  float posPaloBx = float(lines[2]);
  float posPaloBz = float(lines[3]);
  float posPaloCx = float(lines[4]);
  float posPaloCz = float(lines[5]);
  
   UNOxx = posPaloAx;
   UNOyy = -YBASE/2-HeightDisc/2;
   UNOzz = zBaseTrasl+posPaloAz;
  
   DUExx= posPaloAx;
   DUEyy=-YBASE/2-(3*HeightDisc)/2;
   DUEzz= zBaseTrasl+posPaloAz;
  
   TRExx=posPaloAx;
   TREyy=-YBASE/2-(5*HeightDisc)/2;
   TREzz= zBaseTrasl+posPaloAz;
   
    Link6=loadShape("hand.obj");
    base =loadShape("base1.obj");
    Link1=loadShape("link1_1.obj");
    Link2=loadShape("link2_1.obj");
    Link3=loadShape("link3_1.obj");
    Link4=loadShape("link4.obj");
    Link5=loadShape("link5.obj");
  
  println(posPaloAx);
  println(posPaloAz);
  println(posPaloBx);
  println(posPaloBz);
  println(posPaloCx);
  println(posPaloCz);
  
  // Disegnare sulla finestra di Processing
  background(#979CF5);
}

void draw(){
  background(#979CF5);
  fill(#C99951);
  push();
  UNO.DrawDisco(UNOxx,UNOyy,UNOzz);
  pop();
  push();
  DUE.DrawDisco(DUExx,DUEyy,DUEzz);
  pop();
  push();
  TRE.DrawDisco(TRExx,TREyy,TREzz);
  pop();
  push();
  Torre.DrawTh(xBaseTrasl,yBaseTrasl,zBaseTrasl);
  pop();
  Torre.DrawTh(xBaseTrasl,yBaseTrasl,zBaseTrasl);push();
  rotateY(PI/2);
  Robot SCARA = new Robot(q1,q2,q3,q4,q5);
  SCARA.DrawRobot(0,0,0);
  pop();
  
}
