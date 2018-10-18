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
    randomNum();
  }

  Board copy(Board old){
    this.size = old.size;
    this.score = old.score;

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

 

  Board up(){
    print("UP");
    Board newBoard = new Board(this.size).copy(this);
    


    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=1; j<size; j++){
        int loc = j;
        if(newBoard.grid[j][i] == 0) continue;
        for(int k=j-1; k>=0; k--){
          if(newBoard.grid[k][i] == 0) loc = k;
          else if(newBoard.grid[k][i] == newBoard.grid[j][i] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newBoard.grid[loc][i] == 0){
          newBoard.grid[loc][i] = newBoard.grid[j][i];
          newBoard.grid[j][i] = 0;
        }

        else if(newBoard.grid[loc][i] == newBoard.grid[j][i] && loc!=j){
          newBoard.grid[loc][i] *= 2;
          score += newBoard.grid[i][loc];
          newBoard.grid[j][i] = 0;
        }
      }
    }
    return newBoard;
  }

  Board down(){
    print("DOWN");
    Board newBoard = new Board(this.size).copy(this);
    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=size-2; j>=0; j--){
        int loc = j;
        if(newBoard.grid[j][i] == 0) continue;
        for(int k=j+1; k<size; k++){
          if(newBoard.grid[k][i] == 0) loc = k;
          else if(newBoard.grid[k][i] == newBoard.grid[j][i] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newBoard.grid[loc][i] == 0){
          newBoard.grid[loc][i] = newBoard.grid[j][i];
          newBoard.grid[j][i] = 0;
        }

        else if(newBoard.grid[loc][i] == newBoard.grid[j][i] && loc!=j){
          newBoard.grid[loc][i] *= 2;
          score += newBoard.grid[i][loc];
          newBoard.grid[j][i] = 0;
        }
      }
    }
    return newBoard;
    
  }

  Board left(){
    print("LEFT");
    Board newBoard = new Board(this.size).copy(this);

    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=1; j<size; j++){
        int loc = j;
        if(newBoard.grid[i][j] == 0) continue;
        for(int k=j-1; k>=0; k--){
          if(newBoard.grid[i][k] == 0) loc = k;
          else if(newBoard.grid[i][k] == newBoard.grid[i][j] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newBoard.grid[i][loc] == 0){
          newBoard.grid[i][loc] = newBoard.grid[i][j];
          newBoard.grid[i][j] = 0;
        }

        else if(newBoard.grid[i][loc] == newBoard.grid[i][j] && loc!=j){
          newBoard.grid[i][loc] *= 2;
          score += newBoard.grid[i][loc];
          newBoard.grid[i][j] = 0;
        }
      }
    }
    return newBoard;
    
  }

  Board right(){
    print("RIGHT");
    Board newBoard = new Board(this.size).copy(this);
    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=size-2; j>=0; j--){
        int loc = j;
        if(newBoard.grid[i][j] == 0) continue;
        for(int k=j+1; k<size; k++){
          if(newBoard.grid[i][k] == 0) loc = k;
          else if(newBoard.grid[i][k] == newBoard.grid[i][j] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newBoard.grid[i][loc] == 0){
          newBoard.grid[i][loc] = newBoard.grid[i][j];
          newBoard.grid[i][j] = 0;
        }

        else if(newBoard.grid[i][loc] == newBoard.grid[i][j] && loc!=j){
          newBoard.grid[i][loc] *= 2;
          score += newBoard.grid[i][loc]; 
          newBoard.grid[i][j] = 0;
        }
      }
    }
    return newBoard;
    
  }

  void moveUp(){
    Board newBoard = this.up();
    if(gridDifference(newBoard.grid) > 0){
      this.copy(newBoard);
      this.randomNum();
    }
    else
      this.grid = newBoard.grid;
  }

  void moveDown(){
    Board newBoard = this.down();
    if(gridDifference(newBoard.grid) > 0){
      this.grid = newBoard.grid;
      this.randomNum();
    }
    else
      this.grid = newBoard.grid;
  }

  void moveLeft(){
    Board newBoard = this.left();
    if(gridDifference(newBoard.grid) > 0){
      this.grid = newBoard.grid;
      this.randomNum();
    }
    else
      this.grid = newBoard.grid;
  }

  void moveRight(){
    Board newBoard = this.right();
    if(gridDifference(newBoard.grid) > 0){
      this.grid = newBoard.grid;
      this.randomNum();
    }
    else
      this.grid = newBoard.grid;
  }


}




void main(){
  print("Hello");
  Board b = new Board(4);
  b.display();
  b.moveUp();
  b.display();
}