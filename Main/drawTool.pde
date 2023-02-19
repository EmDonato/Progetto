


void drawTraiettoria(float[] d, float[] positions){

  drawPositions(positions);
  push();
  strokeWeight(3);
  fill(255,0,0);
  stroke(255,0,0);
  line(positions[0],positions[1],positions[2],positions[0],positions[1]-d[0],positions[2]);
  line(positions[0],positions[1]-d[0],positions[2],positions[3],positions[1]-d[0],positions[5]);
  line(positions[3],positions[4],positions[5],positions[3],positions[4]-d[1],positions[5]);
  pop();

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


void drawCurrentPosition(float[] p){

  push();
  fill(#EA0000);//rosso source
  translate(p[0], p[1], p[2]);
  sphere(10);
  pop();

}
