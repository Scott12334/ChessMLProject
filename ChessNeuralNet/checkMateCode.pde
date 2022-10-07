void blackWin() {
  //calculate all moves in each piece
  boolean checkMate=true;
  ArrayList<boardSpot> movesToMake= new ArrayList<boardSpot>();
  for (int i=0; i<whitePieces.size(); i++) {
    whitePieces.get(i).caculateMoves(false);
    //remove moves using check code
    whitePieces.get(i).whiteMovesCheck();
    //add remaining moves to list
    movesToMake.addAll(whitePieces.get(i).getAllMoves());
    whitePieces.get(i).deselectPositions();
  }
  //if list is 0, checkmate
  for(int i=0; i<movesToMake.size();i++){
    if(movesToMake.get(i)!=null){
      checkMate=false;
      break;
    }
  }
  if (checkMate==true) {
    winningPlayer=1;
    blackBrain.addPoints(100);
    gameOver=true;
    gameOverFrame=frameCount;
  }
  movesToMake.clear();
}
void whiteWin() {
  //calculate all moves in each piece
  boolean checkMate=true;
  ArrayList<boardSpot> movesToMake= new ArrayList<boardSpot>();
  for (int i=0; i<blackPieces.size(); i++) {
    blackPieces.get(i).caculateMoves(false);
    //remove moves using check code
    blackPieces.get(i).blackMovesCheck();
    //add remaining moves to list
    movesToMake.addAll(blackPieces.get(i).getAllMoves());
    blackPieces.get(i).deselectPositions();
  }
  //if list is 0, checkmate
  for(int i=0; i<movesToMake.size();i++){
    if(movesToMake.get(i)!=null){
      checkMate=false;
      break;
    }
  }
  if (checkMate==true) {
    winningPlayer=-1;
    whiteBrain.addPoints(100);
    gameOver=true;
    gameOverFrame=frameCount;
  }
  movesToMake.clear();
}
