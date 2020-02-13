
void keyPressed() {
  if (key == ' ') {
    goBack();
    //currentMove.start();
    //started = true;
    //counter = 0;
  }
  applyMove(key);
}

void applyMove(char move) {
  switch (move) {
  case 'f': 
    //turnZ(1, 1);
    currentMove = allMoves[8];
    deMove.add(9);
    currentMove.start();
    break;
  case 'F': 
    //turnZ(1, -1);
    currentMove = allMoves[9];
    deMove.add(8);
    currentMove.start();
    break;  
  case 'b': 
    //turnZ(-1, -1);
    currentMove = allMoves[11];
    deMove.add(10);
    currentMove.start();
    break;
  case 'B': 
    //turnZ(-1, 1);
    currentMove = allMoves[10];
    deMove.add(11);
    currentMove.start();
    break;
  case 'u': 
    //turnY(1, 1);
    currentMove = allMoves[2];
    deMove.add(3);
    currentMove.start();
    break;
  case 'U': 
    //turnY(1, -1);
    currentMove = allMoves[3];
    deMove.add(2);
    currentMove.start();
    break;
  case 'd': 
    //turnY(-1, 1);
    currentMove = allMoves[1];
    deMove.add(0);
    currentMove.start();
    break;
  case 'D': 
    //turnY(-1, -1);
    currentMove = allMoves[0];
    deMove.add(1);
    currentMove.start();
    break;
  case 'l': 
    //turnX(-1, -1);
    currentMove = allMoves[7];
    deMove.add(6);
    currentMove.start();
    break;
  case 'L': 
    //turnX(-1, 1);
    currentMove = allMoves[6];
    deMove.add(7);
    currentMove.start();
    break;
  case 'r': 
    //turnX(1, 1);
    currentMove = allMoves[4];
    deMove.add(5);
    currentMove.start();
    break;
  case 'R': 
    //turnX(1, -1);
    currentMove = allMoves[5];
    deMove.add(4);
    currentMove.start();
    break;
  }
}
