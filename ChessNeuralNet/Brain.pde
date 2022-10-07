public class Brain
{
  int type; //-1=white, 1=black
  ArrayList<Perceptron> perceptrons;
  float[] weights;
  ArrayList<Move> yourMoves;
  ArrayList<Move> enemyMoves;
  ArrayList<Move> yourPositions;
  ArrayList<Move> enemyPositions;
  int points;
  //create new brain with new weights
  public Brain(int type)
  {
    weights= new float[4];
    yourMoves= new ArrayList<Move>();
    enemyMoves= new ArrayList<Move>();
    yourPositions= new ArrayList<Move>();
    enemyPositions= new ArrayList<Move>();
    perceptrons= new ArrayList<Perceptron>();
    this.type=type;
    switch(type)
    {
      case 1:
      perceptrons.add(new Perceptron(4));
      break;
      case -1:
      perceptrons.add(new Perceptron(4));
      break;
      //0= x node, 1=y node
    }
    points=0;
  }
  //create brain with premade weights
  public Brain(int type, float[] weights)
  {
    this.weights= weights;
    yourMoves= new ArrayList<Move>();
    enemyMoves= new ArrayList<Move>();
    yourPositions= new ArrayList<Move>();
    enemyPositions= new ArrayList<Move>();
    perceptrons= new ArrayList<Perceptron>();
    perceptrons= new ArrayList<Perceptron>();
    this.type=type;
    perceptrons.add(new Perceptron(weights));
  }
  public void think()
  {
    calculateInputs(type);
    Move result = perceptrons.get(0).output(yourMoves, enemyMoves, yourPositions, enemyPositions);
    if (type==-1) {
      selectedSpot=result.getBoardSpot();
      //whitePieces.get(result.getPieceNumber()).setSelected(true);
      whitePieces.get(result.getPieceNumber()).addLegalMove(result.getBoardSpot());
      whitePieces.get(result.getPieceNumber()).move(true);
    } else {
      selectedSpot=result.getBoardSpot();
      //whitePieces.get(result.getPieceNumber()).setSelected(true);
      blackPieces.get(result.getPieceNumber()).addLegalMove(result.getBoardSpot());
      blackPieces.get(result.getPieceNumber()).move(true);
      selectedSpot=null;
    }
  }
  //calculate Inputs
  void calculateInputs(int type) {
    yourMoves.clear();
    enemyMoves.clear();
    yourPositions.clear();
    enemyPositions.clear();
    calculateYourPositions(type);
    allPossibleMovesBlackBrain(type);
    allPossibleMovesWhiteBrain(type);
  }
  void calculateYourPositions(int type) {
    if (type==-1) {
      for (int i=0; i<whitePieces.size(); i++) {
        yourPositions.add(new Move(mainBoard[whitePieces.get(i).getArrayRow()][whitePieces.get(i).getColumn()], whitePieces.get(i)));
      }
      for (int i=0; i<blackPieces.size(); i++) {
        enemyPositions.add(new Move(mainBoard[blackPieces.get(i).getArrayRow()][blackPieces.get(i).getColumn()], blackPieces.get(i)));
      }
    }
    if (type==1) {
      for (int i=0; i<whitePieces.size(); i++) {
        enemyPositions.add(new Move(mainBoard[whitePieces.get(i).getArrayRow()][whitePieces.get(i).getColumn()], whitePieces.get(i)));
      }
      for (int i=0; i<blackPieces.size(); i++) {
        yourPositions.add(new Move(mainBoard[blackPieces.get(i).getArrayRow()][blackPieces.get(i).getColumn()], blackPieces.get(i)));
      }
    }
  }
  void allPossibleMovesBlackBrain(int type) {
    for (int i=0; i<blackPieces.size(); i++) {
      blackPieces.get(i).caculateMoves(false);
      blackPieces.get(i).blackMovesCheck();
      for (int j=0; j<blackPieces.get(i).getAllMoves().size(); j++) {
        if (blackPieces.get(i).getAllMoves().get(j)!=null) {
          if (type==-1) {
            enemyMoves.add(new Move(blackPieces.get(i).getAllMoves().get(j), blackPieces.get(i)));
          } else {
            yourMoves.add(new Move(blackPieces.get(i).getAllMoves().get(j), blackPieces.get(i)));
          }
        }
      }
      blackPieces.get(i).deselectPositions();
    }
  }
  void allPossibleMovesWhiteBrain(int type) {
    for (int i=0; i<whitePieces.size(); i++) {
      whitePieces.get(i).caculateMoves(false);
      whitePieces.get(i).whiteMovesCheck();
      for (int j=0; j<whitePieces.get(i).getAllMoves().size(); j++) {
        if(whitePieces.get(i).getAllMoves().get(j)!=null){
        if (type==1) {
          enemyMoves.add(new Move(whitePieces.get(i).getAllMoves().get(j), whitePieces.get(i)));
        } else {
          yourMoves.add(new Move(whitePieces.get(i).getAllMoves().get(j), whitePieces.get(i)));
        }
      }}
      whitePieces.get(i).deselectPositions();
    }
  }
  public float[] getWeights(){
    return perceptrons.get(0).getWeights();
  }
  public int getPoints(){
    return points;
  }
  public void addPoints(int amount){
    points+=amount;
  }
}
