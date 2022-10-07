public class Bishop extends Piece {
  boolean isWhite;
  public Bishop(float x, float y, int type, boolean isWhite) {
    super(x, y, type, "bishop",5);
    this.isWhite=isWhite;
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
    if (kingCalc==false) {
      for (int i=0; i<legalMoves.size(); i++) {
        legalMoves.get(i).setLegalMove(true);
      }
    }
  }
  
  public boolean isWhite(){
    return isWhite;
  }
}
