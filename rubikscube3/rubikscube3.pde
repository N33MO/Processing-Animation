
import peasy.*;

PeasyCam cam;

int dim = 3;
Cubie[] cube = new Cubie[dim*dim*dim];

Move[] allMoves = new Move[] {
  new Move( 0, 1, 0, 1), 
  new Move( 0, 1, 0, -1), 
  new Move( 0, -1, 0, 1), 
  new Move( 0, -1, 0, -1), 
  new Move( 1, 0, 0, 1), 
  new Move( 1, 0, 0, -1), 
  new Move(-1, 0, 0, 1), 
  new Move(-1, 0, 0, -1), 
  new Move( 0, 0, 1, 1), 
  new Move( 0, 0, 1, -1), 
  new Move( 0, 0, -1, 1), 
  new Move( 0, 0, -1, -1)
};
ArrayList<Move> sequence = new ArrayList<Move>();
//ArrayList<Move> deMove = new ArrayList<Move>();
ArrayList<Integer> deMove = new ArrayList<Integer>();
int counter = 0;
int cnt = 0;

boolean started = false;

Move currentMove;
Move goBack;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
  //cube[0].c = color(255, 0, 0);
  //cube[2].c = color(0, 0, 255);

  for (int i = 0; i < 1; i++) {
    int r = int(random(allMoves.length));
    Move m = allMoves[r];
    sequence.add(m);
  }

  currentMove = sequence.get(counter);

  //for (int i = sequence.length()-1; i >= 0; i--) {
  //  String nextMove = flipCase(sequence.charAt(i));
  //  sequence += nextMove;
  //}
  
}

//String flipCase(char c) {
//  String s = "" + c;
//  if (s.equals(s.toLowerCase())) {
//    return s.toUpperCase();
//  } else {
//    return s.toLowerCase();
//  }
//}




void draw() {
  background(51); 
  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);

  currentMove.update();
  if (currentMove.finished()) {
    if (counter < sequence.size()-1) {
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
  }
  

  //if (started) {
  //  if (frameCount % 1 == 0) {
  //    if (counter < sequence.length()) {
  //      char move = sequence.charAt(counter);
  //      applyMove(move);
  //      counter++;
  //    }
  //  }
  //}

  scale(50);
  for (int i = 0; i < cube.length; i++) {
    push();
    if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
      rotateZ(currentMove.angle);
    } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
      rotateX(currentMove.angle);
    } else if (abs(cube[i].y) > 0 && cube[i].y == currentMove.y) {
      rotateY(-currentMove.angle);
    }
    cube[i].show();
    pop();
  }
}