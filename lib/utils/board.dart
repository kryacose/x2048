import 'dart:math';
// import 'dart:io';

class Board{
  List<List<int>> grid;
  int score;
  int size;

  Board(int size){
    this.size = size;
    this.score = 0;
    this.grid = new List<List<int>>();

    for(var i = 0; i < size; i++) {
      List<int> list = new List<int>();
      for (var j = 0; j < size; j++) {
        list.add(0);
      }
      grid.add(list);
    }

    print("\nNew Board created,  score $score,    size $size");
    // randomNum();
  }

  Board copy(Board old){
    this.size = old.size;
    this.score = old.score;

    this.grid = new List<List <int>>();
    for(var i = 0; i < this.size; i++) {
      List<int> list = new List<int>();
      for (var j = 0; j < this.size; j++)
        list.add(old.grid[i][j]);
      this.grid.add(list);
    }

    return this;
  }

  void display(){
    print("\nScore: $score\nSize: $size");
    for(var i=0; i<size; i++){
      print(grid[i]);
    }
  }

  int gridDifference(List<List<int>> gridnew){

    int sum = 0;
    for (var i = 0; i < size; i++) 
      for (var j = 0; j < size; j++) {
        sum += (grid[i][j] - gridnew[i][j]).abs();
      }

    return sum;
  }

   int zeroCount(){
    int sum = 0;
    for(var i=0; i<size; i++)
      for(var j=0; j<size; j++)
        if(grid[i][j] == 0) sum++;

    return sum;
  }

  int randomNum(){
    if(zeroCount() <= 0) return 0;
    
    var rnd = new Random();
    int num = (rnd.nextInt(2) + 1)*2;
    int loc = rnd.nextInt(16);
    while( this.grid[loc~/size][loc%size] != 0)
      loc = rnd.nextInt(16);
    this.grid[loc~/size][loc%size] = num;

    print("\nRandom number $num at location $loc");
    return 1;
  }

  int putNum(int number, int loc){
    if(grid[loc~/size][loc%size] != 0) return 0;

    grid[loc~/size][loc%size] = number;
    return 1;
  }

 

  void up(){
    print("UP");
    
    for(int i=0; i<this.size; i++){
      int done = 0;
      for(int j=1; j<this.size; j++){
        int loc = j;
        if(this.grid[j][i] == 0) continue;
        for(int k=j-1; k>=0; k--){
          if(this.grid[k][i] == 0) loc = k;
          else if(this.grid[k][i] == this.grid[j][i] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(this.grid[loc][i] == 0){
          this.grid[loc][i] = this.grid[j][i];
          this.grid[j][i] = 0;
        }

        else if(this.grid[loc][i] == this.grid[j][i] && loc!=j){
          this.grid[loc][i] *= 2;
          score += this.grid[i][loc];
          this.grid[j][i] = 0;
        }
      }
    }
  }

  void down(){
    print("DOWN");
    
    for(int i=0; i<this.size; i++){
      int done = 0;
      for(int j=this.size-2; j>=0; j--){
        int loc = j;
        if(this.grid[j][i] == 0) continue;
        for(int k=j+1; k<size; k++){
          if(this.grid[k][i] == 0) loc = k;
          else if(this.grid[k][i] == this.grid[j][i] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(this.grid[loc][i] == 0){
          this.grid[loc][i] = this.grid[j][i];
          this.grid[j][i] = 0;
        }

        else if(this.grid[loc][i] == this.grid[j][i] && loc!=j){
          this.grid[loc][i] *= 2;
          score += this.grid[i][loc];
          this.grid[j][i] = 0;
        }
      }
    }
    
  }

  void left(){
    print("LEFT");
    
    for(int i=0; i<this.size; i++){
      int done = 0;
      for(int j=1; j<this.size; j++){
        int loc = j;
        if(this.grid[i][j] == 0) continue;
        for(int k=j-1; k>=0; k--){
          if(this.grid[i][k] == 0) loc = k;
          else if(this.grid[i][k] == this.grid[i][j] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(this.grid[i][loc] == 0){
          this.grid[i][loc] = this.grid[i][j];
          this.grid[i][j] = 0;
        }

        else if(this.grid[i][loc] == this.grid[i][j] && loc!=j){
          this.grid[i][loc] *= 2;
          score += this.grid[i][loc];
          this.grid[i][j] = 0;
        }
      }
    }
    
  }

  void right(){
    print("RIGHT");
    
    for(int i=0; i<this.size; i++){
      int done = 0;
      for(int j=this.size-2; j>=0; j--){
        int loc = j;
        if(this.grid[i][j] == 0) continue;
        for(int k=j+1; k<size; k++){
          if(this.grid[i][k] == 0) loc = k;
          else if(this.grid[i][k] == this.grid[i][j] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(this.grid[i][loc] == 0){
          this.grid[i][loc] = this.grid[i][j];
          this.grid[i][j] = 0;
        }

        else if(this.grid[i][loc] == this.grid[i][j] && loc!=j){
          this.grid[i][loc] *= 2;
          score += this.grid[i][loc]; 
          this.grid[i][j] = 0;
        }
      }
    }
  }

  Board moveUp(){
    Board newBoard = new Board(this.size).copy(this);
    newBoard.up();
    if(gridDifference(newBoard.grid) > 0)
      newBoard.randomNum();
    return newBoard;
  }

  Board moveDown(){
    Board newBoard = new Board(this.size).copy(this);
    newBoard.down();
    if(gridDifference(newBoard.grid) > 0)
      newBoard.randomNum();
    return newBoard;
  }

  Board moveLeft(){
    Board newBoard = new Board(this.size).copy(this);
    newBoard.left();
    if(gridDifference(newBoard.grid) > 0)
      newBoard.randomNum();
    return newBoard;
  }

  Board moveRight(){
    Board newBoard = new Board(this.size).copy(this);
    newBoard.right();
    if(gridDifference(newBoard.grid) > 0)
      newBoard.randomNum();
    return newBoard;
  }


}




void main(){
  print("Hello");
  Board b = new Board(4);
  b.randomNum();
  b.display();
  b = b.moveUp();
  b.display();
}