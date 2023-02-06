import java.util.ArrayDeque;



ArrayList<Move> Moves = new ArrayList<Move>();


class Tower { 
  int numb;
  char name;
  Tower (int n, char c) {  
    numb = n;
    name = c;
  } 
  void add() { 
   numb++;
  } 
  void remove() { 
   numb--;
  } 
} 

class Move { 
  int[] source;
  int[] dest;
  Move() {  
    source = new int[2];
    dest = new int[2];
  } 
  void fill(char sour, int nSour, char des, int nDest) { 
   int aus = 0;
   if(sour == 'A') aus = 1;
   if(sour == 'B') aus = 2;
   if(sour == 'C') aus = 3;
   source[0] = aus ;
   source[1] = nSour;
   if(des == 'A') aus = 1;
   if(des == 'B') aus = 2;
   if(des == 'C') aus = 3; 
   dest[0] = aus ;
   dest[1] = nDest;
   
  } 
  void printMove(){
    
    print("\n\n\n"); 
    print("source :\n",source[0],source[1]); 
    print("\n"); 
    print("dest :\n",dest[0],dest[1]); 
    print("\n\n\n"); 
  
  }
} 



ArrayList<Move> HanoiSolution(int NumbDisk){
  

  Tower A = new Tower(NumbDisk,'A');
  Tower B = new Tower(0,'B');
  Tower C = new Tower(0,'C');
  Hanoi(NumbDisk, A, C, B);
  return(Moves);
}



void Hanoi(int NumbDisk,Tower source,Tower dest,Tower aux ){

  Move m = new Move();
  if(NumbDisk == 1){
    m.fill(source.name,source.numb, dest.name, dest.numb + 1);
    m.printMove();
    Moves.add(m);
    print("move disk from",source.name,"to",dest.name);
    source.remove();
    dest.add();
    print("\n");
    print(source.name,':',source.numb,"\n",aux.name,':',aux.numb,"\n",dest.name,':',dest.numb,"\n");
    print("\n");
  }
  else{
      Hanoi(NumbDisk - 1, source, aux, dest);
      m.fill(source.name,source.numb, dest.name, dest.numb + 1);
      m.printMove();
      Moves.add(m);
      print("move disk from",source.name,"to",dest.name);
      source.remove();
      dest.add();
      print("\n");
      print(source.name,':',source.numb,"\n",aux.name,':',aux.numb,"\n",dest.name,':',dest.numb,"\n");
      print("\n");
      Hanoi(NumbDisk - 1, aux, dest, source);
  }
}
