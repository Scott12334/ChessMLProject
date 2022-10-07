void boardSetup() {
  int type=-1;
  int y=150;
  int number=0;
  for (int i=0; i<8; i++){
    int x=150;
    for (int j=0; j<8; j++) {
      mainBoard[i][j]=new boardSpot(x,y,type);
      mainBoard[i][j].setBoardNumber(number);
      number++;
      x+=100;
      type*=-1;
    }
    type*=-1;
    y+=100;
  }
  //BLACK PIECES
  //PAWNS
  int x=150;
  for(int i=0; i<8; i++){
    y=250;
    blackPieces.add(new Pawn(x,y,1));
    x+=100;
  }
  //ROOKS
  blackPieces.add(new Rook(150,150,1,true));
  blackPieces.add(new Rook(850,150,1,false));
  //KNIGHTS
  blackPieces.add(new Knight(250,150,1));
  blackPieces.add(new Knight(750,150,1));
  //BISHOPS
  blackPieces.add(new Bishop(350,150,1,true));
  blackPieces.add(new Bishop(650,150,1,false));
  //KING AND QUEEN
  blackPieces.add(new Queen(450,150,1));
  blackPieces.add(new King(550,150,1));
  
  //WHITE PIECES
  //PAWNS
  x=150;
  for(int i=0; i<8; i++){
    y=750;
    whitePieces.add(new Pawn(x,y,-1));
    x+=100;
  }
  //ROOKS
  whitePieces.add(new Rook(150,850,-1,true));
  whitePieces.add(new Rook(850,850,-1,false));
  //KNIGHTS
  whitePieces.add(new Knight(250,850,-1));
  whitePieces.add(new Knight(750,850,-1));
  //BISHOPS
  whitePieces.add(new Bishop(350,850,-1,false));
  whitePieces.add(new Bishop(650,850,-1,true));
  //KING AND QUEEN
  whitePieces.add(new Queen(450,850,-1));
  whitePieces.add(new King(550,850,-1));
}
