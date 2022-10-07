public class Piece {
  int column;
  int row;
  float x;
  float y;
  int type;
  String name;
  PImage pieceImage;
  boolean selected;
  boolean beenMoved;
  ArrayList<boardSpot> legalMoves;
  boolean hasCalculated;
  int numMoves;
  int pieceNumber;
  int points;
  public Piece(float x, float y, int type, String name, int points) {
    this.x=x;
    this.y=y;
    this.type=type;
    this.name=name;
    setImage();
    selected=false;
    beenMoved=false;
    calculatePosition();
    legalMoves= new ArrayList<boardSpot>();
    hasCalculated=false;
    this.points=points;
  }
  public void display() {
    imageMode(CENTER);
    image(pieceImage, x, y);
    if (mousePressed==true && mouseButton==LEFT && dist(this.x, this.y, mouseX, mouseY)<48 && mouseDelay==false && turn==type && pieceSelected==false && pawnPromote==false && turnHasHappened==true) {
      //println(row+" "+column);
      selected=true;
      selectedPiece=this;
      pieceSelected=true;
      mouseDelay=true;
      turnHasHappened=false;
      legalMoves.clear();
    }
    if (selected==true && mousePressed==true && mouseButton==RIGHT) {
      unSelect();
    }
    if (selected==true) {
      move(false);
    }
  }
  public void unSelect() {
    selected=false;
    selectedPiece=this;
    pieceSelected=false;
    selectedPiece=null;
    mouseDelay=false;
    deselectPositions();
    hasCalculated=false;
    legalMoves.clear();
  }
  public void setImage() {
    if (type==-1) {
      pieceImage= loadImage("white_"+name+".png");
    } else if (type==1) {
      pieceImage= loadImage("black_"+name+".png");
    }
  }
  public void calculatePosition() {
    this.column=int((this.x-150)/100);
    this.row=int((this.y-150)/100);
  }
  public void deselectPositions() {
    for (int i=0; i<legalMoves.size(); i++) {
      if (legalMoves.get(i)!=null) {
        legalMoves.get(i).setLegalMove(false);
      }
    }
    legalMoves.clear();
  }
  public void setCurrentX(int newCurrentX) {
    this.column=newCurrentX;
  }
  public void setCurrentY(int newCurrentY) {
    this.row=newCurrentY;
  }
  public void move(boolean AI)
  {
    if (AI==false) {
      calculatePosition();
      if (hasCalculated==false) {
        caculateMoves(false);
        if (type==-1) {
          whiteMovesCheck();
        } else {
          blackMovesCheck();
        }
        hasCalculated=true;
      }
    }
    if (selectedSpot!=null) {
      for (int i=0; i<this.legalMoves.size() || AI==true; i++) {
        if (legalMoves.get(i)!=null || AI==true) {
          if (selectedSpot==legalMoves.get(i) || AI==true) {
            if (this.name=="king" && this.type==-1) {
              if (row==7 && column==4 &&selectedSpot.getArrayRow()==7 &&selectedSpot.getColumn()==6) {
                for (int j=0; j<whitePieces.size(); j++) {
                  if (whitePieces.get(j).name()=="rook") {
                    Rook selectedPiece=(Rook)whitePieces.get(j);
                    if (selectedPiece.isLeftPiece()==false) {
                      whitePieces.get(j).setX(mainBoard[7][5].getX());
                      whitePieces.get(j).setY(mainBoard[7][5].getY());
                    }
                  }
                }
              }
              if (row==7 && column==4 &&selectedSpot.getArrayRow()==7 &&selectedSpot.getColumn()==2) {
                for (int j=0; j<whitePieces.size(); j++) {
                  if (whitePieces.get(j).name()=="rook") {
                    Rook selectedPiece=(Rook)whitePieces.get(j);
                    if (selectedPiece.isLeftPiece()==true) {
                      whitePieces.get(j).setX(mainBoard[7][3].getX());
                      whitePieces.get(j).setY(mainBoard[7][3].getY());
                    }
                  }
                }
              }
            } else if (this.name=="king" && this.type==1) {
              if (row==0 && column==4 &&selectedSpot.getArrayRow()==0 &&selectedSpot.getColumn()==6) {
                for (int j=0; j<blackPieces.size(); j++) {
                  if (blackPieces.get(j).name()=="rook") {
                    Rook selectedPiece=(Rook)blackPieces.get(j);
                    if (selectedPiece.isLeftPiece()==false) {
                      blackPieces.get(j).setX(mainBoard[0][5].getX());
                      blackPieces.get(j).setY(mainBoard[0][5].getY());
                    }
                  }
                }
              }
              if (row==0 && column==4 &&selectedSpot.getArrayRow()==0 &&selectedSpot.getColumn()==2) {
                for (int j=0; j<blackPieces.size(); j++) {
                  if (blackPieces.get(j).name()=="rook") {
                    Rook selectedPiece=(Rook)blackPieces.get(j);
                    if (selectedPiece.isLeftPiece()==true) {
                      blackPieces.get(j).setX(mainBoard[0][3].getX());
                      blackPieces.get(j).setY(mainBoard[0][3].getY());
                    }
                  }
                }
              }
            }
            if (name=="king") {
              King newKing= (King)this;
              if (newKing.getOldSpot()==selectedSpot) {
                if (type==-1) {
                  whiteRepeat++;
                }
                if (type==1) {
                  blackRepeat++;
                }
              } else {
                if (type==-1) {
                  whiteRepeat=0;
                }
                if (type==1) {
                  blackRepeat=0;
                }
              }
              newKing.setOldSpot(selectedSpot);
            }
            mainBoard[row][column].setCurrentPiece(0);
            this.x=selectedSpot.getX();
            this.y=selectedSpot.getY();
            selectedSpot.setCurrentPiece(this.type);
            selected=false;
            selectedPiece=null;
            pieceSelected=false;
            selectedSpot=null;
            beenMoved=true;
            mouseDelay=false;
            hasCalculated=false;
            numMoves++;
            if(gameType!=2){
               turn*=-1;
               turnChange=true;
            }
            if (name=="pawn") {
              turnsSince=0;
            } else {
              turnsSince++;
            }
            blackPawns.clear();
            whitePawns.clear();
            calculatePosition();
            if (name=="pawn" && type==-1 && row==2) {
              Pawn jumper= (Pawn)this;
              if (jumper.removePawn()!=-1 && blackPieces.get(jumper.removePawn()).getColumn()==this.column) {
                mainBoard[blackPieces.get(jumper.removePawn()).getArrayRow()][blackPieces.get(jumper.removePawn()).getColumn()].setCurrentPiece(0);
                blackPieces.remove(jumper.removePawn());
                jumper.resetRemover();
              }
            }
            if (name=="pawn" && type==1 && row==5) {
              Pawn jumper= (Pawn)this;
              if (jumper.removePawn()!=-1 && whitePieces.get(jumper.removePawn()).getColumn()==this.column) {
                mainBoard[whitePieces.get(jumper.removePawn()).getArrayRow()][whitePieces.get(jumper.removePawn()).getColumn()].setCurrentPiece(0);
                whitePieces.remove(jumper.removePawn());
                jumper.resetRemover();
              }
            }
            if (name=="pawn" && type==1 && row==3 && numMoves==1) {
              blackPawns.add(this);
            }
            if (name=="pawn" && type==-1 && row==4 && numMoves==1) {
              whitePawns.add(this);
            }
            if (name=="pawn") {
              Pawn jumper=(Pawn)this;
              jumper.resetRemover();
            }
            deselectPositions();
            destoryPiece();
            if (AI==true) {
              AI=false;
              break;
            }
          }
        }
      }
    }
  }
  public void destoryPiece() {
    if (type==-1) {
      for (int i=0; i<blackPieces.size(); i++) {
        if (blackPieces.get(i).getArrayRow()==row && blackPieces.get(i).getColumn()==column) {
          if (blackPieces.get(i).name()=="king") {
            winningPlayer=-1;
            gameOver=true;
            gameOverFrame=frameCount;
          }
          if(gameType==2){
            whiteBrain.addPoints(blackPieces.get(i).getPoints());
          }
          blackPieces.remove(i);
          turnsSince=0;
        }
      }
    } else {
      for (int i=0; i<whitePieces.size(); i++) {
        if (whitePieces.get(i).getArrayRow()==this.row && whitePieces.get(i).getColumn()==this.column) {
          if (whitePieces.get(i).name()=="king") {
            winningPlayer=1;
            gameOver=true;
            gameOverFrame=frameCount;
          }
          if(gameType==2){
            blackBrain.addPoints(whitePieces.get(i).getPoints());
          }
          whitePieces.remove(i);
          turnsSince=0;
        }
      }
    }
  }
  public void addLegalMove(boardSpot newMove) {
    this.legalMoves.add(newMove);
  }
  public void setSelected(boolean selected) {
    this.selected=selected;
  }
  public void setPieceNumber(int number) {
    this.pieceNumber=number;
  }
  public int getPieceNumber() {
    return pieceNumber;
  }
  public void clearMoves() {
    legalMoves.clear();
  }
  public void setX(float newX) {
    this.x=newX;
  }
  public void setY(float newY) {
    this.y=newY;
  }
  public void caculateMoves(boolean kingCalc) {
  }
  public int getPoints(){
    return points;
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public int getColumn() {
    return column;
  }
  public int getArrayRow() {
    return row;
  }
  public String name() {
    return name;
  }
  public ArrayList<boardSpot> getAllMoves() {
    return legalMoves;
  }
  public boolean hasMoved() {
    return beenMoved;
  }
  public int getNumMoves() {
    return numMoves;
  }
  public void whiteMovesCheck() {
    for (int i=0; i<legalMoves.size(); i++) {
      if (legalMoves.get(i)!=null) {
        Piece tempPiece=null;
        int oldRow=row;
        int oldColumn=column;
        mainBoard[row][column].setCurrentPiece(0);
        this.row=legalMoves.get(i).getArrayRow();
        this.column=legalMoves.get(i).getColumn();
        int oldType=mainBoard[row][column].getCurrentPiece();
        mainBoard[row][column].setCurrentPiece(type);
        if (oldType==1) {
          for (int j=0; j<blackPieces.size(); j++) {
            if (blackPieces.get(j).getArrayRow()==row && blackPieces.get(j).getColumn()==column) {
              tempPiece=blackPieces.get(j);
              blackPieces.remove(j);
            }
          }
        }
        whiteCheckedTest=false;
        checkWhiteInCheckTest();
        if (whiteCheckedTest==true) {
          mainBoard[row][column].setCurrentPiece(oldType);
          this.row=oldRow;
          this.column=oldColumn;
          mainBoard[row][column].setCurrentPiece(type);
          legalMoves.get(i).setLegalMove(false);
          legalMoves.set(i, null);
          whiteCheckedTest=false;
        } else {
          mainBoard[row][column].setCurrentPiece(oldType);
          this.row=oldRow;
          this.column=oldColumn;
          mainBoard[row][column].setCurrentPiece(type);
        }
        if (tempPiece!=null) {
          blackPieces.add(tempPiece);
        }
      }
    }
  }
  public void blackMovesCheck() {
    for (int i=0; i<legalMoves.size(); i++) {
      if (legalMoves.get(i)!=null) {
        Piece tempPiece=null;
        int oldRow=row;
        int oldColumn=column;
        mainBoard[row][column].setCurrentPiece(0);
        this.row=legalMoves.get(i).getArrayRow();
        this.column=legalMoves.get(i).getColumn();
        int oldType=mainBoard[row][column].getCurrentPiece();
        mainBoard[row][column].setCurrentPiece(type);
        if (oldType==-1) {
          for (int j=0; j<whitePieces.size(); j++) {
            if (whitePieces.get(j).getArrayRow()==row && whitePieces.get(j).getColumn()==column) {
              tempPiece=whitePieces.get(j);
              whitePieces.remove(j);
            }
          }
        }
        blackCheckedTest=false;
        checkBlackInCheckTest();
        if (blackCheckedTest==true) {
          mainBoard[row][column].setCurrentPiece(oldType);
          this.row=oldRow;
          this.column=oldColumn;
          mainBoard[row][column].setCurrentPiece(type);
          legalMoves.get(i).setLegalMove(false);
          legalMoves.set(i, null);
          blackCheckedTest=false;
        } else {
          mainBoard[row][column].setCurrentPiece(oldType);
          this.row=oldRow;
          this.column=oldColumn;
          mainBoard[row][column].setCurrentPiece(type);
        }
        if (tempPiece!=null) {
          whitePieces.add(tempPiece);
        }
      }
    }
  }
}
