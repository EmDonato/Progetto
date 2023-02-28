class palo {
  float x;
  float y;
  float z;
  float r;
  float h;
  palo(float rPalo, float hPalo ){
    r=rPalo;
    h=hPalo;
  }
  void DrawPalo(float Palox, float Paloy, float Paloz){
    x = Palox;
    y = Paloy;
    z = Paloz;
    push();
    translate(x,y,z);
    rotateX(PI/2);
    fill(#FAC000);
    cilindro(r,h);
    pop();
  }
}

void cilindro(float rPalo,float hPalo){
    float sides=30;; 
    float angle=360/sides;
    float halfHeight=hPalo/2;
    // draw top of the tube
    beginShape();
    for (int i=0; i<sides; i++) {
        float x=cos(radians(i*angle))*rPalo;
        float y=sin(radians(i*angle))*rPalo;
        vertex(x,y,-halfHeight);
    }
    endShape(CLOSE);
    // draw bottom of the tube
    beginShape();
    for (int i=0; i<sides; i++) {
        float x=cos(radians(i*angle))*rPalo;
        float y=sin(radians(i*angle))*rPalo;
        vertex(x,y,halfHeight);
    }
    endShape(CLOSE);
    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<sides+1; i++) {
        float x1=cos(radians(i*angle))*rPalo;
        float y1=sin(radians(i*angle))*rPalo;
        float x2=cos(radians(i*angle))*rPalo;
        float y2=sin(radians(i*angle))*rPalo;
        vertex(x1,y1,-halfHeight);
        vertex(x2,y2,halfHeight);    
    }
    endShape(CLOSE);
}
