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


void setup() {
  size(1300,750);
  background(#979CF5);
  fill(255,0,0,200);
  rect(650-LrectR/2,375-HrectR/2,LrectR,HrectR);
  fill(#C99951);
  rect(650-Lrect/2,375-Hrect/2,Lrect,Hrect);
  
  
}

void draw(){

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
  
  // Creazione del file e apertura dello stream di scrittura
  String filename = "dati.txt";
  String path = "/Carica_Text/";
  PrintWriter output = createWriter(path + filename);
  

  //// Scrittura delle variabili nel file di testo
  //float xpalo1 = mouseX;
  //float ypalo1 = mouseY;

  output.println(posPaloAx);
  output.println(posPaloAz);
  output.println(posPaloBx);
  output.println(posPaloBz);
  output.println(posPaloCx);
  output.println(posPaloCz);

  // Chiusura dello stream di scrittura
  output.flush();
  output.close();
}
