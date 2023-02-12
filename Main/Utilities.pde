
float offsetX = 80; // rispetto al centro
float pDisco1 = Lv1Ay;
float pDisco2 = Lv2Ay;
float pDisco3 = Lv3Ay;

float[] position(Move M)
{
  //funzione che restituisce la posizione spaziale {xi,yi,zi,xf,yf,zf};
  M.printMove();
  float[] positions = new float[6];
  float offset = 0.0;
  float xi = 0;
  float xf = 0;
  float yi = 0;
  float yf = 0; 
  
  if(M.disk == 3) offset = RestDiscTRE/2;
  if(M.disk == 2) offset = RestDiscDUE/2;
  if(M.disk == 1) offset = RestDiscUNO/2;
  
  if(M.source[0] == 3) xi = LvCx;
  if(M.source[0] == 2) xi = LvBx;
  if(M.source[0] == 1) xi = LvAx;
  
  if(M.dest[0] == 3) xf = LvCx;
  if(M.dest[0] == 2) xf = LvBx;
  if(M.dest[0] == 1) xf = LvAx;
  
  if(M.source[1] == 3) yi = pDisco3;
  if(M.source[1] == 2) yi = pDisco2;
  if(M.source[1] == 1) yi = pDisco1;
  
  if(M.dest[1] == 3) yf = pDisco3;
  if(M.dest[1] == 2) yf = pDisco2;
  if(M.dest[1] == 1) yf = pDisco1;  
  
  
  
  float zi =  zBaseTrasl + Linguetta;
  float zf =  zBaseTrasl + Linguetta;
  positions[0] = xi;
  positions[1] = yi;
  positions[2] = zi + offset;
  positions[3] = xf; 
  positions[4] = yf;
  positions[5] = zf + offset;
 return(positions);
  
}

void drawPositions(float[] positions){
  push();
  fill(#EA0000);//rosso source
  translate(positions[0], positions[1], positions[2]);
  sphere(6);
  pop();
  push();
  fill(#0050EA);// blue destination
  translate(positions[3], positions[4], positions[5]);
  sphere(6);
  pop();

}
