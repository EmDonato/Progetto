import peasy.*;


ArrayList<Move> Moves = new ArrayList<Move>();
Move M;

int zoom=500;
PeasyCam cam;

//Variabili di selezione
int choosePalo = 0;
int oscillo=1;
int XYZ=0;
int traspX=255;
int traspY=255;
int traspZ=255;

// Raggio e altezza dei pali A,B e C
float raggioP=15.0;
float altezzaP=70.0;

//Coordinate Palo A (Default: quello a sinistra)
float posPaloAx= 0.0;
float posPaloAy= 0.0;
float posPaloAz= -1000.0;

//Coordinate Palo B (Default: quello al centro)
float posPaloBx= 0.0;
float posPaloBy= 0.0;
float posPaloBz= -1000.0;

//Coordinate Palo C (Default: quello a destra)
float posPaloCx= 0.0;
float posPaloCy= 0.0;
float posPaloCz= -1000.0;

//Larghezza, altezza e profondità della Base
float XBASE=225.0;
float YBASE=10.0;
float ZBASE=125.0;


//Posizione traslazione base
float xBaseTrasl = 0.0;
float yBaseTrasl = 0;
float zBaseTrasl = -350.0;


TorreDiHanoi Torre= new TorreDiHanoi(XBASE, YBASE, ZBASE);

//Altezza, raggio interno dischi e lunghezza linguetta
float HeightDisc=20.0;
float RintDisc=15.0;

//Parametri linguetta (Il primo è quello che definisce quanto si sporge la linguetta dal disco)
float Linguetta=10.0;
float hLing=2.0;
float LargLing=10.0;

//Disco UNO (grande)
float RestDiscUNO=40.0; //Raggio esterno
disco UNO =  new disco(RintDisc, RestDiscUNO, HeightDisc, Linguetta);

//Coordinate iniziali disco UNO (grande)
float UNOxx = 0.0;
float UNOyy = 0.0;
float UNOzz = 0.0;

//Coordinate iniziali punto presa della linguetta
float PosLingUNOx=-100.0;
float PosLingUNOy=-YBASE/2-HeightDisc/2;
float PosLingUNOz=(RestDiscUNO)+Linguetta;

//Disco DUE (medio)
float RestDiscDUE=30.0; //Raggio esterno
disco DUE =  new disco(RintDisc, RestDiscDUE, HeightDisc, Linguetta);

//Coordinate iniziali disco DUE (medio)
float DUExx = 0.0;
float DUEyy = 0.0;
float DUEzz = 0.0;

//Coordinate iniziali punto presa della linguetta
float PosLingDUEx=-100.0;
float PosLingDUEy=-YBASE/2-(3*HeightDisc)/2;
float PosLingDUEz=(RestDiscDUE)+Linguetta;

//Disco TRE (piccolo)
float RestDiscTRE=20.0; //Raggio esterno
disco TRE =  new disco(RintDisc, RestDiscTRE, HeightDisc, Linguetta);

//Coordinate iniziali disco TRE (piccolo)
float TRExx = 0.0;
float TREyy = 0.0;
float TREzz = 0.0;

//Coordinate iniziali punto presa della linguetta
float PosLingTREx=-100.0;
float PosLingTREy=-YBASE/2-(5*HeightDisc)/2;
float PosLingTREz=(RestDiscTRE)+Linguetta;

//Coordinate Livello Palo A (Ordinate dal più basso al più alto)
Float LvAx=posPaloAx + xBaseTrasl;
Float Lv1Ay=-YBASE/2-HeightDisc/2 + yBaseTrasl;
Float LvAz=posPaloAz + zBaseTrasl;
Float Lv2Ay=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl;
Float Lv3Ay=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl;

//Coordinate Livello Palo B (Ordinate dal più basso al più alto)
Float LvBx=posPaloBx + xBaseTrasl;
Float Lv1By=-YBASE/2-HeightDisc/2 + yBaseTrasl;
Float LvBz=posPaloBz + zBaseTrasl;
Float Lv2By=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl;
Float Lv3By=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl;

//Coordinate Livello Palo C (Ordinate dal più basso al più alto)
Float LvCx=posPaloCx + xBaseTrasl;
Float Lv1Cy=-YBASE/2-HeightDisc/2 + yBaseTrasl;
Float LvCz=posPaloCz + zBaseTrasl;
Float Lv2Cy=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl;
float Lv3Cy=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl;

// posizioni della mossa
float[] posi; //posizione di inizio e partenza
float[] distt; //distanze tra destinazione e partenza
float[] CurrentPosition={0, -230.0, -510.0};

//offset di altezza
float hOff = 30;
float i = 0.0; //valore compreso tra 0 e 1 posizione nella traiettoria
int j = 0; //numero di mossa della soluzione della torre 

int show = 0; // variabile per la visualizzazione della traiettoria

int presa = -2;// variabile per la partizione dei compiti del robot

float t = 0.0; //tempo corrente

float phi;

int choose = 0; // scelta inziale tra le due leggi orarie

// robot
PShape base;
PShape Link1;
PShape Link2;
PShape Link3;
PShape Link4;
PShape Link5;
PShape Link6;
PShape dito1;
PShape dito2;

float q1=0.0;
float q2=0.0;
float q3=0.0;
float q4=0.0;
float q5=0.0;


float q5r=0.0;





int ausiliarInitialTrajector = 0;
int ausiliarFinalTrajector = 0;
int chooseTower = 0;
int disabilita_cam = 0;


float posiX = 0.0;
float posiZ = 0.0;


void setup() {

  size(1300, 750, P3D);
  cam = new PeasyCam(this, zoom);
  background(#979CF5);
  //pointLight(51, 102, 126, 140, 160, 144);
  directionalLight(126, 126, 126, 0, 0, 0.7);
  smooth(8);
  HanoiSolution(3);
  UNOxx = posPaloAx;
  UNOyy = -YBASE/2-HeightDisc/2;
  UNOzz = posPaloAz;

  DUExx= posPaloAx;
  DUEyy=-YBASE/2-(3*HeightDisc)/2;
  DUEzz= posPaloAz;

  TRExx= posPaloAx;
  TREyy=-YBASE/2-(5*HeightDisc)/2;
  TREzz= posPaloAz;

  base =loadShape("base1.obj");
  Link1=loadShape("link1_1.obj");
  Link2=loadShape("link2_1.obj");
  Link3=loadShape("link3_1.obj");
  Link4=loadShape("link4.obj");
  Link5=loadShape("link5.obj");
  Link6=loadShape("handbasef.obj");
  dito1=loadShape("ditoup.obj");
  dito2=loadShape("ditodown.obj");
  
  listX = new FloatList();
  listY = new FloatList();
  listZ = new FloatList();

  int i=0;
  for (i=0; i<1300; i++) {
    listX.append(0/4);
    listY.append(-230/4);
    listZ.append(-510/4);
  }
}

void draw() {
  
  if (chooseTower == 0) {

    cam.setActive(false); //disattiva telecamera
    rotateX(-HALF_PI);

    UNOxx = posPaloAx;
    UNOyy = -YBASE/2-HeightDisc/2;
    UNOzz = posPaloAz + zBaseTrasl;

    DUExx= posPaloAx;
    DUEyy=-YBASE/2-(3*HeightDisc)/2;
    DUEzz= posPaloAz + zBaseTrasl;

    TRExx= posPaloAx;
    TREyy=-YBASE/2-(5*HeightDisc)/2;
    TREzz= posPaloAz + zBaseTrasl;

    posiX = mouseX-650;
    posiZ = mouseY - 750/2;

    if ( choosePalo == 0) {
      posPaloAx = posiX;
      posPaloAz = posiZ;
    } else if (choosePalo == 1) {
      posPaloBx = posiX;
      posPaloBz = posiZ;
    } else if (choosePalo == 2) {
      posPaloCx = posiX;
      posPaloCz = posiZ;
      LvAx=posPaloAx + xBaseTrasl;
      LvBx=posPaloBx + xBaseTrasl;
      LvCx=posPaloCx + xBaseTrasl;
      
      LvAz=posPaloAz + zBaseTrasl;
      LvBz=posPaloBz + zBaseTrasl;
      LvCz=posPaloCz + zBaseTrasl;

    }
  } else if (chooseTower == 1) {rotateY(PI/2); cam.setActive(true);//attiva telecamera
}
  background(#979CF5);
  directionalLight(255, 255, 255, 0.5, 0.5, 0.3);

  //Oscilloscopio
  if (chooseTower == 1) {
    if (oscillo==1) {
      cam.beginHUD();
      oscilloscopio();
      cam.endHUD();
    }
  }

  //disegno dischi e torre
  fill(#93500D);
  noStroke();
  push();
  fill(#FF0303);
  if (chooseTower == 1) UNO.DrawDisco(UNOxx, UNOyy, UNOzz);
  pop();
  push();
  fill(#03FF1D);
  if (chooseTower == 1) DUE.DrawDisco(DUExx, DUEyy, DUEzz);
  pop();
  push();
  fill(#1203FF);
  if (chooseTower == 1) TRE.DrawDisco(TRExx, TREyy, TREzz);
  pop();
  push();
  if (chooseTower == 1) Torre.DrawTh(xBaseTrasl, yBaseTrasl, zBaseTrasl);
  else if (chooseTower == 0) Torre.DrawTh(0, 0, 0);
  pop();

  // variabile di giunto
  q5=q5r;
  //disegno robot
  push();
  rotateY(PI/2);
  Robot SCARA = new Robot(q1, q2, q3, q4, q5);
  if (chooseTower == 1) SCARA.DrawRobot(0, 0, 0);

  if (chooseLO != 0) {
    //disegno semaforo
    cam.beginHUD();
    push();
    if (speedP == 0) {
      fill(#120367);//blue
      translate(1200, 75);
      circle(0, 0, 100);
    } else if (speedP != 0 && speedP < speedTheshold) {
      fill(#08CB3E);//verde
      translate(1200, 75);
      circle(0, 0, 100);
    } else if (speedP != 0 && speedP >= speedTheshold) {
      fill(#EA0004);//rosso
      translate(1200, 75);
      circle(0, 0, 100);
    }
    pop();
    cam.endHUD();
  }

  //pop();
  //push();
  //strokeWeight(3);
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
  pop();

  if (presa == -2) {//stato iniziale: attesa della politica
    if (choose == 1) {
      chooseLO = 0;
      presa = -1;
    }
    if (choose == 2) {
      chooseLO = 1;
      presa = -1;
    }
    //scelta della posizione dei pali
    if ( choosePalodraw == 1) {

      push();
      fill(#FF0303, 125);
      translate(posPaloAx, -YBASE/2, posPaloAz);
      rotateX(-HALF_PI);
      
      circle(0, 0, 2*(RestDiscUNO + RestDiscDUE));

      rectMode(CENTER);
      fill(#FF0303, 125);    
      rectMode(CENTER);
      rect(0,posPaloAz,2*offset_spessorePolso,ZBASE);  // disegniamo il rettangolo centrato   
      
       pop();
      
    }


    if ( choosePalodraw == 2) {

      push();
      CinematicaInversa(posi0[0], -posi0[1], posi0[2],0,0);
      fill(#FF0303, 125);
      translate(posPaloAx, -YBASE/2, posPaloAz);
      rotateX(-HALF_PI);
      circle(0, 0, 2*(RestDiscUNO + RestDiscDUE));
      rectMode(CENTER);
      rect(0,posPaloAz,2*offset_spessorePolso,ZBASE);  // disegniamo il rettangolo centrato  
      pop();

      push();
      fill(#3C03FF, 125);
      translate(posPaloBx, -YBASE/2, posPaloBz);
      rotateX(-HALF_PI);
      circle(0, 0, 2*(RestDiscUNO + RestDiscDUE));
      rectMode(CENTER);
      rect(0,posPaloBz,2*offset_spessorePolso,ZBASE);  // disegniamo il rettangolo centrato  
      pop();
    }
  }





  if (presa == -1) {
    // iassegnazione delle mete e partenze
    M = Moves.get(j);
    posi = startAndFinal(M);
    posi0[3] = posi[0];
    posi0[4] = posi[1];
    posi0[5] = posi[2];
    //discriminazione delle politiche
    if (chooseLO == 0)      i = minima_energia(t, tf);
    else                    i = tempo_minimo(t);

    CurrentPosition = traiettoriaIniziale(i, posi0, ausiliarInitialTrajector);
    phi = atan2( CurrentPosition[2], -CurrentPosition[0]);
    CinematicaInversa(CurrentPosition[0], -CurrentPosition[1], CurrentPosition[2], 0, 0);
    
    if (show==1) {
      drawTraiettoriaIniziale(posi0);
      drawCurrentPosition( CurrentPosition);
    }
    t = t+ 0.01; // tempo
    
    if (i >= 1) { //arrivo, assegnare valori inziali
      i = 0.0;
      t = 0.0;
      speedP = 0.0;
      speedN = 0.0;
      l0=0;
      ausiliarInitialTrajector ++;
      if (ausiliarInitialTrajector == 4)
      {
        presa = 2;
      }
    }
  }
  
  
  
  
  
  else if (presa == 2  ) { //giro della mano robotica
    speedP = 0.0;
    speedN = 0.0;
    l0=0;
    q5r = q5r + 0.05*(HALF_PI-q5r);
     if (abs(q5 - HALF_PI)<0.01){
      ditoOffset = ditoOffset + 0.05*(offset_presa-ditoOffset);
      if (abs(ditoOffset - offset_presa)<0.01){
      presa = 1;}
     }  
  }
  
  
  
  
  
  else if (presa == 3 ) {//giro della mano robotica
    speedP = 0.0;
    speedN = 0.0;
    l0=0;
    ditoOffset = ditoOffset + 0.05*(ditoOffsetR-ditoOffset);
    if (abs(ditoOffsetR - ditoOffset)<0.01){
    q5r = q5r + 0.05*(0-q5r);
    if (abs(q5 - 0)<0.01){
      presa = 0;}
     } 
  } 
  
  
  
  
  else if (presa == 1 ) {
    M = Moves.get(j);
    posi = startAndFinal(M);
    posic[0] = posi[3];
    posic[1] = posi[4];
    posic[2] = posi[5];
    distt = distance(posi);
    if (chooseLO == 0)      i = minima_energia(t, tf);
    else                    i = tempo_minimo(t);

    CurrentPosition = traiettoria(i, distt, posi);
    CinematicaInversa(CurrentPosition[0], -CurrentPosition[1], CurrentPosition[2], 0, HALF_PI);
    if (show==1) {

      drawTraiettoria(distt, posi);
      drawCurrentPosition( CurrentPosition);
    }
    
    moveDisk(CurrentPosition, M);
    t = t+ 0.01;
    if (i >= 1) {
      moveDisk(CurrentPosition, M);
      i = 0.0;
      t = 0.0;

      speedP = 0.0;
      speedN = 0.0;
      l0=0;
      j++;
      presa = 3;

      if (j == 7) {
        
        j = 0;
        posif[0] = posic[3];
        posif[1] = posic[4];
        posif[2] = posic[5];
        presa = 4;
      }
    }
  }
  
  
  
  
  
  else if (presa == 0  ) {

    M = Moves.get(j);
    posi = startAndFinal(M);
    posic[3] = posi[0];
    posic[4] = posi[1];
    posic[5] = posi[2];
    distt = distance(posic);

    if (chooseLO == 0)      i = minima_energia(t, tf);
    else                    i = tempo_minimo(t);

    CurrentPosition = traiettoria(i, distt, posic);
    phi = atan2( CurrentPosition[0], CurrentPosition[2]);
    CinematicaInversa(CurrentPosition[0], -CurrentPosition[1], CurrentPosition[2], 0, 0);

    if (show==1) {

      drawTraiettoria(distt, posic);
      drawCurrentPosition( CurrentPosition);
    }
    t = t+ 0.01;
    if (i >= 1) {
      i = 0.0;
      t = 0.0;
      speedP = 0.0;
      speedN = 0.0;
      l0=0;

      presa = 2;
    }
  }
  
  
  
  
  
  else if (presa == 5 ) {


    posif[0] = posi[3];
    posif[1] = posi[4];
    posif[2] = posi[5];

    if (chooseLO == 0)      i = minima_energia(t, tf);
    else                    i = tempo_minimo(t);

    CurrentPosition = traiettoriaFinale(i, posif, ausiliarFinalTrajector);
    phi = atan2( CurrentPosition[2], -CurrentPosition[0]);
    CinematicaInversa(CurrentPosition[0], -CurrentPosition[1], CurrentPosition[2], 0, 0);
    if (show==1) {
      drawTraiettoriaFinale(posif);
      drawCurrentPosition( CurrentPosition);
    }
    t = t+ 0.01;
    if (i >= 0.999) {
      i = 0.0;
      t = 0.0;

      speedP = 0.0;
      speedN = 0.0;
      l0=0;

      ausiliarFinalTrajector ++;
      if (ausiliarFinalTrajector == 3)
      {
        presa = 42;
      }
    }
  } 
  
  
  
  
  
  
  
  
  else if (presa == 4 ) {

    speedP = 0.0;
    speedN = 0.0;
    l0=0;
    ditoOffset = ditoOffset + 0.05*(ditoOffsetR-ditoOffset);
    if (abs(ditoOffsetR - ditoOffset)<0.01){    
    q5r = q5r + 0.05*(0-q5r);
    if (abs(q5 - 0)<0.01){
      presa = 5;}
     } 
  }
  
  
  
  
  else if (presa == 42 ) {
    speedP = 0.0;
    speedN = 0.0;
    l0=0;
  }
}
