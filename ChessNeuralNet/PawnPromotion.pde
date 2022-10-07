public void pawnPromotion(boolean whitePawn) {
  int x=350;
  if (whitePawn==true) {
    for (int i=0; i<whitePieceImages.length; i++) {
      stroke(0);
      strokeWeight(4);
      noFill();
      rect(x, 950, 100, 100);
      image(whitePieceImages[i], x, 950);
      if (mousePressed==true && mouseButton==LEFT && dist(mouseX, mouseY, x, 950)<50 && mouseDelay==false) {
        pawnChoice=i;
        mouseDelay=true;
      }
      x+=100;
    }
  } else {
    for (int i=0; i<blackPieceImages.length; i++) {
      stroke(0);
      strokeWeight(4);
      noFill();
      rect(x, 950, 100, 100);
      image(blackPieceImages[i], x, 950);
      if (mousePressed==true && mouseButton==LEFT && dist(mouseX, mouseY, x, 950)<50 && mouseDelay==false) {
        pawnChoice=i;
        mouseDelay=true;
      }
      x+=100;
    }
  }
}
