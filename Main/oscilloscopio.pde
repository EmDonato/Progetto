//liste per l'oscilloscopio
FloatList listX;
FloatList listY;
FloatList listZ;


void oscilloscopio() {
  //schermo oscilloscopio
  pushStyle();
  stroke(100);
  fill(#28C668);
  rect(0, 450, 1300, 300);
  stroke(100);
  //scala orizzontale
  fill(100);
  line(0, 700, 1300, 700);
  text("-200", 630, 668);
  line(0, 650, 1300, 650);
  pushStyle();
  stroke(0);
  line(0, 600, 1300, 600);
  popStyle();
  line(0, 550, 1300, 550);
  line(0, 500, 1300, 500);
  text("+200", 626, 546);
  //scala verticale
  line(50, 450, 50, 750);
  line(100, 450, 100, 750);
  line(150, 450, 150, 750);
  line(200, 450, 200, 750);
  line(250, 450, 250, 750);
  line(300, 450, 300, 750);
  line(350, 450, 350, 750);
  line(400, 450, 400, 750);
  line(450, 450, 450, 750);
  line(500, 450, 500, 750);
  line(550, 450, 550, 750);
  line(600, 450, 600, 750);
  line(650, 450, 650, 750);
  line(700, 450, 700, 750);
  line(750, 450, 750, 750);
  line(800, 450, 800, 750);
  line(850, 450, 850, 750);
  line(900, 450, 900, 750);
  line(950, 450, 950, 750);
  line(1000, 450, 1000, 750);
  line(1050, 450, 1050, 750);
  line(1100, 450, 1100, 750);
  line(1150, 450, 1150, 750);
  line(1200, 450, 1200, 750);
  line(1250, 450, 1250, 750);
  line(1300, 450, 1300, 750);
  popStyle();
  pushStyle();
  if (XYZ==0) {
    traspX=255;
    traspY=255;
    traspZ=255;
    textSize(25);
    fill(255, 0, 0);
    text("X = ", 1160, 400);text(CurrentPosition[0], 1200, 400);
    fill(0, 255, 0);
    text("Y = ", 1160, 420);text(CurrentPosition[1], 1200, 420);
    fill(0, 0, 255);
    text("Z = ", 1160, 440);text(CurrentPosition[2], 1200, 440);    
  }
  if (XYZ==1) {
    traspX=255;
    traspY=0;
    traspZ=0;
    textSize(25);
    fill(255, 0, 0);
    text("X = ", 1160, 400);text(CurrentPosition[0], 1200, 400);
  }
  if (XYZ==2) {
    traspX=0;
    traspY=255;
    traspZ=0;
    textSize(25);
    fill(0, 255, 0);
    text("Y = ", 1160, 420);text(CurrentPosition[1], 1200, 420);
  }
  if (XYZ==3) {
    traspX=0;
    traspY=0;
    traspZ=255;
    textSize(25);
    fill(0, 0, 255);
    text("Z = ", 1160, 440);text(CurrentPosition[2], 1200, 440);
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
    line(1300-i, 600-preX, 1299-i, 600-nextX);
    preX=nextX;
  }

  //valore coordinata y (verde)
  stroke(0, 255, 0, traspY);
  float preY= CurrentPosition[1]/scala;

  for (i=0; i<1299; i++) {
    float nextY=listY.get(i+1);
    listY.set(i+1, preY);
    line(1300-i, 600-preY, 1299-i, 600-nextY);
    preY=nextY;
  }

  //valore coordinata Z (blu)
  stroke(0, 0, 255, traspZ);
  float preZ= CurrentPosition[2]/scala;

  for (i=0; i<1299; i++) {
    float nextZ=listZ.get(i+1);
    listZ.set(i+1, preZ);
    line(1300-i, 600-preZ, 1299-i, 600-nextZ);
    preZ=nextZ;
  }
  popStyle();
}
