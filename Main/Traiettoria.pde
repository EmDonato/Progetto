


float[] traiettoria(float i, float[] dist, float[] startfinal) {
  // i posizione corrente // dist vettore delle distanze //startfinel vettore delle posizioni iniziali e finali
  float[] posizione = { 0, 0, 0 }; // x, y, z
  float semiC = HALF_PI * dist[4] ;
  float raggio = dist[4]/2;
  float phi = 0.0;

  float d = (dist[0])+ ( dist[1] ) + (semiC);
  int aus = 1;
  float dx = 0.0;
  float dz = 0.0;
  float dy = 0.0;
  float alpha = 0 ;
  int[] direction = { 0, 0, 0 }; // x, y, z
  if ( startfinal[0] >=0) direction[0] = -1;
  else direction[0] = 1;

  direction[1] = signum(startfinal[4] - startfinal[1]);
  direction[2] = signum(startfinal[5] - startfinal[2]);
  //if(startfinal[0]<startfinal[3]) direzione = 1;
  //else direzione = -1;


  if (dist[2] == 0.0) alpha = 0;
  if (dist[3] == 0.0) alpha = PI/2;
  else alpha = atan2(dist[2], dist[3]);


  //print("\n\n\n\n\n\n\n\n\n ",dist[2], dist[3],alpha,"\n\n\n\n\n\n\n\n\n ");


  if (i*d <= dist[0]) aus = 1;

  else if (i*d <= semiC + (dist[0]) && i*d > dist[0]) {

    aus = 2;
    phi = ((i*d - dist[0])/raggio);
  } else if (i*d <= d && i*d > ( dist[0]) + semiC) aus = 3;

  if (aus == 1) {
    posizione[0] = startfinal[0];
    posizione[2] = startfinal[2];
    posizione[1] = startfinal[1] - i*d;
  }
  if (aus == 2) {

    dx = (raggio-raggio*cos(phi))*sin(alpha); //sin(alpha)// dx = segno_angolo*sin(phi)*sin(alpha)*corda;     dz = segno_angolo*sin(phi)*cos(alpha)*corda;
    dz = (raggio-raggio*cos(phi))*cos(alpha);
    dy = raggio * sin(phi);

    posizione[0] = startfinal[0] + direction[0]*(dx); // x
    posizione[2] = startfinal[2] +  direction[2]*(dz); // z
    posizione[1] = startfinal[1] - dist[0] - 1*dy;  // y
  }
  if (aus == 3 ) {

    posizione[0] = startfinal[3];
    posizione[2] = startfinal[5];
    posizione[1] = startfinal[4] + (i*d - d);
  }
  return(posizione);
}


float[] traiettoriaIniziale(float i, float[] startfinal, int ausiliarInitialTrajector) {

  float[] posizione = { 0, 0, 0 }; // x, y, z
  float[] distance = { 0, 0, 0, 0};  // x, y1, z, y2
  int[] direction = { 0, 0, 0 }; // x, y, z

  float d;

  distance[0] = abs(- abs(startfinal[0]) + abs(posi0[3]));
  distance[1] = abs(- abs(startfinal[1]) + abs(posi0[1]+hOff+ altezzaP + YBASE));
  distance[2] = abs(- abs(startfinal[2]) + abs(posi0[5]));
  distance[3] = abs(+ abs(startfinal[4]) - abs(posi0[1]+hOff+ altezzaP + YBASE));

  if ( ausiliarInitialTrajector == 0) d = distance[1];
  else if ( ausiliarInitialTrajector == 1) d = distance[2];
  else if ( ausiliarInitialTrajector == 2) d = distance[0];
  else d = distance[3];


  direction[0] = signum(startfinal[3] - startfinal[0]);
  direction[1] = signum(startfinal[4] - startfinal[1]);
  direction[2] = signum(startfinal[5] - startfinal[2]);

  if (ausiliarInitialTrajector == 0) {
    posizione[0] = posi0[0]; //x
    posizione[2] = posi0[2];  //z
    posizione[1] = posi0[1] + 1*i*d; // y
  }
  if (ausiliarInitialTrajector == 1) {
    posizione[0] = posi0[0]; //x
    posizione[2] = posi0[2] + direction[2]*i*d;  //z
    posizione[1] = posi0[1] +hOff+ altezzaP + YBASE; // y
  }
  if (ausiliarInitialTrajector == 2) {
    posizione[0] = posi0[0] + direction[0]*i*d; //x
    posizione[2] = posi0[5];  //z
    posizione[1] = posi0[1] +hOff+ altezzaP + YBASE; // y
  }
  if (ausiliarInitialTrajector == 3) {
    posizione[0] = posi0[3]; //x
    posizione[2] = posi0[5];  //z
    posizione[1] = posi0[1] +hOff + altezzaP + YBASE +direction[1]*i*d; // y
  }

  return(posizione);
}


float[] traiettoriaFinale(float i, float[] startfinal, int ausiliarFinalTrajector) {

  float[] posizione = { 0, 0, 0 }; // x, y, z
  float[] distance = { 0, 0, 0, 0};  // x, y1, z, y2
  int[] direction = { 0, 0, 0 }; // x, y, z

  float d;

  distance[0] = abs(- abs(startfinal[0]) + abs(startfinal[3]));
  distance[1] = abs(- abs(startfinal[1]) + abs(startfinal[4]));
  distance[2] = abs(- abs(startfinal[2]) + abs(startfinal[5]));


  if ( ausiliarFinalTrajector == 0) d = distance[1];
  else if ( ausiliarFinalTrajector == 2) d = distance[2];
  else  d = distance[0];


  direction[0] = signum(startfinal[3] - startfinal[0]);
  direction[1] = signum(startfinal[4] - startfinal[1]);
  direction[2] = signum(startfinal[5] - startfinal[2]);

  if (ausiliarFinalTrajector == 0) {
    posizione[0] = startfinal[0]; //x
    posizione[2] = startfinal[2];  //z
    posizione[1] = startfinal[1] + direction[1]*i*d; // y
  }
  if (ausiliarFinalTrajector == 2) {
    posizione[0] = startfinal[3]; //x
    posizione[2] = startfinal[2] + direction[2]*i*d;  //z
    posizione[1] = startfinal[4]; // y
  }
  if (ausiliarFinalTrajector == 1) {
    posizione[0] = startfinal[0] + direction[0]*i*d; //x
    posizione[2] = startfinal[2];  //z
    posizione[1] = startfinal[4]; // y
  }

  return(posizione);
}
