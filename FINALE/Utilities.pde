
float offsetX = 80; // rispetto al centro
float pDisco1 = 40;
float pDisco2 = 50;
float pDisco3 = 60;

float[] position(Move M)
{
  //funzione che restituisce la posizione spaziale {xi,yi,zi,xf,yf,zf};
  M.printMove();
  float[] positions = new float[6];
  float y = 0.0;
  if(M.disk == 3) y = pDisco1;
  if(M.disk == 2) y = pDisco2;
  if(M.disk == 1) y = pDisco3;
  float xi = 0;
  float xf = 0;
  float yi = y;
  float yf = y;
  float zi = ((M.source[1]-1)*spessore);
  float zf = ((M.dest[1]-1)*spessore);
  if(M.source[0] == 1){xi = -offsetX; }
  if(M.source[0] == 2){xi = 0;  }
  if(M.source[0] == 3){xi = +offsetX;  }
  if(M.dest[0] == 1){xf = -offsetX; }
  if(M.dest[0] == 2){xf = 0;  }
  if(M.dest[0] == 3){xf = +offsetX;  }
  positions[0] = xi;
  positions[1] = yi;
  positions[2] = zi;
  positions[3] = xf; 
  positions[4] = yf;
  positions[5] = zf;
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
