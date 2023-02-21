float HBaseBot=100.0;
float H_L1=30.0;
float L1=100.0;
float L2=130.0;

float rpolso=15.0; //raggio sfera polso

//dimensioni box che rappresenta il polso
float polsoPinzX=20.0;
float polsoPinzY=10.0;
float polsoPinzZ=10.0;

//dimensione box che rappresenta la base della pinza
float basePinzX=10.0;
float basePinzY=10.0;
float basePinzZ=40.0;

//dimensioni dita pinza
float ditapinzX=20.0;
float ditapinzY=10.0;
float ditapinzZ=10.0;

class Robot {
  float x;
  float y;
  float z;
  float q1R;
  float q2R;
  float q3P;
  float q4R;
  
  Robot(float giunto1, float giunto2, float giunto3, float giunto4){
    q1R=giunto1;
    q2R=giunto2;
    q3P=giunto3;
    q4R=giunto4;
  }
  
  void DrawRobot(float Robotx, float Roboty, float Robotz){
    x = Robotx;
    y = Roboty;
    z = Robotz;
    push();
    translate(x,y,z);
    push();
    baseRobot();
    link1R(q1R);
    link2R(q2R);
    link3P(q3P);
    polso(q4R);
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
void link1R(float theta1){
  translate(0,-HBaseBot,0);//H base Robot
  rotateY(theta1);
  push();
  rotateX(-PI/2);
  shape(Link1);
  pop();
}
void link2R(float theta2){
  translate(L1,-H_L1,0);//L1 e altezza link1 Y
  rotateY(theta2);
  push();
  rotateX(PI/2);
  shape(Link2);
  pop();
}
void link3P(float d3){
  translate(L2,0,0);//L2
  translate(0,d3,0);
  push();
  rotateX(PI);
  shape(Link3);
  pop();
}
void polso(float theta4){
  push();
  translate(0,rpolso,0); //di quanto il polso è traslato in giù
  rotateX(theta4);
  push();
  sphere(rpolso);
  push();
  translate(polsoPinzX/2,0,0);
  box(polsoPinzX,polsoPinzY,polsoPinzZ);
  pop();
  translate(polsoPinzX+basePinzX/2,0,0);
  box(basePinzX,basePinzY,basePinzZ);
  push();
  translate((ditapinzX)-(basePinzX/2),0,(basePinzZ/2)-(ditapinzZ/2));
  box(ditapinzX,ditapinzY,ditapinzZ);
  pop();
  push();
  translate((ditapinzX)-(basePinzX/2),0,-(basePinzZ/2)+(ditapinzZ/2));
  box(ditapinzX,ditapinzY,ditapinzZ);
  pop();
  pop();
  pop();
}
