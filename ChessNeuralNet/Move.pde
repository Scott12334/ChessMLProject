public class Move{
  boardSpot movePosition;
  Piece pieceThatMoves;
  int pieceNumber;
  int spotNumber;
  public Move(boardSpot movePosition, Piece pieceThatMoves){
    this.movePosition=movePosition;
    this.pieceThatMoves=pieceThatMoves;
    this.spotNumber=movePosition.getBoardNumber();
    this.pieceNumber=pieceThatMoves.getPieceNumber();
  }
  public boardSpot getBoardSpot(){
    return movePosition;
  }
  public int getPieceNumber(){
    return pieceNumber;
  }
  public int getSpotNumber(){
    return spotNumber;
  }
}
