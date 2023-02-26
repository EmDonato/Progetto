import peasy.*;
PeasyCam cam;

////Coordinate Palo A (Default: quello a sinistra)
//float posPaloAx=-100.0;
//float posPaloAy= 0.0;
float posPaloAy= 0.0;

////Coordinate Palo B (Default: quello al centro)
//float posPaloBx= 0.0;
//float posPaloBy= 0.0;
float posPaloBy= 0.0;

////Coordinate Palo C (Default: quello a destra)
//float posPaloCx= 100.0;
//float posPaloCy= 0.0;
float posPaloCy= 0.0;



//Parametri linguetta (Il primo è quello che definisce quanto si sporge la linguetta dal disco)
float Linguetta=60.0;
float hLing=2.0;
float LargLing=10.0;

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
float zBaseTrasl = 0.0;

TorreDiHanoi Torre= new TorreDiHanoi(XBASE,YBASE,ZBASE);

void setup() {
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
  smooth(8);
  // Leggere il contenuto del file di testo creato precedentemente
  String[] lines = loadStrings("dati.txt");
  float posPaloAx = float(lines[0]);
  float posPaloAy = float(lines[1]);
  float posPaloBx = float(lines[2]);
  float posPaloBy = float(lines[3]);
  float posPaloCx = float(lines[4]);
  float posPaloCy = float(lines[5]);
  println(posPaloAx);
  println(posPaloAy);
  println(posPaloBx);
  println(posPaloBy);
  println(posPaloCx);
  println(posPaloCy);
  
  // Disegnare sulla finestra di Processing
  background(#979CF5);
}

void draw(){
  background(#979CF5);
  fill(#C99951);
  Torre.DrawTh(xBaseTrasl,yBaseTrasl,zBaseTrasl);
}
