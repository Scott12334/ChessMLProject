boardSpot[][] mainBoard;
ArrayList<Piece> blackPieces;
ArrayList<Piece> whitePieces;
ArrayList<boardSpot> whiteMoveList;
ArrayList<boardSpot> blackMoveList;
ArrayList<Piece> blackPawns;
ArrayList<Piece> whitePawns;
boolean mouseDelay;
Piece selectedPiece;
boolean pieceSelected;
boardSpot selectedSpot;
int turn; //-1=white, 1=black
int winningPlayer; //-1=white, 1=black
boolean gameOver;
int gameOverFrame;
boolean whiteChecked;
boolean blackChecked;
boolean turnChange;
boolean whiteCheckedTest;
boolean blackCheckedTest;
boolean tied;
int turnsSince;
int whiteRepeat;
int blackRepeat;
char[] boardPos={'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', };
PImage[] whitePieceImages;
PImage[] blackPieceImages;
int pawnChoice;
boolean pawnPromote;
ArrayList<Brain> blackBrains= new ArrayList<Brain>();
ArrayList<Brain> whiteBrains= new ArrayList<Brain>();
int currentBrain=0;
Brain blackBrain;
Brain whiteBrain;
int gameType=0;//0=player v player, 1=player v AI, 2= training: AI v AI
boolean gameStarted=false;
boolean turnHasHappened;
boolean addedBrain=false;
void setup()
{
  size(1000, 1000);
  mainBoard= new boardSpot[8][8];
  blackPieces= new ArrayList<Piece>();
  whitePieces= new ArrayList<Piece>();
  blackMoveList= new ArrayList<boardSpot>();
  whiteMoveList= new ArrayList<boardSpot>();
  blackPawns= new ArrayList<Piece>();
  whitePawns= new ArrayList<Piece>();
  boardSetup();
  selectedSpot=null;
  pieceSelected=false;
  selectedPiece=null;
  turn=-1;
  winningPlayer=0;
  gameOver=false;
  if (gameType!=2) {
    turnChange=false;
  }
  whiteCheckedTest=false;
  blackCheckedTest=false;
  turnsSince=0;
  tied=false;
  whiteRepeat=0;
  blackRepeat=0;
  whitePieceImages= new PImage[4];
  blackPieceImages= new PImage[4];
  whitePieceImages[0]=loadImage("white_rook.png");
  whitePieceImages[1]=loadImage("white_knight.png");
  whitePieceImages[2]=loadImage("white_bishop.png");
  whitePieceImages[3]=loadImage("white_queen.png");

  blackPieceImages[0]=loadImage("black_rook.png");
  blackPieceImages[1]=loadImage("black_knight.png");
  blackPieceImages[2]=loadImage("black_bishop.png");
  blackPieceImages[3]=loadImage("black_queen.png");

  pawnChoice=-1;
  pawnPromote=false;
  newBrains();
  blackBrain= blackBrains.get(currentBrain);
  whiteBrain= whiteBrains.get(currentBrain);
  updateNumbers();
  turnHasHappened=true;
  addedBrain=false;
}
void draw() {
  background(#d6b333);
  if (gameStarted==false) {
    textSize(32);
    fill(0);
    textAlign(CENTER);
    text("Please Choose Your Game!", width/2, height/2-130);
    text("Press the Number corresponding to your chocie:", width/2, height/2-100);
    text("0: Player VS Player", width/2, height/2-50);
    text("1: Player VS AI", width/2, height/2-10);
    text("2: AI VS AI", width/2, height/2+30);
  }
  if (gameOver==false && gameStarted==true) {
    boardDisplay();
    GUI();
    if (turnChange==true) {
      checkBlackInCheck();
      checkWhiteInCheck();
      drawCheck();
      blackWin();
      whiteWin();
      updateNumbers();
      if (gameType==1) {
        if (turn==1) {
          blackBrain.think();
          delay(500);
        }
      }
      if (gameType==2) {
        if (turn==1) {
          blackBrain.think();
          delay(500);
        } else {
          whiteBrain.think();
          delay(500);
        }
        turn*=-1;
      }
      if (gameType!=2) {
        turnChange=false;
        turnHasHappened=true;
      }
    }
  } else if (gameStarted==true && gameOver==true) {
    if (tied==false) {
      String winner="";
      switch(winningPlayer) {
      case -1:
        winner="White";
        break;

      case 1:
        winner="Black";
        break;
      }
      int countDown= ((gameOverFrame+300)-frameCount)/60;
      textAlign(CENTER);
      fill(0);
      textSize(56);
      text(winner+" has won!", width/2, height/2);
      textSize(32);
      text(countDown+" till next round", width/2, height/2+25);
      if (countDown<=0) {
        setup();
      }
    } else {
      int countDown= ((gameOverFrame+300)-frameCount)/60;
      textAlign(CENTER);
      fill(0);
      textSize(56);
      text("There was a draw!", width/2, height/2);
      textSize(32);
      text(countDown+" till next round", width/2, height/2+25);
      if (countDown<=0) {
        setup();
      }
    }
    if (gameType==2 && addedBrain==false) {
      if (currentBrain==4) {
        train();
        currentBrain=0;
        addedBrain=true;
      } else {
        currentBrain++;
        addedBrain=true;
        println(currentBrain);
      }
    }
  }
}
void keyPressed() {
  if (key=='0') {
    if (gameStarted==false) {
      gameType=0;
      gameStarted=true;
    }
  }
  if (key=='1') {
    if (gameStarted==false) {
      gameType=1;
      gameStarted=true;
      playerVAIsetup();
    }
  }
  if (key=='2') {
    if (gameStarted==false) {
      gameType=2;
      gameStarted=true;
      aiVaiSetup();
    }
  }
}
void playerVAIsetup() {
  String[] bestSaved=loadStrings("weight_save.txt");
  float[] bestWeights= new float[4];
  for(int i=0; i<bestSaved.length;i++){
    bestWeights[i]= Float.parseFloat(bestSaved[i]);
  }
  blackBrain=new Brain(1,bestWeights);
}
void aiVaiSetup() {
  String[] bestSaved=loadStrings("weight_save.txt");
  float[] bestWeights= new float[4];
  for(int i=0; i<bestSaved.length;i++){
    bestWeights[i]= Float.parseFloat(bestSaved[i]);
  }
  AISetup(bestWeights);
  turnChange=true;
}
void updateNumbers() {
  for (int i=0; i<blackPieces.size(); i++) {
    blackPieces.get(i).setPieceNumber(i);
  }
  for (int i=0; i<whitePieces.size(); i++) {
    whitePieces.get(i).setPieceNumber(i);
  }
}
void checkBlackInCheck() {
  allPossibleMovesWhite();
  for (int i=0; i<blackPieces.size(); i++) {
    if (blackPieces.get(i).name()=="king") {
      for (int j=0; j<whiteMoveList.size(); j++) {
        if (blackPieces.get(i).getArrayRow()==whiteMoveList.get(j).getArrayRow()&& blackPieces.get(i).getColumn()==whiteMoveList.get(j).getColumn()) {
          blackChecked=true;
        }
      }
    }
  }
}
void checkBlackInCheckTest() {
  allPossibleMovesWhite();
  for (int i=0; i<blackPieces.size(); i++) {
    if (blackPieces.get(i).name()=="king") {
      for (int j=0; j<whiteMoveList.size(); j++) {
        if (blackPieces.get(i).getArrayRow()==whiteMoveList.get(j).getArrayRow()&& blackPieces.get(i).getColumn()==whiteMoveList.get(j).getColumn()) {
          blackCheckedTest=true;
        }
      }
    }
  }
}
void checkWhiteInCheck() {
  allPossibleMovesBlack();
  whiteChecked=false;
  for (int i=0; i<whitePieces.size(); i++) {
    if (whitePieces.get(i).name()=="king") {
      for (int j=0; j<blackMoveList.size(); j++) {
        if (whitePieces.get(i).getArrayRow()==blackMoveList.get(j).getArrayRow()&& whitePieces.get(i).getColumn()==blackMoveList.get(j).getColumn()) {
          whiteChecked=true;
        }
      }
    }
  }
}
void checkWhiteInCheckTest() {
  allPossibleMovesBlack();
  whiteCheckedTest=false;
  for (int i=0; i<whitePieces.size(); i++) {
    if (whitePieces.get(i).name()=="king") {
      for (int j=0; j<blackMoveList.size(); j++) {
        if (whitePieces.get(i).getArrayRow()==blackMoveList.get(j).getArrayRow()&& whitePieces.get(i).getColumn()==blackMoveList.get(j).getColumn()) {
          whiteCheckedTest=true;
        }
      }
    }
  }
}
void GUI() {
  textAlign(CENTER);
  textSize(32);
  fill(0);
  String currentTurn="";
  switch(turn) {
  case -1:
    currentTurn="White's Turn";
    break;

  case 1:
    currentTurn="Black's Turn";
    break;
  }
  text(currentTurn, width/2+10, 45);
  int y=150;
  for (int i=8; i>0; i--) {
    text(i, 85, y);
    y+=100;
  }
  int x=150;
  for (int i=0; i<boardPos.length; i++) {
    text(boardPos[i], x, 85);
    x+=100;
  }
}
void boardDisplay() {
  for (int i=0; i<mainBoard.length; i++) {
    for (int j=0; j<8; j++) {
      mainBoard[i][j].display();
    }
  }
  for (int i=0; i<blackPieces.size(); i++) {
    blackPieces.get(i).display();
    if (blackPieces.get(i).name()=="pawn" && blackPieces.get(i).getArrayRow()==7) {
      pawnPromote=true;
      pawnPromotion(false);
      if (pawnChoice!=-1) {
        switch(pawnChoice) {
        case 0:
          blackPieces.add(new Rook(blackPieces.get(i).getX(), blackPieces.get(i).getY(), 1, false));
          mainBoard[blackPieces.get(i).getArrayRow()][blackPieces.get(i).getColumn()].setCurrentPiece(1);
          blackPieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;

        case 1:
          blackPieces.add(new Knight(blackPieces.get(i).getX(), blackPieces.get(i).getY(), 1));
          mainBoard[blackPieces.get(i).getArrayRow()][blackPieces.get(i).getColumn()].setCurrentPiece(1);
          blackPieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;

        case 2:
          blackPieces.add(new Bishop(blackPieces.get(i).getX(), blackPieces.get(i).getY(), 1, false));
          mainBoard[blackPieces.get(i).getArrayRow()][blackPieces.get(i).getColumn()].setCurrentPiece(1);
          blackPieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;

        case 3:
          blackPieces.add(new Queen(blackPieces.get(i).getX(), blackPieces.get(i).getY(), 1));
          mainBoard[blackPieces.get(i).getArrayRow()][blackPieces.get(i).getColumn()].setCurrentPiece(1);
          blackPieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;
        }
      }
    }
  }
  for (int i=0; i<whitePieces.size(); i++) {
    whitePieces.get(i).display();
    if (whitePieces.get(i).name()=="pawn" && whitePieces.get(i).getArrayRow()==0) {
      pawnPromote=true;
      pawnPromotion(true);
      if (pawnChoice!=-1) {
        switch(pawnChoice) {
        case 0:
          whitePieces.add(new Rook(whitePieces.get(i).getX(), whitePieces.get(i).getY(), -1, false));
          mainBoard[whitePieces.get(i).getArrayRow()][whitePieces.get(i).getColumn()].setCurrentPiece(1);
          whitePieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;

        case 1:
          whitePieces.add(new Knight(whitePieces.get(i).getX(), whitePieces.get(i).getY(), -1));
          mainBoard[whitePieces.get(i).getArrayRow()][whitePieces.get(i).getColumn()].setCurrentPiece(1);
          whitePieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;

        case 2:
          whitePieces.add(new Bishop(whitePieces.get(i).getX(), whitePieces.get(i).getY(), -1, false));
          mainBoard[whitePieces.get(i).getArrayRow()][whitePieces.get(i).getColumn()].setCurrentPiece(1);
          whitePieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;

        case 3:
          whitePieces.add(new Queen(whitePieces.get(i).getX(), whitePieces.get(i).getY(), -1));
          mainBoard[whitePieces.get(i).getArrayRow()][whitePieces.get(i).getColumn()].setCurrentPiece(1);
          whitePieces.remove(i);
          pawnPromote=false;
          pawnChoice=-1;
          break;
        }
      }
    }
  }
}
void allPossibleMovesWhite() {
  whiteMoveList.clear();
  for (int i=0; i<whitePieces.size(); i++) {
    whitePieces.get(i).caculateMoves(true);
    whiteMoveList.addAll(whitePieces.get(i).getAllMoves());
    whitePieces.get(i).clearMoves();
  }
}
void allPossibleMovesBlack() {
  blackMoveList.clear();
  for (int i=0; i<blackPieces.size(); i++) {
    blackPieces.get(i).caculateMoves(true);
    blackMoveList.addAll(blackPieces.get(i).getAllMoves());
    blackPieces.get(i).clearMoves();
  }
}
void mouseReleased()
{
  mouseDelay=false;
}
