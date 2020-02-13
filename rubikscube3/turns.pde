void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
      qb.turnFacesZ(dir);
    }
  }
}

void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.update(round(matrix.m02), qb.y, round(matrix.m12));
      qb.turnFacesY(dir);
    }
  }
}

void turnX(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y, qb.z);
      qb.update(qb.x, round(matrix.m02), round(matrix.m12));
      qb.turnFacesX(dir);
    }
  }
}


void goBack() {
  cnt = deMove.size();
  cnt--;
  for (int i = cnt; i >= 0; i--) {
    switch(deMove.get(i))
    {
      case 0:
      turnY(1, 1);
      break;
      case 1:
      turnY(1, -1);
      break;
      case 2:
      turnY(-1, 1);
      break;
      case 3:
      turnY(-1, -1);
      break;
      case 4:
      turnX(1, 1);
      break;
      case 5:
      turnX(1, -1);
      break;
      case 6:
      turnX(-1, 1);
      break;
      case 7:
      turnX(-1, -1);
      break;
      case 8:
      turnZ(1, 1);
      break;
      case 9:
      turnZ(1, -1);
      break;
      case 10:
      turnZ(-1, 1);
      break;
      case 11:
      turnZ(-1, -1);
      break;
      
    }
    deMove.remove(i);
  }
}
