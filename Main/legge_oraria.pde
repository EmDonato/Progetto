



float minima_energia(float t, float tf){
    float l = 0.0;
    l = (-2/(tf*tf*tf))*t*t*t + (3/(tf*tf))*t*t;
     return(l);
}
