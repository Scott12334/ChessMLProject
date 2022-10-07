public class Rook extends Piece {
  boolean leftPiece;
  public Rook(float x, float y, int type, boolean leftPiece) {
    super(x, y, type, "rook",5);
    this.leftPiece=leftPiece;
  }
  @Override
  public void caculateMoves(boolean kingCalc){
    //up
    for(int i=1; i<8; i++){
      if(this.getArrayRow()-i>=0){
        if(mainBoard[getArrayRow()-i][getColumn()].getCurrentPiece()==0){
          legalMoves.add(mainBoard[getArrayRow()-i][getColumn()]);
        }
        else if(mainBoard[getArrayRow()-i][getColumn()].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[getArrayRow()-i][getColumn()]);
          break;
        }
        else{break;}
      }
      else{break;}
    }
    //down
    for(int i=1; i<8; i++){
      if(this.getArrayRow()+i<=7){
        if(mainBoard[getArrayRow()+i][getColumn()].getCurrentPiece()==0){
          legalMoves.add(mainBoard[getArrayRow()+i][getColumn()]);
        }
        else if(mainBoard[getArrayRow()+i][getColumn()].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[getArrayRow()+i][getColumn()]);
          break;
        }
        else{break;}
      }
      else{break;}
    }
    //left
    for(int i=1; i<8; i++){
      if(this.getColumn()-i>=0){
        if(mainBoard[getArrayRow()][getColumn()-i].getCurrentPiece()==0){
          legalMoves.add(mainBoard[getArrayRow()][getColumn()-i]);
        }
        else if(mainBoard[getArrayRow()][getColumn()-i].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[getArrayRow()][getColumn()-i]);
          break;
        }
        else{break;}
      }
      else{break;}
    }
    //right
    for(int i=1; i<8; i++){
      if(this.getColumn()+i<=7){
        if(mainBoard[getArrayRow()][getColumn()+i].getCurrentPiece()==0){
          legalMoves.add(mainBoard[getArrayRow()][getColumn()+i]);
        }
        else if(mainBoard[getArrayRow()][getColumn()+i].getCurrentPiece()!=type){
          legalMoves.add(mainBoard[getArrayRow()][getColumn()+i]);
          break;
        }
        else{break;}
      }
      else{break;}
    }
    if (kingCalc==false) {
      for (int i=0; i<legalMoves.size(); i++) {
        legalMoves.get(i).setLegalMove(true);
      }
    }
  }
  public boolean isLeftPiece(){return leftPiece;}
}
