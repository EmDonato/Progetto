


float[] traiettoria(float i,float[] dist, float[] startfinal){

  float[] posizione = { 0, 0, 0 }; // x, y, z
  float d = (dist[0])+ ( dist[1] ) + (dist[4]);
  int aus = 1;
  float dx = 0.0;
  float dz = 0.0;
  float alpha = 0.0;
  int direzione = 1;
  
  if(startfinal[0]<startfinal[3]) direzione = 1;
  else direzione = -1;
  
  if(dist[2] == 0) alpha = 0;
  else if(dist[3] == 0) alpha = PI/2;
  else alpha = atan2(dist[2],dist[3]);
  //print("\n\n\n\n\n\n\n\n\n ",i*d,"\n\n\n\n\n\n\n\n\n ");
  
  
  if(i*d <= dist[0]) aus = 1;
  else if(i*d <= dist[4] + (dist[0]) && i*d > dist[0]) aus = 2;
  else if(i*d <= d && i*d > ( dist[0]) + dist[4]) aus = 3;
  
  if(aus == 1) {
    posizione[0] = startfinal[0];
    posizione[2] = startfinal[2];
    posizione[1] = startfinal[1] - i*d;
  } 
  if(aus == 2) {
    
    dx = sin(alpha)*(i*d - dist[0]);
    dz = cos(alpha)*(i*d - dist[0]);
    posizione[0] = startfinal[0] + direzione*dx; // x
    posizione[2] = startfinal[2] + direzione*dz; // z
    posizione[1] = startfinal[1]-dist[0];  // y
  } 
  if(aus == 3 ){
 
    posizione[0] = startfinal[3];
    posizione[2] = startfinal[5];
    posizione[1] = startfinal[4] + (i*d - d);
  } 
  return(posizione);
}
