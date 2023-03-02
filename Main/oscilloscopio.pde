//liste per l'oscilloscopio
FloatList listX;
FloatList listY;
FloatList listZ;


void oscilloscopio() {
  //schermo oscilloscopio
  pushStyle();
  stroke(100);
  fill(#28C668);
  rect(0, 550, 1300, 200);
  stroke(100);
  //scala orizzontal
  fill(100);
  line(0, 700, 1300, 700);
  ;
  text("-200", 630, 718);
  line(0, 650, 1300, 650);
  line(0, 600, 1300, 600);
  text("+200", 626, 596);
  //scala verticale
  line(50, 550, 50, 750);
  line(100, 550, 100, 750);
  line(150, 550, 150, 750);
  line(200, 550, 200, 750);
  line(250, 550, 250, 750);
  line(300, 550, 300, 750);
  line(350, 550, 350, 750);
  line(400, 550, 400, 750);
  line(450, 550, 450, 750);
  line(500, 550, 500, 750);
  line(550, 550, 550, 750);
  line(600, 550, 600, 750);
  line(650, 550, 650, 750);
  line(700, 550, 700, 750);
  line(750, 550, 750, 750);
  line(800, 550, 800, 750);
  line(850, 550, 850, 750);
  line(900, 550, 900, 750);
  line(950, 550, 950, 750);
  line(1000, 550, 1000, 750);
  line(1050, 550, 1050, 750);
  line(1100, 550, 1100, 750);
  line(1150, 550, 1150, 750);
  line(1200, 550, 1200, 750);
  line(1250, 550, 1250, 750);
  line(1300, 550, 1300, 750);
  popStyle();
  pushStyle();
  if (XYZ==0) {
    traspX=255;
    traspY=255;
    traspZ=255;
    textSize(25);
    fill(255, 0, 0);
    text("X", 30, 540);
    fill(0, 255, 0);
    text("Y", 50, 540);
    fill(0, 0, 255);
    text("Z", 70, 540);
  }
  if (XYZ==1) {
    traspX=255;
    traspY=0;
    traspZ=0;
    textSize(25);
    fill(255, 0, 0);
    text("X", 30, 540);
  }
  if (XYZ==2) {
    traspX=0;
    traspY=255;
    traspZ=0;
    textSize(25);
    fill(0, 255, 0);
    text("Y", 50, 540);
  }
  if (XYZ==3) {
    traspX=0;
    traspY=0;
    traspZ=255;
    textSize(25);
    fill(0, 0, 255);
    text("Z", 70, 540);
  }
  popStyle();
  pushStyle();
  strokeWeight(3);

  int scala=4;
  int i=0;

  //valore coordinata x (rosso)
  stroke(255, 0, 0, traspX);
  float preX= CurrentPosition[0]/scala;

  for (i=0; i<1299; i++) {
    float nextX=listX.get(i+1);
    listX.set(i+1, preX);
    line(1300-i, 650-preX, 1299-i, 650-nextX);
    preX=nextX;
  }

  //valore coordinata y (verde)
  stroke(0, 255, 0, traspY);
  float preY= CurrentPosition[1]/scala;

  for (i=0; i<1299; i++) {
    float nextY=listY.get(i+1);
    listY.set(i+1, preY);
    line(1300-i, 650-preY, 1299-i, 650-nextY);
    preY=nextY;
  }

  //valore coordinata Z (blu)
  stroke(0, 0, 255, traspZ);
  float preZ= CurrentPosition[2]/scala;

  for (i=0; i<1299; i++) {
    float nextZ=listZ.get(i+1);
    listZ.set(i+1, preZ);
    line(1300-i, 650-preZ, 1299-i, 650-nextZ);
    preZ=nextZ;
  }
  popStyle();
}
