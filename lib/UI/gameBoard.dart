import 'package:flutter/material.dart';
import './numTile.dart';

class GameBoard extends StatefulWidget {
  // List<List<int>> grid;

  _GameBoardState createState() => _GameBoardState();
  

}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: new BoxDecoration(
          color: Color(0xFF121212),
          border: new Border.all(
            width: 400.0,
            color: Colors.black
          ),
          borderRadius: BorderRadius.circular(20.0)
        ),
        
        height: 400.0,
        child: Row(
          children: <Widget>[
            NumTile(20.0),
          ],
        )
      ),
    );
  }
}