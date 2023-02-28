import peasy.*;


ArrayList<Move> Moves = new ArrayList<Move>();
Move M;

PeasyCam cam;

int choosePalo = 0;

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
float XBASE=300.0;
float YBASE=20.0;
float ZBASE=150.0;


//Posizione traslazione base
float xBaseTrasl = 0.0;
float yBaseTrasl = 0;
float zBaseTrasl = -350.0;


TorreDiHanoi Torre= new TorreDiHanoi(XBASE,YBASE,ZBASE);

//Altezza, raggio interno dischi e lunghezza linguetta
float HeightDisc=20.0;
float RintDisc=15.0;

//Parametri linguetta (Il primo è quello che definisce quanto si sporge la linguetta dal disco)
float Linguetta=10.0;
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
  float PosLingUNOz=(RestDiscUNO)+Linguetta;

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
  float PosLingDUEz=(RestDiscDUE)+Linguetta;
  
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
  float PosLingTREz=(RestDiscTRE)+Linguetta;
  
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
int show = 0;


int presa = -2;

float[] posic = {0,0,0,0,0,0};

float t = 0.0; //tempo corrente
float tf = 3; // tempo finale
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



float q1=0.0;
float q2=0.0;
float q3=0.0;
float q4=0.0;
float q5=0.0;

float q1r=0.0;
float q2r=0.0;
float q3r=0.0;
float q4r=0.0;
float q5r=0.0;


float tasto=1;
float TT=-0.02;
float incR=0.5;
float incP=10.0;



int ausiliarInitialTrajector = 0;
int ausiliarFinalTrajector = 0;
int chooseTower = 0;
int disabilita_cam = 0;


float posiX = 0.0;
float posiZ = 0.0;


void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  //pointLight(51, 102, 126, 140, 160, 144);
  directionalLight(126,126,126,0,0,0.7);
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
  Link6=loadShape("hand.obj");
  base =loadShape("base1.obj");
  Link1=loadShape("link1_1.obj");
  Link2=loadShape("link2_1.obj");
  Link3=loadShape("link3_1.obj");
  Link4=loadShape("link4.obj");
  Link5=loadShape("link5.obj");
    

}

void draw(){
 if(chooseTower == 0) {
   cam.setActive(false);
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
   
   LvAx=posPaloAx + xBaseTrasl;
   LvBx=posPaloBx + xBaseTrasl;
   LvCx=posPaloCx + xBaseTrasl;
   
   LvAz=posPaloAz + zBaseTrasl;
   LvBz=posPaloBz + zBaseTrasl;
   LvCz=posPaloCz + zBaseTrasl;
   posiX = mouseX-650;
   posiZ = mouseY - 750/2;
  
  if( choosePalo == 0){
    posPaloAx = posiX;
    posPaloAz = posiZ;
  }
  else if(choosePalo == 1){
  
    posPaloBx = posiX;
    posPaloBz = posiZ;
       

  }
  else if(choosePalo == 2){
      posPaloCx = posiX;
      posPaloCz = posiZ;

  } 
   
 }
 else if(chooseTower == 1) cam.setActive(true);
  background(#979CF5);
  directionalLight(255,255,255,0.5,0.5,0.3);
  fill(#93500D);
  noStroke();
  push();
  fill(#FF0303);
  if(chooseTower == 1) UNO.DrawDisco(UNOxx,UNOyy,UNOzz);
  pop();
  push();
  fill(#03FF1D);
  if(chooseTower == 1) DUE.DrawDisco(DUExx,DUEyy,DUEzz);
  pop();
  push();
  fill(#1203FF);
  if(chooseTower == 1) TRE.DrawDisco(TRExx,TREyy,TREzz);
  pop();
  push();
  if(chooseTower == 1) Torre.DrawTh(xBaseTrasl,yBaseTrasl,zBaseTrasl);
  else if(chooseTower == 0) Torre.DrawTh(0,0,0);
  pop();
  // variabili di giunto 
  q1=q1r;
  q2=q2r; 
  q3=q3r;
  q4=q4r;
  q5=q5r;
  push();
  rotateY(PI/2);
  Robot SCARA = new Robot(q1,q2,q3,q4,q5);
  if(chooseTower == 1) SCARA.DrawRobot(0,0,0);

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
  
  if(presa == -2){
  
    if(choose == 1){ chooseLO = 0; presa = -1; }
    if(choose == 2){ chooseLO = 1; presa = -1;}
    
    if( choosePalodraw == 1){
  
    push();
      fill(#FF0303,125);
      translate(posPaloAx, -YBASE/2, posPaloAz);
      rotateX(-HALF_PI);
      circle(0,0, 2*(RestDiscUNO + RestDiscDUE));
    pop();  
    }
    
    
    if( choosePalodraw == 2){
  
    push();
      fill(#FF0303,125);
      translate(posPaloAx, -YBASE/2, posPaloAz);
      rotateX(-HALF_PI);
      circle(0,0, 2*(RestDiscUNO + RestDiscDUE));
    pop();  
  
    push();
      fill(#3C03FF,125);
      translate(posPaloBx, -YBASE/2, posPaloBz);
      rotateX(-HALF_PI);
      circle(0,0, 2*(RestDiscUNO + RestDiscDUE));
    pop();    
  
  
  }
  
  
  }
  
  
  
  
  
  if(presa == -1){
      M = Moves.get(j);
      posi = startAndFinal(M); 
      // print("\n\n\n\n\n\n",posi[0],posi[1],posi[2],posi[3],posi[4],posi[5],"\n\n\n\n\n\n");
      posi0[3] = posi[0]; posi0[4] = posi[1]; posi0[5] = posi[2];   
       // print(distt[0],distt[1],distt[2],distt[3],distt[4]); 
      if (chooseLO == 0)      i = minima_energia(t,tf);
      else                    i = tempo_minimo(t);

      CurrentPosition = traiettoriaIniziale(i, posi0, ausiliarInitialTrajector);
      phi = atan2( CurrentPosition[2],-CurrentPosition[0]);
      CinematicaInversa(CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],0,0);
      if(show==1){
        drawTraiettoriaIniziale(posi0);
        drawCurrentPosition( CurrentPosition); 
      }
      t = t+ 0.01;
      if(i >= 1){
        i = 0.0;
        t = 0.0;
        
        speedP = 0.0;
        speedN = 0.0;
        l0=0;
        
        ausiliarInitialTrajector ++;
        if(ausiliarInitialTrajector == 4) 
        {
          presa = 2;
        }
        
      } 
  }
  
  else if(presa == 2  ){
          speedP = 0.0;
          speedN = 0.0;
          l0=0;
          q5r = q5r + 0.05*(HALF_PI-q5r);
          if(abs(q5 - HALF_PI)<0.01)
          presa = 1;
  
  }
  else if(presa == 3 ){
          speedP = 0.0;
          speedN = 0.0;
          l0=0;  
          q5r = q5r + 0.05*(0-q5r);
          if(abs(q5 - 0)<0.01)
          presa = 0;
  
  }
    
  
  else if(presa == 1 ){
      M = Moves.get(j);
      posi = startAndFinal(M); 
      // print("\n\n\n\n\n\n",posi[0],posi[1],posi[2],posi[3],posi[4],posi[5],"\n\n\n\n\n\n");
      posic[0] = posi[3]; posic[1] = posi[4]; posic[2] = posi[5]; 
      distt = distance(posi);
       // print(distt[0],distt[1],distt[2],distt[3],distt[4]);
      if (chooseLO == 0)      i = minima_energia(t,tf);
      else                    i = tempo_minimo(t);
      
      CurrentPosition = traiettoria(i, distt, posi);
      CinematicaInversa(CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],0,HALF_PI);
          //  print("\n\n\n\n\n\n\n\n\n\n",CurrentPosition[0], CurrentPosition[1],CurrentPosition[2],"\n\n\n\n\n\n\n\n\n\n");

      if(show==1){
       
        drawTraiettoria(distt, posi);
        drawCurrentPosition( CurrentPosition);
        
      }
      moveDisk(CurrentPosition,M);
        t = t+ 0.01;
      if(i >= 1){
        i = 0.0;
        t = 0.0;
        
        speedP = 0.0;
        speedN = 0.0;
        l0=0;        
         j++;
         presa = 3;
         
        if(j == 7){
          print("ciao");
          j = 0;
          
          posif[0] = posic[3]; posif[1] = posic[4]; posif[2] = posic[5]; 
           presa = 4;
          
        } }
        
  }
  else if(presa == 0  ){
          
          M = Moves.get(j);
          posi = startAndFinal(M);
          posic[3] = posi[0]; posic[4] = posi[1]; posic[5] = posi[2]; 
          distt = distance(posic);

          if (chooseLO == 0)      i = minima_energia(t,tf);
          else                    i = tempo_minimo(t);
         
          CurrentPosition = traiettoria(i, distt, posic);
          phi = atan2( CurrentPosition[0],CurrentPosition[2]);
          CinematicaInversa(CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],0,0);
          if(show==1){
           
            drawTraiettoria(distt, posic);
            drawCurrentPosition( CurrentPosition);
            
          }   
          t = t+ 0.01;
          if(i >= 1){
            i = 0.0;
            t = 0.0;
          speedP = 0.0;
          speedN = 0.0;
          l0=0;            
            
            presa = 2;
          }
  } 

    else if(presa == 5 ){
      
      
          posif[0] = posi[3]; posif[1] = posi[4]; posif[2] = posi[5];

          if (chooseLO == 0)      i = minima_energia(t,tf);
          else                    i = tempo_minimo(t);

         CurrentPosition = traiettoriaFinale(i, posif, ausiliarFinalTrajector);
         phi = atan2( CurrentPosition[2],-CurrentPosition[0]);
         CinematicaInversa(CurrentPosition[0], -CurrentPosition[1],CurrentPosition[2],0,0);
         if(show==1){
           drawTraiettoriaFinale(posif);
           drawCurrentPosition( CurrentPosition); 
           }
          t = t+ 0.01;
          if(i >= 0.999){
            i = 0.0;
            t = 0.0;
            
            speedP = 0.0;
            speedN = 0.0;
            l0=0;            
            
            ausiliarFinalTrajector ++;
            if(ausiliarFinalTrajector == 3) 
            {
              presa = 42;
            }
            
          } 
  
  }
     else if(presa == 4 ){
       
          speedP = 0.0;
          speedN = 0.0;
          l0=0;       
               q5r = q5r + 0.05*(0-q5r);
          if(abs(q5 - 0)<0.01)
          presa = 5;}
      else if(presa == 42 ){
          speedP = 0.0;
          speedN = 0.0;
          l0=0;}
}



void keyPressed(){
  if (key  == 's'){
    
    show++;
    show = show % 2;
    
  }
  
    if (key  == 'e'){
      choose = 1;
    
  }
    if (key  == 't'){
    
      choose = 2;
    
  }
  
  
  if (key  == 'c'){
    chooseTower++;
    chooseTower = chooseTower % 2;
    //cam.setActive(true);
    
  }
 
  
}

void mousePressed(){
  
  posiX = mouseX-650;
  posiZ = mouseY - 750/2;
  
  if( choosePalo == 0){
    posPaloAx = posiX;
    posPaloAz = posiZ;
    choosePalo ++;
    choosePalodraw++;
  }
  else if(choosePalo == 1){
    
    
    float ausZ = 0.0;
    int sign1z = signum(posPaloAz);
    int sign2z = signum(posiZ);
    float ausX = 0.0;    
    int sign1x = signum(posPaloAx);
    int sign2x = signum(posiX);
    
    
    if(sign1z == sign2z) ausZ = abs(abs(posPaloAz) - abs(posiZ));
    else ausZ = abs(posPaloAz) + abs(posiZ);

    if(sign1x == sign2x) ausX = abs(abs(posPaloAx) - abs(posiX));
    else ausX = abs(posPaloAx) + abs(posiX);   
    
    
    if( ausZ  >= RestDiscUNO + RestDiscDUE  || ausX >= RestDiscUNO + RestDiscDUE ) {
      posPaloBx = posiX;
      posPaloBz = posiZ;
      choosePalo ++;
      choosePalodraw++;
    }
  }
  else if(choosePalo == 2){

    float ausZA = 0.0;
    int sign1zA = signum(posPaloAz);
    int sign2zA = signum(posiZ);
    float ausXA = 0.0;    
    int sign1xA = signum(posPaloAx);
    int sign2xA = signum(posiX);
    
    float ausZB = 0.0;
    int sign1zB = signum(posPaloBz);
    int sign2zB = signum(posiZ);
    float ausXB = 0.0;    
    int sign1xB = signum(posPaloBx);
    int sign2xB = signum(posiX);
    
    
    if(sign1zA == sign2zA) ausZA = abs(abs(posPaloAz) - abs(posiZ));
    else ausZA = abs(posPaloAz) + abs(posiZ);

    if(sign1xA == sign2xA) ausXA = abs(abs(posPaloAx) - abs(posiX));
    else ausXA = abs(posPaloAx) + abs(posiX);   
    
    if(sign1zB == sign2zB) ausZB = abs(abs(posPaloBz) - abs(posiZ));
    else ausZB = abs(posPaloBz) + abs(posiZ);

    if(sign1xB == sign2xB) ausXB = abs(abs(posPaloBx) - abs(posiX));
    else ausXB = abs(posPaloBx) + abs(posiX);  
    
    
    if( ausZA  >= RestDiscUNO + RestDiscDUE  || ausXA >= RestDiscUNO + RestDiscDUE && ausZB  >= RestDiscUNO + RestDiscDUE  || ausXB >= RestDiscUNO + RestDiscDUE ) {
      posPaloCx = posiX;
      posPaloCz = posiZ;
      choosePalo ++;
      choosePalodraw = 0;
    }    
    
  }
} 
