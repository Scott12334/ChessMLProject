public class boardSpot
{
  float x;
  float y;
  int type;
  color fill;
  int column;
  int row;
  boolean legalMove;
  boolean shouldRemove;
  int currentPiece; //0=none,1=black,-1=white
  int boardNumber;
  public boardSpot(float x, float y, int type)
  {
    this.x=x;
    this.y=y;
    this.type=type;
    switch(type){
      case -1:
      fill=255;
      break;
      
      case 1:
      fill=0;
      break;
    }
    calculatePosition();
    legalMove=false;
    shouldRemove=false;
  }
  public void calculatePosition(){
    this.column=int((this.x-150)/100);
    this.row=int((this.y-150)/100);
  }
  void display(){
    rectMode(CENTER);
    noStroke();
    if(legalMove==false){
      fill(fill);
    }
    else{
      fill(0,255,0);
    }
    square(x,y,100);
    if(mousePressed==true && pieceSelected==true && mouseButton==LEFT && dist(this.x,this.y,mouseX,mouseY)<49 && mouseDelay==false){
      selectedSpot=this;
      mouseDelay=true;
    }
    updatePiece();
  }
  public void updatePiece()
  {
    for(int i=0; i<whitePieces.size(); i++){
      if(whitePieces.get(i).getColumn()==column && whitePieces.get(i).getArrayRow()==row){
        currentPiece=-1;
        break;
      }
    }
    for(int i=0; i<blackPieces.size(); i++){
      if(blackPieces.get(i).getColumn()==column && blackPieces.get(i).getArrayRow()==row){
        currentPiece=1;
        break;
      }
    }
  }
  public int getBoardNumber(){return boardNumber;}
  public int getColumn(){return column;}
  public int getArrayRow(){return row;}
  public float getX(){return x;}
  public float getY(){return y;}
  public int getCurrentPiece(){return currentPiece;}
  public boolean shouldRemove(){return shouldRemove;}
  public void setShouldRemove(boolean newRemove){this.shouldRemove=newRemove;}
  public void setLegalMove(boolean isLegalMove){legalMove=isLegalMove;}
  public void setCurrentPiece(int currentPiece){this.currentPiece=currentPiece;}
  public void setBoardNumber(int number){this.boardNumber=number;}
}
