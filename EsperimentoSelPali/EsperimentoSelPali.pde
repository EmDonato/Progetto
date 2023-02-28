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

import peasy.*;
PeasyCam cam;

// Coordinate dell'ultimo click valido
float lastX;
float lastY;

char scena='0';

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
}

void draw(){
  switch(scena){
    case '0':
    cam.beginHUD();
    mousePressed();
    cam.endHUD();
    break;
    case '1':
    background(#979CF5);
    box(100,100,100);
    break;
  }
}

void mousePressed(){
 float xx=mouseX;
 float yy=mouseY;
 
 // Calcolo la distanza tra il nuovo click e l'ultimo click valido
 float d1 = dist(xx, yy, lastX, lastY);
 float d2 = dist(xx, yy, pAx, pAz);
 
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
