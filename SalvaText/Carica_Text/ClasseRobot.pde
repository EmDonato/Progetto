//Valori noti DH 
float L1=2*130.0;
float D1=2*100.0;
float L2=2*0.0;
float D2=2*130.0;
float L4=2*30.0;
float gomito=1.0;

float HBaseBot=2*100.0;
float H_L1=2*30.0;
float Llink1=2*100.0;
float Llink2=2*130.0;

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
float offsetq3 = -15 ;

float[] posi0 = { 0,-HBaseBot-H_L1-2*offsetq3,-L4-D1-D2,0,0,0}; // posizione iniziale
float[] posif = { 0, 0, 0,0,-HBaseBot-H_L1-2*offsetq3,-L4-D1-D2}; // posizione finale

class Robot {
  float x;
  float y;
  float z;
  float q1R;
  float q2R;
  float q3R;
  float q4R;
  float q5R;
  
  Robot(float giunto1, float giunto2, float giunto3, float giunto4,float giunto5){
    q1R=giunto1;
    q2R=giunto2;
    q3R=giunto3;
    q4R=giunto4;
    q5R=giunto5;
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
    link3P(q3R);
    polso(q4R, q5R);
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
  translate(Llink1,-H_L1,0);//L1 e altezza link1 Y
  rotateY(theta2);
  push();
  rotateX(PI/2);
  shape(Link2);
  //assi();
  pop();
}
void link3P(float d3){
  translate(Llink2,0,0);//L2
  translate(0,d3,0);
  push();
  rotateX(PI);
  shape(Link3);
  //assi();
  pop();
}
void polso(float theta4, float theta5){ //, float theta5
  push();
  translate(0,rpolso,0); //di quanto il polso è traslato in giù
  rotateY(theta4 - HALF_PI);
  push();
  //assi();
  //sphere(rpolso);
  push();
  translate(polsoPinzX/2,0,0);
  push();
  translate(-10,0,-3);
  rotateX(HALF_PI);
  shape(Link4);
  pop();
  translate(-12,-5,-3);
  translate(0,50,0);
  shape(Link5);
  rotateX(PI);
  translate(0,0,25);
  rotateZ(theta5);
  shape(Link6);
  pop();
 
  pop();
  pop();
}

void assi(){
  strokeWeight(3);
  push();
  fill(255,0,0);
  stroke(255,0,0);
  line(0,0,0,200,0,0);
  pop();
  push();
  fill(0,255,0);
  stroke(0,255,0);
  line(0,0,0,0,200,0);
  pop();
  push();
  fill(0,0,255);
  stroke(0,0,255);
  line(0,0,0,0,0,200);
  pop();
}

//void CinematicaInversa(float xf,float yf, float zf, float phi, float rho){
//  float znew = zf+L4;
//  q3r= -yf + Llink1 +rpolso + offsetq3; //-HBaseBot
//  float C2=((znew*znew)+(xf*xf)-((D2+0)*(D2+0))-(D1*D1))/(2*(D2+0)*D1);
//  float S2=gomito*sqrt(1-(C2*C2));
//  q2r=atan2(S2,C2);
//  float C1=znew*(C2*(D2+0)+D1)+xf*(S2*(D2+0));
//  float S1=-znew*(S2*(D2+0))+xf*(C2*(D2+0)+D1);
//  q1r=atan2(S1,C1) + PI;
//  q4r=(phi-q2r-q1r);
//  q5r = rho;
  
//}
