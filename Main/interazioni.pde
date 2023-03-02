void keyPressed() {

  if (key  == 's') {
    show++;
    show = show % 2;
  }

  if (key  == 'e') {
    choose = 1;
  }

  if (key  == 't') {
    choose = 2;
  }

  if (key  == 'c') {
    chooseTower++;
    chooseTower = chooseTower % 2;
    //cam.setActive(true);
  }

  if (key  == 'o') {
    if (oscillo==0) {
      oscillo=1;
    } else {
      oscillo=0;
    }
  }
  if (keyCode==UP) {
    if (XYZ==0 || XYZ==1 || XYZ==2 || XYZ==3) {
      XYZ++;
    }
    if (XYZ==4) {
      XYZ=0;
    }
  }
}

void mousePressed() {

  posiX = mouseX-650;
  posiZ = mouseY - 750/2;

  if ( choosePalo == 0) {
    posPaloAx = posiX;
    posPaloAz = posiZ;
    choosePalo ++;
    choosePalodraw++;
  } else if (choosePalo == 1) {


    float ausZ = 0.0;
    int sign1z = signum(posPaloAz);
    int sign2z = signum(posiZ);
    float ausX = 0.0;
    int sign1x = signum(posPaloAx);
    int sign2x = signum(posiX);


    if (sign1z == sign2z) ausZ = abs(abs(posPaloAz) - abs(posiZ));
    else ausZ = abs(posPaloAz) + abs(posiZ);

    if (sign1x == sign2x) ausX = abs(abs(posPaloAx) - abs(posiX));
    else ausX = abs(posPaloAx) + abs(posiX);


    if ( ausZ  >= RestDiscUNO + RestDiscDUE  || ausX >= RestDiscUNO + RestDiscDUE ) {
      posPaloBx = posiX;
      posPaloBz = posiZ;
      choosePalo ++;
      choosePalodraw++;
    }
  } else if (choosePalo == 2) {

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


    if (sign1zA == sign2zA) ausZA = abs(abs(posPaloAz) - abs(posiZ));
    else ausZA = abs(posPaloAz) + abs(posiZ);

    if (sign1xA == sign2xA) ausXA = abs(abs(posPaloAx) - abs(posiX));
    else ausXA = abs(posPaloAx) + abs(posiX);

    if (sign1zB == sign2zB) ausZB = abs(abs(posPaloBz) - abs(posiZ));
    else ausZB = abs(posPaloBz) + abs(posiZ);

    if (sign1xB == sign2xB) ausXB = abs(abs(posPaloBx) - abs(posiX));
    else ausXB = abs(posPaloBx) + abs(posiX);


    if ( (ausZA  >= RestDiscUNO + RestDiscDUE  || ausXA >= RestDiscUNO + RestDiscDUE) && (ausZB  >= RestDiscUNO + RestDiscDUE  || ausXB >= RestDiscUNO + RestDiscDUE) ) {
      posPaloCx = posiX;
      posPaloCz = posiZ;
      choosePalo ++;
      choosePalodraw = 0;
    }
  }
}
