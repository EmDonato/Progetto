class disco {

  float r;
  float R;
  float h;
  float Llinguette;
  disco( float r1, float r2, float hDisc, float LungLing) {
    r=r1;
    R=r2;
    h=hDisc;
    Llinguette=LungLing;
  }
  void DrawDisco(float Discx, float Discy, float Discz) {

    push();
    translate(Discx, Discy, Discz);
    push();
    rotateX(PI/2);
    cilindroCavo(r, R, h);
    pop();
    push();
    translate(0, 0, (R)+(Linguetta/2));
    box(LargLing, hLing, Llinguette);
    pop();
    pop();
  }
}

//funzione creazione cilindro cavo(raggio maggiore, raggio minore, altezza)
//codice modificato da: https://vormplus.be/full-articles/drawing-a-cylinder-with-processing
void cilindroCavo(float r1, float r2, float h) {
  float sides=30;
  float angle=360/sides;
  float halfHeight=h/2;
  int numPoints = 30;
  float angl = 0;
  float angleStep = 180.0/numPoints;
  float x = 0;
  float y = 0;
  //Tappo inferiore
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= numPoints; i++) {
    float px = x+cos(radians(angl))*r1;
    float py = y+sin(radians(angl))*r1;
    angl += angleStep;
    vertex(px, py, -halfHeight);
    px = x+cos(radians(angl))*r2;
    py = y+sin(radians(angl))*r2;
    vertex(px, py, -halfHeight);
    angl+=angleStep;
  }
  endShape(CLOSE);
  //Tappo superiore
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= numPoints; i++) {
    float px = x+cos(radians(angl))*r1;
    float py = y+sin(radians(angl))*r1;
    angl += angleStep;
    vertex(px, py, halfHeight);
    px = x+cos(radians(angl))*r2;
    py = y+sin(radians(angl))*r2;
    vertex(px, py, halfHeight);
    angl+=angleStep;
  }
  endShape(CLOSE);
  //Cilindro esterno
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<sides+1; i++) {
    float x1=cos(radians(i*angle))*r1;
    float y1=sin(radians(i*angle))*r1;
    float x2=cos(radians(i*angle))*r1;
    float y2=sin(radians(i*angle))*r1;
    vertex(x1, y1, -halfHeight);
    vertex(x2, y2, halfHeight);
  }
  endShape(CLOSE);
  //Cilindro interno
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<sides+1; i++) {
    float x1=cos(radians(i*angle))*r2;
    float y1=sin(radians(i*angle))*r2;
    float x2=cos(radians(i*angle))*r2;
    float y2=sin(radians(i*angle))*r2;
    vertex(x1, y1, -halfHeight);
    vertex(x2, y2, halfHeight);
  }
  endShape(CLOSE);
}


void moveDisk(float[] p, Move M) {


  if (M.disk == 1) {
        print("\n\n\n\n",CurrentPosition[1], UNOyy, "\n\n\n\n");

    UNOxx = p[0];
    UNOyy = p[1];
    UNOzz = p[2]-PosLingUNOz;
  }
  if (M.disk == 2) {
    DUExx = p[0];
    DUEyy = p[1];
    DUEzz = p[2]-PosLingDUEz;
  }
  if (M.disk == 3) {
    
      TRExx = TRExx - 1*(TRExx-p[0]);
      TREyy = TREyy - 1*(TREyy -p[1]);
      TREzz = TREzz - 1*(TREzz - p[2]+PosLingTREz);
    
  }
   else;
}
