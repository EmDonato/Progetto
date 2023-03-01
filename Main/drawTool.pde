int choosePalodraw = 0;


void drawTraiettoria(float[] d, float[] positions){

  int segnoZ = 1;
  float alpha = 0.0;
  int segno = 1;
  int segno1 = 1;

  alpha = atan2(d[2],d[3]);
 
  segno = signum(positions[3] - positions[0]);
 // segno1 = signum(abs(positions[2]) - abs(positions[5]));
  if( positions[0] <= 0 && positions[3] <=0 ){
    if(positions[0] > positions[3]){
        if(abs(positions[5]) - abs(positions[2]) > 0){
          segno1 = -1;
          segnoZ = -1;
        }
        
        if(abs(positions[5]) - abs(positions[2]) <=   0){
          segno1 = 1;
          segnoZ = -1;
        }      
    }
     if(positions[0] <= positions[3]){
      if(abs(positions[5]) - abs(positions[2]) > 0){
        segno1 = 1;
        segnoZ = 1;
      }
      
      if(abs(positions[5]) - abs(positions[2]) <=   0){
        segno1 = -1;
        segnoZ = 1;
      }      
    }
 
  
  }
  if( positions[0] <= 0 && positions[3] >0 ){
      if(positions[0] > positions[3]){
            if(abs(positions[5]) - abs(positions[2]) > 0){
              segno1 = -1;
              segnoZ = -1;
            }
            
            if(abs(positions[5]) - abs(positions[2]) <=   0){
              segno1 = 1;
              segnoZ = -1;
            }      
        }
         if(positions[0] <= positions[3]){
          if(abs(positions[5]) - abs(positions[2]) > 0){
            segno1 = 1;
            segnoZ = 1;
          }
          
          if(abs(positions[5]) - abs(positions[2]) <=   0){
            segno1 = -1;
            segnoZ = 1;
          }      
        }
      
  } 
  
  if( positions[0] > 0 && positions[3] >0 ){
  
     if(positions[0] > positions[3]){
        if(abs(positions[5]) - abs(positions[2]) > 0){
          segno1 = -1;
          segnoZ = 1;
        }
        
        if(abs(positions[5]) - abs(positions[2]) <=   0){
          segno1 = 1;
          segnoZ = 1;
        }      
    }
     if(positions[0] <= positions[3]){
      if(abs(positions[5]) - abs(positions[2]) > 0){
        segno1 = 1;
        segnoZ = -1;
      }
      
      if(abs(positions[5]) - abs(positions[2]) <=   0){
        segno1 = -1;
        segnoZ = -1;
      }      
    }
    
  
  } 
  if( positions[3] <= 0 && positions[0] >0 ){
  if(positions[0] > positions[3]){
        if(abs(positions[5]) - abs(positions[2]) > 0){
          segno1 = -1;
          segnoZ = 1;
          print("\n\n\n\n\nciao\n\n\n\n\n\n");
        }
        
        if(abs(positions[5]) - abs(positions[2]) <=   0){
          segno1 = 1;
          segnoZ = 1;
          print("\n\n\n\n\nciao1\n\n\n\n\n\n");
        }      
    }
     if(positions[0] <= positions[3]){
      if(abs(positions[5]) - abs(positions[2]) > 0){
        segno1 = -1;
        segnoZ = -1;
        print("\n\n\n\n\nciao2\n\n\n\n\n\n");
      }
      
      if(abs(positions[5]) - abs(positions[2]) <=   0){
        segno1 = 1;
        segnoZ = -1;
        print("\n\n\n\n\nciao3\n\n\n\n\n\n");
      }      
    }
    
  
  } 
  //if(positions[0] > positions[3]){
  //  if(abs(positions[5]) - abs(positions[2]) > 0){
  //    segno1 = -1;
  //  }

  //}
 
  //if(positions[0] < positions[3]){
  //  if(abs(positions[5]) - abs(positions[2]) < 0){
  //    segno1 = -1;
  //  }
  //      if(positions[2] < positions[5]){
  //    segnoZ = -1;}
  //      if(positions[2] >= positions[5]){
  //    segnoZ = 1;}

  //}  
  
  
  
  
  drawPositions(positions);
  push();
  strokeWeight(3);
  fill(255,0,0);
  stroke(255,0,0);
  line(positions[0],positions[1],positions[2],positions[0],positions[1]-d[0],positions[2]);  
  push();
  noFill();
  
  translate(positions[0],positions[1]-d[0],positions[2]);
  rotateY(segno1*(-segnoZ*alpha + PI/2));
  translate(segno* sqrt(sq(d[2]/2) + sq(d[3]/2)),0,0);
  arc(0, 0, d[4], d[4], -PI, 0);
  pop();
  
  line(positions[3],positions[4],positions[5],positions[3],positions[4]-d[1],positions[5]);
  pop();

}


void drawTraiettoriaFinale(float[] positions){

  drawPositions(positions);
  push();
  strokeWeight(3);
  fill(255,0,0);
  stroke(255,0,0);
  line(positions[0],positions[1],positions[2],positions[0],positions[4],positions[2]);
  line(positions[0],positions[4],positions[2],positions[3],positions[4],positions[2]);
  line(positions[3],positions[4],positions[2],positions[3],positions[4],positions[5]);

  pop();

}

void drawTraiettoriaIniziale(float[] positions){

  drawPositions(positions);
  push();
  strokeWeight(3);
  fill(255,0,0);
  stroke(255,0,0);
  line(positions[0],positions[1],positions[2],positions[0],positions[1]+hOff+ altezzaP + YBASE,positions[2]);
  line(positions[0],positions[1]+hOff+ altezzaP + YBASE,positions[2],positions[0],positions[1] +hOff+ altezzaP + YBASE,positions[5]);
  line(positions[0],positions[1] +hOff+ altezzaP + YBASE,positions[5],positions[3],positions[1] +hOff+ altezzaP + YBASE,positions[5]);
  line(positions[3],positions[1] +hOff+ altezzaP + YBASE,positions[5],positions[3],positions[4],positions[5]);
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
  sphere(3);
  pop();

}
