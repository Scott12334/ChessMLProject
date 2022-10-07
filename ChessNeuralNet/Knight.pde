public class Knight extends Piece{
  public Knight(float x, float y, int type){
    super(x,y,type,"knight",6);
  }
  @Override
  public void caculateMoves(boolean kingCalc){
    if(this.row>=2){
      if(this.column>=1){
        if(mainBoard[this.row-2][this.column-1].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row-2][this.column-1]);
        }
      }
      if(this.column<7){
        if(mainBoard[this.row-2][this.column+1].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row-2][this.column+1]);
        }
      }
    }
    if(this.row<=5){
      if(this.column>=1){
        if(mainBoard[this.row+2][this.column-1].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row+2][this.column-1]);
        }
      }
      if(this.column<7){
        if(mainBoard[this.row+2][this.column+1].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row+2][this.column+1]);
        }
      }
    }
    if(this.column>=2){
      if(this.row>=1){
        if(mainBoard[this.row-1][this.column-2].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row-1][this.column-2]);
        }
      }
      if(this.row<7){
        if(mainBoard[this.row+1][this.column-2].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row+1][this.column-2]);
        }
      }
    }
    if(this.column<=5){
      if(this.row>=1){
        if(mainBoard[this.row-1][this.column+2].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row-1][this.column+2]);
        }
      }
      if(this.row<7){
        if(mainBoard[this.row+1][this.column+2].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[this.row+1][this.column+2]);
        }
      }
    }
    if (kingCalc==false) {
      for (int i=0; i<legalMoves.size(); i++) {
        legalMoves.get(i).setLegalMove(true);
      }
    }
  }
}
