void drawCheck() {
  insuffienct();
  fiftyMoves();
  stalemate();
  repeat();
}
public void repeat(){
  if(whiteRepeat==3 || blackRepeat==3){
    tied=true;
    gameOver=true;
  }
}
public void stalemate() {
  if (whitePieces.size()==1 && whitePieces.get(0).name=="king") {
    if (whiteChecked==false && whitePieces.get(0).getAllMoves().size()==0) {
      tied=true;
      gameOver=true;
    }
  }
  if (blackPieces.size()==1 && blackPieces.get(0).name=="king") {
    if (blackChecked==false && blackPieces.get(0).getAllMoves().size()==0) {
      tied=true;
      gameOver=true;
    }
  }
}
public void fiftyMoves() {
  if (turnsSince>=50) {
    tied=true;
    gameOver=true;
  }
}
public void insuffienct() {
  //insufficient material draw
  if (blackPieces.size()==1 && whitePieces.size()==1 && blackPieces.get(0).name()=="king" && whitePieces.get(0).name()=="king") {
    tied=true;
    gameOver=true;
  }
  //King and Knight vs King
  if (blackPieces.size()==1 && whitePieces.size()==2 && blackPieces.get(0).name()=="king" && whitePieces.get(1).name()=="knight" && whitePieces.get(0).name()=="king") {
    tied=true;
    gameOver=true;
  }
  if (blackPieces.size()==1 && whitePieces.size()==2 && blackPieces.get(0).name()=="king" && whitePieces.get(0).name()=="knight" && whitePieces.get(1).name()=="king") {
    tied=true;
    gameOver=true;
  }
  if (blackPieces.size()==2 && whitePieces.size()==0 && blackPieces.get(0).name()=="king" && blackPieces.get(1).name()=="knight" && whitePieces.get(0).name()=="king") {
    tied=true;
    gameOver=true;
  }
  if (blackPieces.size()==2 && whitePieces.size()==0 && blackPieces.get(1).name()=="king" && blackPieces.get(0).name()=="knight" && whitePieces.get(0).name()=="king") {
    tied=true;
    gameOver=true;
  }
  //King and Boshop vs King
  if (blackPieces.size()==1 && whitePieces.size()==2 && blackPieces.get(0).name()=="king" && whitePieces.get(1).name()=="bishop" && whitePieces.get(0).name()=="king") {
    tied=true;
    gameOver=true;
  }
  if (blackPieces.size()==1 && whitePieces.size()==2 && blackPieces.get(0).name()=="king" && whitePieces.get(0).name()=="bishop" && whitePieces.get(1).name()=="king") {
    tied=true;
    gameOver=true;
  }
  if (blackPieces.size()==2 && whitePieces.size()==0 && blackPieces.get(0).name()=="king" && blackPieces.get(1).name()=="bishop" && whitePieces.get(0).name()=="king") {
    tied=true;
    gameOver=true;
  }
  if (blackPieces.size()==2 && whitePieces.size()==0 && blackPieces.get(1).name()=="king" && blackPieces.get(0).name()=="bishop" && whitePieces.get(0).name()=="king") {
    tied=true;
    gameOver=true;
  }
  //King and Bishop vs King and Bishop
  if (blackPieces.size()==2 && whitePieces.size()==2) {
    boolean correct=false;
    if (blackPieces.get(0).name()=="king" && blackPieces.get(1).name()=="bishop") {
      if (whitePieces.get(0).name()=="king" && whitePieces.get(1).name()=="bishop") {
        Bishop one= (Bishop)blackPieces.get(1);
        Bishop two= (Bishop)whitePieces.get(1);
        if (one.isWhite()==two.isWhite()) {
          correct=true;
        }
      }
      if (whitePieces.get(1).name()=="king" && whitePieces.get(0).name()=="bishop") {
        Bishop one= (Bishop)blackPieces.get(1);
        Bishop two= (Bishop)whitePieces.get(0);
        if (one.isWhite()==two.isWhite()) {
          correct=true;
        }
      }
    }
    if (blackPieces.get(1).name()=="king" && blackPieces.get(0).name()=="bishop") {
      if (whitePieces.get(0).name()=="king" && whitePieces.get(1).name()=="bishop") {
        Bishop one= (Bishop)blackPieces.get(0);
        Bishop two= (Bishop)whitePieces.get(1);
        if (one.isWhite()==two.isWhite()) {
          correct=true;
        }
      }
      if (whitePieces.get(1).name()=="king" && whitePieces.get(0).name()=="bishop") {
        Bishop one= (Bishop)blackPieces.get(0);
        Bishop two= (Bishop)whitePieces.get(0);
        if (one.isWhite()==two.isWhite()) {
          correct=true;
        }
      }
    }
    if (correct==true) {
      correct=false;
      tied=true;
      gameOver=true;
    }
  }
}
