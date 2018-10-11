import 'dart:math';
// import 'dart:io';

class Board{
  List<List<int>> grid;
  int score;
  int size;

  Board(size){
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
    this.randomNum();
  }

  void display(){
    print("\nScore: $score\nSize: $size");
    for(var i=0; i<size; i++){
      print(grid[i]);
    }
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

  int zeroCount(){
    int sum = 0;
    for(var i=0; i<size; i++)
      for(var j=0; j<size; j++)
        if(grid[i][j] == 0) sum++;

    return sum;
  }

  List<List<int>> up(){
    
    List<List<int>> newGrid = new List<List<int>>();

    for(var i = 0; i < size; i++) {
      List<int> list = new List<int>();
      for (var j = 0; j < size; j++)
        list.add(grid[i][j]);
      newGrid.add(list);
    }

    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=1; j<size; j++){
        int loc = j;
        if(newGrid[j][i] == 0) continue;
        for(int k=j-1; k>=0; k--){
          if(newGrid[k][i] == 0) loc = k;
          else if(newGrid[k][i] == newGrid[j][i] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newGrid[loc][i] == 0){
          newGrid[loc][i] = newGrid[j][i];
          newGrid[j][i] = 0;
        }

        else if(newGrid[loc][i] == newGrid[j][i] && loc!=j){
          newGrid[loc][i] *= 2;
          newGrid[j][i] = 0;
        }
      }
    }
    this.randomNum();
    return newGrid;
  }

  List<List<int>> down(){

    List<List<int>> newGrid = new List<List<int>>();

    for(var i = 0; i < size; i++) {
      List<int> list = new List<int>();
      for (var j = 0; j < size; j++)
        list.add(grid[i][j]);
      newGrid.add(list);
    }
    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=size-2; j>=0; j--){
        int loc = j;
        if(newGrid[j][i] == 0) continue;
        for(int k=j+1; k<size; k++){
          if(newGrid[k][i] == 0) loc = k;
          else if(newGrid[k][i] == newGrid[j][i] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newGrid[loc][i] == 0){
          newGrid[loc][i] = newGrid[j][i];
          newGrid[j][i] = 0;
        }

        else if(newGrid[loc][i] == newGrid[j][i] && loc!=j){
          newGrid[loc][i] *= 2;
          newGrid[j][i] = 0;
        }
      }
    }
    this.randomNum();
    return newGrid;
    
  }

  List<List<int>> left(){
    List<List<int>> newGrid = new List<List<int>>();

    for(var i = 0; i < size; i++) {
      List<int> list = new List<int>();
      for (var j = 0; j < size; j++)
        list.add(grid[i][j]);
      newGrid.add(list);
    }

    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=1; j<size; j++){
        int loc = j;
        if(newGrid[i][j] == 0) continue;
        for(int k=j-1; k>=0; k--){
          if(newGrid[i][k] == 0) loc = k;
          else if(newGrid[i][k] == newGrid[i][j] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newGrid[i][loc] == 0){
          newGrid[i][loc] = newGrid[i][j];
          newGrid[i][j] = 0;
        }

        else if(newGrid[i][loc] == newGrid[i][j] && loc!=j){
          newGrid[i][loc] *= 2;
          newGrid[i][j] = 0;
        }
      }
    }
    this.randomNum();
    return newGrid;
    
  }

  List<List<int>> right(){
    List<List<int>> newGrid = new List<List<int>>();

    for(var i = 0; i < size; i++) {
      List<int> list = new List<int>();
      for (var j = 0; j < size; j++)
        list.add(grid[i][j]);
      newGrid.add(list);
    }
    
    for(int i=0; i<size; i++){
      int done = 0;
      for(int j=size-2; j>=0; j--){
        int loc = j;
        if(newGrid[i][j] == 0) continue;
        for(int k=j+1; k<size; k++){
          if(newGrid[i][k] == 0) loc = k;
          else if(newGrid[i][k] == newGrid[i][j] && done == 0 ) {loc = k; done = 1; break;}
          else {done = 0; break;}
        }

        if(newGrid[i][loc] == 0){
          newGrid[i][loc] = newGrid[i][j];
          newGrid[i][j] = 0;
        }

        else if(newGrid[i][loc] == newGrid[i][j] && loc!=j){
          newGrid[i][loc] *= 2;
          newGrid[i][j] = 0;
        }
      }
    }
    this.randomNum();
    return newGrid;
    
  }
}




void main(){
  print("Hello");
  Board b = new Board(4);
  b.display();
  b.grid = b.left();
  b.display();
}