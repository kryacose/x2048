import 'package:flutter/material.dart';
import '../pages/gamePage.dart';
import './numTile.dart';

class GameBoard extends StatefulWidget {
  // List<List<int>> grid;
  _GameBoardState createState() => _GameBoardState();

  // GameBoard(this._onGesture);
}

class _GameBoardState extends State<GameBoard> {

  void _onHorizontal(){
    print("Horizontal");
  }
  void _onVertical(){
    print("Horizontal");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (gestureDetails) => GamePage.of(context).gestureHandle(gestureDetails, 1),
      onVerticalDragEnd: (gestureDetails) => GamePage.of(context).gestureHandle(gestureDetails, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Material(
          color: Color(0xFF252525),
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: 400.0,
            height: 393.0,
            child: GridView.count(
              primary: true,
              crossAxisCount: 4,
              padding: EdgeInsets.all(10.0),
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7.0,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                NumTile(10.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
                NumTile(20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
