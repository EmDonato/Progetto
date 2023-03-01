
int chooseLO = 0; // variabile di scelta sulla legge oraria 0 --> minima energia 1 --> minimo tempo
float A_MAX = 2;
float speedP = 0.0;
float speedN = 0.0;
float speed0 = 0.0;
float l0 = 0.0;
float Tchange = 0.0;
int save = 0;
float speedTheshold;

float minima_energia(float t, float tf){
    float l = 0.0;
    l = (-2/(tf*tf*tf))*t*t*t + (3/(tf*tf))*t*t;
     return(l);
}






float tempo_minimo(float tc){

      float l = 0.0;
      float c ;
      
      c = 1;
      speedTheshold = sqrt( c  * A_MAX  );
      if( speedP <= speedTheshold){
          save = 0;
          speedP =  A_MAX * tc ;
          l = (0.5)*A_MAX * tc * tc;
          l0 = l;
          print("\n\n\n\n\n",speedP,"\n",l,"\n\n\n\n\n");
      } 
      else if(( speedP > speedTheshold)){
          if(save == 0){
              speed0 = speedP;
              Tchange = tc;
              save = 1;
              
        }
          speedN =  -A_MAX * (tc - Tchange) + speed0;
          l = -(0.5)*A_MAX * (tc - Tchange) * (tc - Tchange) + speed0 *(tc - Tchange) + l0;    
          if(l >= 1) l=1;
          print("\n\n\n\n\n",speedN,"\n",l,"\n\n\n\n\n");
      }

      return(l);
}
