public void train() {
  //finding brain with largest points
  Brain bestBrain=whiteBrains.get(0);
  for (int i=0; i<whiteBrains.size(); i++) {
    if (whiteBrains.get(i).getPoints()>bestBrain.getPoints()) {
      bestBrain=whiteBrains.get(i);
    }
    if (blackBrains.get(i).getPoints()>bestBrain.getPoints()) {
      bestBrain=blackBrains.get(i);
    }
  }
  //getting weights off brain
  float[] bestWeights=bestBrain.getWeights();
  saveBestWeight(bestWeights);
  //clearing old brains
  whiteBrains.clear();
  blackBrains.clear();
  
  //creating new brains based off of old weights
  float[] newWeights=bestWeights;
  for (int i=0; i<4; i++) {
    newWeights=bestWeights;
    for (int j=0; j<newWeights.length; j++)
    {
      if (newWeights[j]-.01<0) {
        newWeights[j] = newWeights[j] +random(-0.01, 0.01);
      }
      else{
        newWeights[j] = newWeights[j] +random(0, 0.01);
      }
    }
    whiteBrains.add(new Brain(-1,newWeights));
    
    newWeights=bestWeights;
    for (int j=0; j<newWeights.length; j++)
    {
      if (newWeights[j]-.01<0) {
        newWeights[j] = newWeights[j] +random(-0.01, 0.01);
      }
      else{
        newWeights[j] = newWeights[j] +random(0, 0.01);
      }
    }
    blackBrains.add(new Brain(1,newWeights));
  }
  //adding completly new brains
  whiteBrains.add(new Brain(-1));
  blackBrains.add(new Brain(1));
  println("Succesful train");
}
void saveBestWeight(float[] bestWeight){
  String[] save= new String[bestWeight.length];
  for(int i=0; i<bestWeight.length;i++){
    save[i]=bestWeight[i]+"";
  }
  saveStrings("weight_save.txt",save);
}
void newBrains(){
  for(int i=0; i<5; i++){
    whiteBrains.add(new Brain(-1));
    blackBrains.add(new Brain(1));
  }
}
public void AISetup(float[] bestWeights) {
  //clearing old brains
  whiteBrains.clear();
  blackBrains.clear();
  //creating new brains based off of old weights
  float[] newWeights=bestWeights;
  for (int i=0; i<4; i++) {
    newWeights=bestWeights;
    for (int j=0; j<newWeights.length; j++)
    {
      if (newWeights[j]-.01<0) {
        newWeights[j] = newWeights[j] +random(-0.01, 0.01);
      }
      else{
        newWeights[j] = newWeights[j] +random(0, 0.01);
      }
    }
    whiteBrains.add(new Brain(-1,newWeights));
    
    newWeights=bestWeights;
    for (int j=0; j<newWeights.length; j++)
    {
      if (newWeights[j]-.01<0) {
        newWeights[j] = newWeights[j] +random(-0.01, 0.01);
      }
      else{
        newWeights[j] = newWeights[j] +random(0, 0.01);
      }
    }
    blackBrains.add(new Brain(1,newWeights));
  }
  //adding completly new brains
  whiteBrains.set(0, new Brain(-1,bestWeights));
  whiteBrains.add(new Brain(-1));
  blackBrains.add(new Brain(1));
  println("Succesful train");
}
