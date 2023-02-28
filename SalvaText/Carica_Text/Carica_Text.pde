import peasy.*;
PeasyCam cam;

//Rettangolo esterno
float HrectR=300.0;
float LrectR=500.0;

//rettangolo interno
float Hrect=220.0;
float Lrect=420.0;

float posPaloAx=0.0;
float posPaloAz=0.0;
float posPaloBx=0.0;
float posPaloBz=0.0;
float posPaloCx=0.0;
float posPaloCz=0.0;

float pAx=0.0;
float pAz=0.0;

int NClick=0;

// Coordinate dell'ultimo click valido
float lastX;
float lastY;

char scena='0';

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
    if(scena=='0'){
      fill(255,0,0,200);
      rect(0-LrectR/2,0-HrectR/2,LrectR,HrectR);
      fill(#C99951);
      rect(0-Lrect/2,0-Hrect/2,Lrect,Hrect);
  }
  directionalLight(126,126,126,0,0,0.7);
  smooth(8);
  
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
}

void draw(){
    switch(scena){
      case '0':
      break;
      case '1':
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
      break;
  }
}

void mouseReleased(){
 float xx=mouseX;
 float yy=mouseY;
 
 // Calcolo la distanza tra il nuovo click e l'ultimo click valido
 float d1 = dist(xx, yy, lastX, lastY);
 float d2 = dist(xx, yy, pAx, pAz);
 cam.beginHUD();
  if(NClick<3){
    if((xx>=(0+(1300-Lrect)/2) && xx<=(1300-(1300-Lrect)/2))&&(yy>=(0+(750-Hrect)/2) && yy<=(750-(750-Hrect)/2))){
      if (d1 >= 80 && d2 >=80) {
      // Aggiorno le coordinate dell'ultimo click valido
        lastX = xx;
        lastY = yy;
        NClick++;
        push();
        fill(255,0,0,200);
        circle(xx,yy,80);
        fill(0,255,0);
        circle(xx,yy,30);
        fill(0);
        strokeWeight(4);
        point(xx,yy);
        pop();
        if(NClick==1){pAx=mouseX;pAz=mouseY;posPaloAx=mouseX-650;posPaloAz=mouseY-375;}
        if(NClick==2){posPaloBx=mouseX-650;posPaloBz=mouseY-375;}
        if(NClick==3){posPaloCx=mouseX-650;posPaloCz=mouseY-375;}
      }
    }
  }
  cam.endHUD();
  println(posPaloAx);
  println(posPaloAz);
  println(posPaloBx);
  println(posPaloBz);
  println(posPaloCx);
  println(posPaloCz);
}

void keyPressed(){
  if(key=='a'){scena='1';}

}
