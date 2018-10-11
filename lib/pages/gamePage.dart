import 'package:flutter/material.dart';
import '../UI/gameBoard.dart';

class GamePage extends StatefulWidget {
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
           Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: <Widget>[

            new Container(height: 60.0,),
            //Info Area
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: new Text("2048", style: new TextStyle( color: Colors.white, fontSize:40.0),),
                ),
              ],
            ),

            new Container(height: 80.0,),
            //GameBoard
            new GameBoard(),
            

       ],
           ),
        ),
      ]
    );
  }
}