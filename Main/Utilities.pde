
float pDisco1 = Lv1Ay;
float pDisco2 = Lv2Ay;
float pDisco3 = Lv3Ay;
float[] dist;
float[] startAndFinal(Move M)
{
  //funzione che restituisce la posizione spaziale {xi,yi,zi,xf,yf,zf};
  //M.printMove();
  float[] positions = new float[6];
  float offset = 0.0;
  float xi = 0;
  float xf = 0;
  float yi = 0;
  float yf = 0;
  float zi = 0;
  float zf = 0;

  if (M.disk == 3) offset = RestDiscTRE;
  if (M.disk == 2) offset = RestDiscDUE;
  if (M.disk == 1) offset = RestDiscUNO;

  if (M.source[0] == 3) xi = LvCx;
  if (M.source[0] == 2) xi = LvBx;
  if (M.source[0] == 1) xi = LvAx;

  if (M.dest[0] == 3) xf = LvCx;
  if (M.dest[0] == 2) xf = LvBx;
  if (M.dest[0] == 1) xf = LvAx;

  if (M.source[0] == 3) zi = LvCz + Linguetta;
  if (M.source[0] == 2) zi = LvBz + Linguetta;
  if (M.source[0] == 1) zi = LvAz + Linguetta;

  if (M.dest[0] == 3) zf = LvCz + Linguetta;
  if (M.dest[0] == 2) zf = LvBz + Linguetta;
  if (M.dest[0] == 1) zf = LvAz + Linguetta;

  if (M.source[1] == 3) yi = pDisco3;
  if (M.source[1] == 2) yi = pDisco2;
  if (M.source[1] == 1) yi = pDisco1;

  if (M.dest[1] == 3) yf = pDisco3;
  if (M.dest[1] == 2) yf = pDisco2;
  if (M.dest[1] == 1) yf = pDisco1;




  positions[0] = xi;
  positions[1] = yi;
  positions[2] = zi + offset;
  positions[3] = xf;
  positions[4] = yf;
  positions[5] = zf + offset;
  return(positions);
}




float[] distance(float[] p) {

  // funzione che misura la distanza tra punto iniziale e finale
  float[] dist = {0, 0, 0, 0, 0}; // 0 -> distanza verticale inizio 1 -> distanza verticale finale 2 -> distanza x 3-> distanza z 4-> pitagora
  dist[0] =  hOff + altezzaP  + YBASE - abs(p[1]);
  dist[1] =  hOff + altezzaP  + YBASE - abs(p[4]);
  dist[2] = (abs(p[0])+abs(p[3]));
  if (p[0] >= 0 && p[3] >= 0 || p[0] <= 0 && p[3] <= 0) dist[2] = (abs(p[0])-abs(p[3]));
  dist[3] = abs(p[2] - p[5]);
  dist[4] = sqrt((dist[2])*(dist[2]) + (dist[3])*(dist[3]));
  return(dist);
  
}



int signum(float f) {
  if (f >= 0) return 1;
  if (f < 0) return -1;
  return 0;
}
