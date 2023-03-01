import peasy.*;

PeasyCam cam;

void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
  smooth(8);
}
  
void draw(){
  background(#979CF5);
  cam.beginHUD();  //Da qui inizi a disattivare la libreria per tutto quello che scrivi dopo
  push();
  fill(0);
  translate(650,375); //RICORDA: hai disattivato anche il posizionamento automatico al centro quindi devi traslare manualmente al centro dello scherm
  text("CIAO EMANUELE!",-300,-300);
  pop();
  cam.endHUD();  //Da qui in poi tutto funziona nuovamente con la libreria 
  box(50,50,50); 
  }
