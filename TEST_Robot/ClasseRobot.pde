class Robot {
  float x;
  float y;
  float z;
  float q1;
  float q2;
  float q3;
  
  Robot(float giunto1, float giunto2, float giunto3){
    q1=giunto1;
    q2=giunto2;
    q3=giunto3;
  }
  
  void DrawRobot(float Robotx, float Roboty, float Robotz){
    x = Robotx;
    y = Roboty;
    z = Robotz;
    push();
    translate(x,y,z);
    push();
    baseRobot();
    link1R();
    link2R();
    link3P();
    pop();
    pop();
  }
}

void baseRobot(){
  push();
  rotateY(PI/2);
  rotateX(PI/2);
  shape(base);
  pop();
}
void link1R(){
  translate(0,-100,0);//H base Robot
  push();
  rotateX(-PI/2);
  shape(Link1);
  pop();
}
void link2R(){
  translate(100,-30,0);//L1 e altezza link1 Y
  push();
  rotateX(PI/2);
  shape(Link2);
  pop();
}
void link3P(){
  translate(100,0,0);//L2
  push();
  rotateX(PI);
  shape(Link3);
  pop();
}
