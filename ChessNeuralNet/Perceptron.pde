public class Perceptron
{
  float[] weights; //used to calculate an output based on inputs
  float c= 0.01; //learning constraint
  //first GEN, weights are random
  public Perceptron(int numWeights)
  {
    //set how many weights we will have and then when first made, creates a set of random weights
    weights= new float[numWeights];
    for(int i=0; i<numWeights; i++)
    {
      weights[i]= random(0,1);
    }
  }
  //all other gen, weights are not random
  public Perceptron(float[] weights)
  {
    this.weights= weights;
  }
  //takes in the input nodes, must have same amount of weights as inputs
  public Move output(ArrayList<Move> yourMoves,ArrayList<Move> enemyMoves,ArrayList<Move> yourPositions,ArrayList<Move> enemyPositions)
  {
    float sum=0;
    for(int i=0; i<yourMoves.size();i++)
    {
      sum+= yourMoves.get(i).getPieceNumber()*weights[0];
      sum+= yourMoves.get(i).getSpotNumber()*weights[0];
    }
    for(int i=0; i<enemyMoves.size();i++)
    {
      sum+= enemyMoves.get(i).getPieceNumber()*weights[1];
      sum+= enemyMoves.get(i).getSpotNumber()*weights[1];
    }
    for(int i=0; i<yourPositions.size();i++)
    {
      sum+= yourPositions.get(i).getPieceNumber()*weights[2];
      sum+= yourPositions.get(i).getSpotNumber()*weights[2];
    }
    for(int i=0; i<enemyPositions.size();i++)
    {
      sum+= enemyPositions.get(i).getPieceNumber()*weights[3];
      sum+= enemyPositions.get(i).getSpotNumber()*weights[3];
    }
    int maxSum=5000;
    return activate(sum,yourMoves, maxSum);
  }
  public Move activate(float sum,ArrayList<Move> yourMoves, int maxSum)
  {
    int selection= int((sum/maxSum)*yourMoves.size());
    //println(yourMoves.size());
    if(yourMoves.size()==0){
      
    }
    return yourMoves.get(selection);
  }
  
  public float[] getWeights()
  {
    return weights;
  }
}
