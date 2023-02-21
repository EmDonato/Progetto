


ArrayList<Move> Moves = new ArrayList<Move>();
Move M;
 
import peasy.*;
PeasyCam cam;



// Raggio e altezza dei pali A,B e C
float raggioP=15.0;
float altezzaP=70.0;

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


//Posizione traslazione base
float xBaseTrasl = 0.0;
float yBaseTrasl = 0;
float zBaseTrasl = -300.0;


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
  
  //Coordinate iniziali punto presa della linguetta
  float PosLingTREx=-100.0;;
  float PosLingTREy=-YBASE/2-(5*HeightDisc)/2;
  float PosLingTREz=(RestDiscTRE/2)+Linguetta;
  
//Coordinate Livello Palo A (Ordinate dal più basso al più alto)
Float LvAx=posPaloAx + xBaseTrasl;   Float Lv1Ay=-YBASE/2-HeightDisc/2 + yBaseTrasl;       Float LvAz=posPaloAz + zBaseTrasl;
                                     Float Lv2Ay=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl; 
                                     Float Lv3Ay=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl; 

//Coordinate Livello Palo B (Ordinate dal più basso al più alto)
Float LvBx=posPaloBx + xBaseTrasl;   Float Lv1By=-YBASE/2-HeightDisc/2 + yBaseTrasl;       Float LvBz=posPaloBz + zBaseTrasl;
                                     Float Lv2By=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl; 
                                     Float Lv3By=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl; 

//Coordinate Livello Palo C (Ordinate dal più basso al più alto)
Float LvCx=posPaloCx + xBaseTrasl;   Float Lv1Cy=-YBASE/2-HeightDisc/2 + yBaseTrasl;       Float LvCz=posPaloCz + zBaseTrasl;
                                     Float Lv2Cy=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl; 
                                     float Lv3Cy=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl; 




// posizioni della mossa
float[] posi;
float[] distt;
float[] CurrentPosition;
//offset di altezza

float hOff = 30;

float i = 0.0;
int j = 0;

int presa = -1;
float[] posi0 = {-100,-25,0,0,0,0};
float[] posic = {0,0,0,0,0,0};

float t = 0.0; //tempo corrente
float tf = 5; // tempo finale
float phi;

// robot

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
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
  smooth(8);
  HanoiSolution(3);
   UNOxx = -100.0;
   UNOyy = -YBASE/2-HeightDisc/2;
   UNOzz = zBaseTrasl;
  
   DUExx=-100.0;
   DUEyy=-YBASE/2-(3*HeightDisc)/2;
   DUEzz= zBaseTrasl;
  
   TRExx=-100.0;
   TREyy=-YBASE/2-(5*HeightDisc)/2;
   TREzz= zBaseTrasl ;
   
    base =loadShape("base.obj");
    Link1=loadShape("link1.obj");
    Link2=loadShape("link2.obj");
    Link3=loadShape("link3.obj");
   
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
  // variabili di giunto 
  q1=q1r;
  q2=q2r; 
  q3=q3r;
  q4=q4r;
  push();
  rotateY(PI/2);
  Robot SCARA = new Robot(q1,q2,q3,q4);
  SCARA.DrawRobot(0,0,0);
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
  
  if(presa == -1){
      M = Moves.get(j);
      posi = startAndFinal(M); 
      // print("\n\n\n\n\n\n",posi[0],posi[1],posi[2],posi[3],posi[4],posi[5],"\n\n\n\n\n\n");
      posi0[3] = posi[0]; posi0[4] = posi[1]; posi0[5] = posi[2];   
       // print(distt[0],distt[1],distt[2],distt[3],distt[4]);
      drawTraiettoriaIniziale(posi0);
      i = minima_energia(t,tf);
      CurrentPosition = traiettoriaIniziale(i, posi0);
      phi = atan2( CurrentPosition[2],-CurrentPosition[0]);
      CinematicaInversa(CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],0);
      delay(2);
      drawCurrentPosition( CurrentPosition);    
      t = t+ 0.01;
      delay(4);
      print("\n\n\n\n\n\n\n\n\n\n",CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],"\n\n\n\n\n\n\n\n\n\n");
      if(i >= 0.99){
        i = 0.0;
        t = 0.0;
        presa = 1;
      } 
  }
  
  
  else if(presa == 1){
      M = Moves.get(j);
      posi = startAndFinal(M); 
      // print("\n\n\n\n\n\n",posi[0],posi[1],posi[2],posi[3],posi[4],posi[5],"\n\n\n\n\n\n");
      posic[0] = posi[3]; posic[1] = posi[4]; posic[2] = posi[5]; 
      distt = distance(posi);
       // print(distt[0],distt[1],distt[2],distt[3],distt[4]);
      drawTraiettoria(distt, posi);
      i = minima_energia(t,tf);
      CurrentPosition = traiettoria(i, distt, posi);
      CinematicaInversa(CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],0);
            print("\n\n\n\n\n\n\n\n\n\n",CurrentPosition[0], CurrentPosition[1],CurrentPosition[2],"\n\n\n\n\n\n\n\n\n\n");

      delay(2);
      drawCurrentPosition( CurrentPosition);
      delay(2);
      moveDisk(CurrentPosition,M);
        t = t+ 0.01;
      delay(2);
      if(i >= 0.99){
        i = 0.0;
        t = 0.0;
         j++;
         presa = 0;
        if(j == 7){
          j = 0;
          
        } }
        
  }
  else if(presa == 0){
          
          M = Moves.get(j);
          posi = startAndFinal(M);
          posic[3] = posi[0]; posic[4] = posi[1]; posic[5] = posi[2]; 
          distt = distance(posic);
       // print(distt[0],distt[1],distt[2],distt[3],distt[4]);
          drawTraiettoria(distt, posic);
          i = minima_energia(t,tf);
          CurrentPosition = traiettoria(i, distt, posic);
          phi = atan2( CurrentPosition[0],CurrentPosition[2]);
          CinematicaInversa(CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],0);
                print("\n\n\n\n\n\n\n\n\n\n",CurrentPosition[0], CurrentPosition[1],CurrentPosition[2],"\n\n\n\n\n\n\n\n\n\n");

          delay(2);
          drawCurrentPosition( CurrentPosition);    
          t = t+ 0.01;
          delay(4);
          if(i >= 0.99){
            i = 0.0;
            t = 0.0;
            presa = 1;
          }
            
  }
  
  
  
  //M = Moves.get(j);
  //posi = startAndFinal(M); 
  // // print("\n\n\n\n\n\n",posi[0],posi[1],posi[2],posi[3],posi[4],posi[5],"\n\n\n\n\n\n");
  //distt = distance(posi);
  // // print(distt[0],distt[1],distt[2],distt[3],distt[4]);
  //drawTraiettoria(distt, posi);
  //CurrentPosition = traiettoria(i, distt, posi);
  //delay(2);
  //drawCurrentPosition( CurrentPosition);
  //delay(2);
  //moveDisk(CurrentPosition,M);
    //CurrentPosition[0] = 0;
    //CurrentPosition[1] = 0;
    //CurrentPosition[2] = 0;

  //i = i+ 0.01;
  //delay(2);
  //if(i >= 1){
  //  i = 0.0;
  //   j++;
  //  if(j == 7){
  //    j = 0;
  //  }
   
  //}

  //print("\n\n",TRExx,TREyy,TREzz);
  
}
