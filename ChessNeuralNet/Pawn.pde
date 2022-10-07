public class Pawn extends Piece {
  int pawnToRemove;
  public Pawn(float x, float y, int type) {
    super(x, y, type, "pawn",1);
    pawnToRemove=-1;
  }
  public int removePawn(){
    return pawnToRemove;
  }
  public void resetRemover(){
    pawnToRemove=-1;
  }
  @Override
    public void caculateMoves(boolean kingCalc) {
    legalMoves.clear();
    if (beenMoved==false && kingCalc==false) {
      if (type==-1) {
        if (this.row>=2) {
          if (mainBoard[this.row-1][this.column].getCurrentPiece()==0) {
            legalMoves.add(mainBoard[this.row-1][this.column]);
            if (mainBoard[this.row-2][this.column].getCurrentPiece()==0) {
              legalMoves.add(mainBoard[this.row-2][this.column]);
            }
          }
        }
      } else {
        if (this.row<=5) {
          if (mainBoard[this.row+1][this.column].getCurrentPiece()==0) {
            legalMoves.add(mainBoard[this.row+1][this.column]);
            if (mainBoard[this.row+2][this.column].getCurrentPiece()==0) {
              legalMoves.add(mainBoard[this.row+2][this.column]);
            }
          }
        }
      }
    } else if (kingCalc==false) {
      if (type==-1) {
        if (this.row>=1) {
          if (mainBoard[this.row-1][this.column].getCurrentPiece()==0) {
            legalMoves.add(mainBoard[this.row-1][this.column]);
          }
        }
      } else {
        if (this.row<=6) {
          if (mainBoard[this.row+1][this.column].getCurrentPiece()==0) {
            legalMoves.add(mainBoard[this.row+1][this.column]);
          }
        }
      }
    }
    if (type==-1) {
      if (this.column>0 && this.row>0) {
        if (mainBoard[this.row-1][this.column-1].getCurrentPiece()==1) {
          legalMoves.add(mainBoard[this.row-1][this.column-1]);
        }
      }
      if (this.column<7 && this.row>0) {
        if (mainBoard[this.row-1][this.column+1].getCurrentPiece()==1) {
          legalMoves.add(mainBoard[this.row-1][this.column+1]);
        }
      }
    } else {
      if (this.column>0 && this.row<7) {
        if (mainBoard[this.row+1][this.column-1].getCurrentPiece()==-1) {
          legalMoves.add(mainBoard[this.row+1][this.column-1]);
        }
      }
      if (this.column<7 && this.row<7) {
        if (mainBoard[this.row+1][this.column+1].getCurrentPiece()==-1) {
          legalMoves.add(mainBoard[this.row+1][this.column+1]);
        }
      }
    }
    //EN PESSEANT MOVE
    if (kingCalc==false) {
      if (type==-1) {
        if (this.column>0 && this.row==3) {
          for (int i=0; i<blackPawns.size(); i++) {
            if (blackPawns.get(i).name()=="pawn") {
              if(blackPawns.get(i).getArrayRow()==3 && blackPawns.get(i).getColumn()==this.column-1){
                legalMoves.add(mainBoard[this.row-1][this.column-1]);
                for(int j=0; j<blackPieces.size();j++){
                  if(blackPieces.get(j)==blackPawns.get(i)){
                    pawnToRemove=j;
                  }
                }
              }
            }
          }
        }
        if (this.column<7 && this.row==3) {
          for (int i=0; i<blackPawns.size(); i++) {
            if (blackPawns.get(i).name()=="pawn") {
              if(blackPawns.get(i).getArrayRow()==3 && blackPawns.get(i).getColumn()==this.column+1){
                legalMoves.add(mainBoard[this.row-1][this.column+1]);
                for(int j=0; j<blackPieces.size();j++){
                  if(blackPieces.get(j)==blackPawns.get(i)){
                    pawnToRemove=j;
                  }
                }
              }
            }
          }
        }
      }
      if (type==1) {
        if (this.column>0 && this.row==4) {
          for (int i=0; i<whitePawns.size(); i++) {
            if (whitePawns.get(i).name()=="pawn") {
              if(whitePawns.get(i).getArrayRow()==4 && whitePawns.get(i).getColumn()==this.column-1){
                legalMoves.add(mainBoard[this.row+1][this.column-1]);
                for(int j=0; j<whitePieces.size();j++){
                  if(whitePieces.get(j)==whitePawns.get(i)){
                    pawnToRemove=j;
                  }
                }
              }
            }
          }
        }
        if (this.column<7 && this.row==4) {
          for (int i=0; i<whitePawns.size(); i++) {
            if (whitePawns.get(i).name()=="pawn") {
              if(whitePawns.get(i).getArrayRow()==4 && whitePawns.get(i).getColumn()==this.column+1){
                legalMoves.add(mainBoard[this.row+1][this.column+1]);
                for(int j=0; j<whitePieces.size();j++){
                  if(whitePieces.get(j)==whitePawns.get(i)){
                    pawnToRemove=j;
                  }
                }
              }
            }
          }
        }
      }
    }
    if (kingCalc==true) {
      if (type==-1) {
        if (this.column>0 && this.row>0) {
          if (mainBoard[this.row-1][this.column-1].getCurrentPiece()!=type) {
            legalMoves.add(mainBoard[this.row-1][this.column-1]);
          }
        }
        if (this.column<7 && this.row>0) {
          if (mainBoard[this.row-1][this.column+1].getCurrentPiece()!=type) {
            legalMoves.add(mainBoard[this.row-1][this.column+1]);
          }
        }
      } else {
        if (this.column>0 && this.row<7) {
          if (mainBoard[this.row+1][this.column-1].getCurrentPiece()!=type) {
            legalMoves.add(mainBoard[this.row+1][this.column-1]);
          }
        }
        if (this.column<7 && this.row<7) {
          if (mainBoard[this.row+1][this.column+1].getCurrentPiece()!=type) {
            legalMoves.add(mainBoard[this.row+1][this.column+1]);
          }
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
