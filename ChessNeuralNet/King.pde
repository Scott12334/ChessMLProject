public class King extends Piece {
  ArrayList<boardSpot> removables;
  boardSpot oldSpot;
  public King(float x, float y, int type) {
    super(x, y, type, "king",100);
    removables=new ArrayList<boardSpot>();
    oldSpot=mainBoard[row][column];
  }
  @Override
    public void caculateMoves(boolean kingCalc) {
    //up-left
    for (int i=1; i<2; i++) {
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
    for (int i=1; i<2; i++) {
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
    for (int i=1; i<2; i++) {
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
    for (int i=1; i<2; i++) {
      if (this.row+i<=7 && this.column-i >=0) {
        if (mainBoard[row+i][column-i].getCurrentPiece()==0) {
          legalMoves.add(mainBoard[row+i][column-i]);
        } else if (mainBoard[row+i][column-i].getCurrentPiece()==0) {
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
    for (int i=1; i<2; i++) {
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
    for (int i=1; i<2; i++) {
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
    for (int i=1; i<2; i++) {
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
    for (int i=1; i<2; i++) {
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
    if (beenMoved==false && type==-1 && whiteChecked==false) {
      if (mainBoard[7][5].getCurrentPiece()==0 && mainBoard[7][6].getCurrentPiece()==0) {
        for (int i=0; i<whitePieces.size(); i++) {
          if (whitePieces.get(i).name()=="rook") {
            Rook selectedPiece=(Rook)whitePieces.get(i);
            if (whitePieces.get(i).hasMoved()==false && selectedPiece.isLeftPiece()==false) {
              legalMoves.add(mainBoard[7][6]);
            }
          }
        }
      }
      if (mainBoard[7][1].getCurrentPiece()==0 && mainBoard[7][2].getCurrentPiece()==0 && mainBoard[7][3].getCurrentPiece()==0) {
        for (int i=0; i<whitePieces.size(); i++) {
          if (whitePieces.get(i).name()=="rook") {
            Rook selectedPiece=(Rook)whitePieces.get(i);
            if (whitePieces.get(i).hasMoved()==false && selectedPiece.isLeftPiece()==true) {
              legalMoves.add(mainBoard[7][2]);
            }
          }
        }
      }
    }
    if (beenMoved==false && type==1) {
      if (mainBoard[0][5].getCurrentPiece()==0 && mainBoard[0][6].getCurrentPiece()==0) {
        for (int i=0; i<blackPieces.size(); i++) {
          if (blackPieces.get(i).name()=="rook") {
            Rook selectedPiece=(Rook)blackPieces.get(i);
            if (blackPieces.get(i).hasMoved()==false && selectedPiece.isLeftPiece()==false) {
              legalMoves.add(mainBoard[0][6]);
            }
          }
        }
      }
      if (mainBoard[0][1].getCurrentPiece()==0 && mainBoard[0][2].getCurrentPiece()==0 && mainBoard[0][3].getCurrentPiece()==0) {
        for (int i=0; i<blackPieces.size(); i++) {
          if (blackPieces.get(i).name()=="rook") {
            Rook selectedPiece=(Rook)blackPieces.get(i);
            if (blackPieces.get(i).hasMoved()==false && selectedPiece.isLeftPiece()==true) {
              legalMoves.add(mainBoard[0][2]);
            }
          }
        }
      }
    }
    mainBoard[row][column].setCurrentPiece(0);
    if (kingCalc==false) {
      if (type==-1) {
        allPossibleMovesBlack();
        for (int x=0; x<legalMoves.size(); x++) {
          for (int j=0; j<blackMoveList.size(); j++) {
            if (legalMoves.get(x).getArrayRow()==blackMoveList.get(j).getArrayRow() && legalMoves.get(x).getColumn()==blackMoveList.get(j).getColumn()) {
              legalMoves.get(x).setShouldRemove(true);
            }
          }
        }
        for (int i=0; i<legalMoves.size(); i++) {
          if (legalMoves.get(i).shouldRemove()==true) {
            legalMoves.set(i, null);
          }
        }
      } else {
        allPossibleMovesWhite();
        for (int i=0; i<this.legalMoves.size(); i++) {
          for (int j=0; j<whiteMoveList.size(); j++) {
            if (legalMoves.get(i).getArrayRow()==whiteMoveList.get(j).getArrayRow() && legalMoves.get(i).getColumn()==whiteMoveList.get(j).getColumn()) {
              legalMoves.get(i).setShouldRemove(true);
              break;
            }
          }
        }
        for (int i=0; i<legalMoves.size(); i++) {
          if (legalMoves.get(i).shouldRemove()==true) {
            legalMoves.set(i, null);
          }
        }
      }
    }
    mainBoard[row][column].setCurrentPiece(type);
    if (kingCalc==false) {
      for (int i=0; i<legalMoves.size(); i++) {
        if (legalMoves.get(i)!=null) {
          legalMoves.get(i).setLegalMove(true);
        }
      }
    }
  }
  public void setOldSpot(boardSpot newOld){
    this.oldSpot=newOld;
  }
  public boardSpot getOldSpot(){
    return oldSpot;
  }
}
