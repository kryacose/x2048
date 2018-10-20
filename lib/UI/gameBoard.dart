import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  final List<Widget> tiles;
  final size;

  _GameBoardState createState() => _GameBoardState();

  GameBoard(this.tiles, this.size);
}

class _GameBoardState extends State<GameBoard> {
  List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Material(
        color: Color(0xFF252525),
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: 400.0,
          height: 393.0,
          child: GridView.count(
              primary: true,
              crossAxisCount: widget.size,
              padding: EdgeInsets.all(10.0),
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7.0,
              physics: NeverScrollableScrollPhysics(),
              children: widget.tiles),
        ),
      ),
    );
  }
}
