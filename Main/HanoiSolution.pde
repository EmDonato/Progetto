import java.util.ArrayDeque;


class Tower {
  //classe relativa alla torre, contiene il nome, numero di dischi (numb)
  //pila di dischi (disk), disco in cima (last disk) (3 --> 1 (dal piu piccolo al piu grande))
  int numb;
  char name;
  IntList disk;
  int lastDisk;
  Tower (int n, char c, IntList d) {
    numb = n;
    name = c;
    disk = d;
    if ( disk.size() > 0) lastDisk = disk.get(disk.size()-1);
    else lastDisk = 0;
  }


  void add(int lstd) {
    numb++;
    disk.append(lstd);
    if ( disk.size() > 0) lastDisk = lstd;
    else lastDisk = 0;
  }

  void remove() {
    numb--;
    disk.remove(disk.size()-1);
    if ( disk.size() > 0) lastDisk = disk.get(disk.size()-1);
    else lastDisk = 0;
  }


  void printDisk() {
    int i = 0;
    print("\n\n\n");
    print("contenuto della torre: ", name, "\n");
    for (i = 0; i < disk.size(); i++ ) {
      print(disk.get(i), ',');
    }
    print("\n\n\n");
  }
}

class Move {
  //classe contenente il disco usato 3 --> 1 (dal piu piccolo al piu grande)
  //in source[0] e dest[0] vi è il numero rappresentante la torre A = 1 B = 2 C = 3, rispettivamente  sorgente e destinazione
  //in source[1] e dest[1] vi sono il numero di dischi che contengono le torri
  int[] source;
  int[] dest;
  int disk;
  Move() {
    source = new int[2];
    dest = new int[2];
    disk = 0;
  }


  void fill(char sour, int nSour, char des, int nDest, int d) {
    int aus = 0;
    if (sour == 'A') aus = 1;
    if (sour == 'B') aus = 2;
    if (sour == 'C') aus = 3;
    source[0] = aus ;
    source[1] = nSour;
    if (des == 'A') aus = 1;
    if (des == 'B') aus = 2;
    if (des == 'C') aus = 3;
    dest[0] = aus ;
    dest[1] = nDest;
    disk = d ;
  }



  void printMove() {
    print("\n\n\n");
    print("source :\n", source[0], source[1]);
    print("\n");
    print("disco :\n", disk);
    print("\n");
    print("dest :\n", dest[0], dest[1]);
    print("\n\n\n");
  }
}



ArrayList<Move> HanoiSolution(int NumbDisk) {
  //funzione principale in input il numero di dischi, darne un numero maggiore di tre potrebbe dare un errore
  // output una lista di mosse da fare per risolvere la torre di hanoi


  //inizializzazione
  IntList disks1 = new IntList(); //lista contenente tutti i dischi
  disks1.append(1);
  disks1.append(2);
  disks1.append(3);
  IntList disks2 = new IntList();
  IntList disks3 = new IntList();
  Tower A = new Tower(NumbDisk, 'A', disks1);// la torre A contiene tutti i dishi
  Tower B = new Tower(0, 'B', disks2);
  Tower C = new Tower(0, 'C', disks3);

  //funzione di risoluzione ricorsiva
  Hanoi(NumbDisk, A, C, B);
  return(Moves);
}



void Hanoi(int NumbDisk, Tower source, Tower dest, Tower aux ) {

  // funzione che risolve la torre di hanoi ricorsivamente

  Move m = new Move();
  if (NumbDisk == 1) {
    source.printDisk();
    dest.printDisk();
    m.fill(source.name, source.numb, dest.name, dest.numb + 1, source.lastDisk);
    m.printMove();
    Moves.add(m);
    // print("move disk from",source.name,"to",dest.name);
    dest.add(source.lastDisk);
    source.remove();
    //print("\n");
    //print(source.name,':',source.numb,"\n",aux.name,':',aux.numb,"\n",dest.name,':',dest.numb,"\n");
    //print("\n");
  } else {
    Hanoi(NumbDisk - 1, source, aux, dest);
    source.printDisk();
    dest.printDisk();
    m.fill(source.name, source.numb, dest.name, dest.numb + 1, source.lastDisk);
    m.printMove();
    Moves.add(m);
    //print("move disk from",source.name,"to",dest.name);
    dest.add(source.lastDisk);
    source.remove();
    //print("\n");
    //print(source.name,':',source.numb,"\n",aux.name,':',aux.numb,"\n",dest.name,':',dest.numb,"\n");
    //print("\n");
    Hanoi(NumbDisk - 1, aux, dest, source);
  }
}
