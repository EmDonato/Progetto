class TorreDiHanoi {
  float x;
  float y;
  float z;
  float LargBase;
  float AltBase;
  float ProfBase;
  
  palo B =  new palo(raggioP,altezzaP);
  palo C =  new palo(raggioP,altezzaP);
  palo A =  new palo(raggioP,altezzaP);
  
  TorreDiHanoi(float Bx, float By, float Bz){
    LargBase=Bx;
    AltBase=By;
    ProfBase=Bz;
  }
  void DrawTh(float Thx, float Thy, float Thz){
  String[] lines = loadStrings("dati.txt");
  float posPaloAx = float(lines[0]);
  float posPaloAz = float(lines[1]);
  float posPaloBx = float(lines[2]);
  float posPaloBz = float(lines[3]);
  float posPaloCx = float(lines[4]);
  float posPaloCz = float(lines[5]);
    x = Thx;
    y = Thy;
    z = Thz;
    push();
    translate(x,y,z);
    box(LargBase,AltBase,ProfBase);
    translate(0,-(altezzaP/2)-(AltBase/2),0);
    A.DrawPalo(posPaloAx,posPaloAy,posPaloAz);
    B.DrawPalo(posPaloBx,posPaloBy,posPaloBz);
    C.DrawPalo(posPaloCx,posPaloCy,posPaloCz);
    pop();
  }
}
