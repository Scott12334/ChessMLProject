public class Queen extends Piece {
  public Queen(float x, float y, int type) {
    super(x, y, type, "queen",10);
  }
  @Override
    public void caculateMoves(boolean kingCalc) {
    //up-left
    for (int i=1; i<8; i++) {
      if (this.row-i>=0 && this.column-i >=0) {
        if (mainBoard[row-i][column-i].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row-i][column-i]);
        } else if (mainBoard[row-i][column-i].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row-i][column-i]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    //up-right
    for (int i=1; i<8; i++) {
      if (this.row-i>=0 && this.column+i <=7) {
        if (mainBoard[row-i][column+i].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row-i][column+i]);
        } else if (mainBoard[row-i][column+i].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row-i][column+i]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    //down-right
    for (int i=1; i<8; i++) {
      if (this.row+i<=7 && this.column+i <=7) {
        if (mainBoard[row+i][column+i].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row+i][column+i]);
        } else if (mainBoard[row+i][column+i].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row+i][column+i]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    //down-left
    for (int i=1; i<8; i++) {
      if (this.row+i<=7 && this.column-i >=0) {
        if (mainBoard[row+i][column-i].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row+i][column-i]);
        } else if (mainBoard[row+i][column-i].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row+i][column-i]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    //up
    for (int i=1; i<8; i++) {
      if (this.row-i>=0) {
        if (mainBoard[row-i][column].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row-i][column]);
        } else if (mainBoard[row-i][column].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row-i][column]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    //down
    for (int i=1; i<8; i++) {
      if (this.row+i<=7) {
        if (mainBoard[row+i][column].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row+i][column]);
        } else if (mainBoard[row+i][column].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row+i][column]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    //left
    for (int i=1; i<8; i++) {
      if (this.column-i>=0) {
        if (mainBoard[row][column-i].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row][column-i]);
        } else if (mainBoard[row][column-i].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row][column-i]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    //right
    for (int i=1; i<8; i++) {
      if (this.column+i<=7) {
        if (mainBoard[row][column+i].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row][column+i]);
        } else if (mainBoard[row][column+i].getCurrentPiece()!=type) {
          legalMoves.add(mainBoard[row][column+i]);
          break;
        } else {
          break;
        }
      } else {
        break;
      }
    }
    if (kingCalc==false) {
      /*int oldRow=row;
      int oldCol=column;
      for (int i=0; i<legalMoves.size(); i++) {
        if (legalMoves.get(i)!=null) {
          mainBoard[row][column].setCurrentPiece(0);
          int oldType=legalMoves.get(i).getCurrentPiece();
          this.row=legalMoves.get(i).getArrayRow();
          this.column=legalMoves.get(i).getColumn();
          float oldX=x;
          float oldY=y;
          this.x=legalMoves.get(i).getX();
          this.y=legalMoves.get(i).getY();
          legalMoves.get(i).setCurrentPiece(-1);
          if (type==-1) {
            whiteCheckedTest=false;
            checkWhiteInCheckTest();
            if (whiteCheckedTest==true && oldType==0) {
              legalMoves.get(i).setCurrentPiece(oldType);
              legalMoves.set(i, null);
            }
            if (legalMoves.get(i)!=null) {
              legalMoves.get(i).setCurrentPiece(oldType);
            }
            whiteCheckedTest=false;
          }
          this.row=oldRow;
          this.column=oldCol;
          this.x=oldX;
          this.y=oldY;
          mainBoard[row][column].setCurrentPiece(type);
          calculatePosition();
        }
      }*/
      for (int i=0; i<legalMoves.size(); i++) {
        if (legalMoves.get(i)!=null) {
          legalMoves.get(i).setLegalMove(true);
        }
      }
    }
  }
}
