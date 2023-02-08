class TorreDiHanoi {
  float x;
  float y;
  float z;
  float LargBase;
  float altBase=20.0;
  float ProfBase;
  
  palo B =  new palo(3,2);
  palo C =  new palo(50,25);
  
  disco UNO =  new disco(50,25,50);
  disco DUE =  new disco(3,1,2);
  disco TRE =  new disco(3,1,2);
  TorreDiHanoi(float Bx, float Bz){
    LargBase=Bx;
    ProfBase=Bz;
  }
  void DrawTh(float Thx, float Thy, float Thz){
    palo A =  new palo(50,25);
    x = Thx;
    y = Thy;
    z = Thz;    
    translate(x,y,z);
    box(LargBase,altBase,ProfBase);
    Draw.A(10,0,0);
    Draw.B(10,0,0);
    Draw.C(10,0,0);
  }
}
