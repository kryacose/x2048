import 'package:flutter/material.dart';
import '../UI/gameBoard.dart';

class GamePage extends StatefulWidget {

  _GamePageState createState() => _GamePageState();


  static _GamePageState of(BuildContext context) {
    final _GamePageState navigator =
        context.ancestorStateOfType(const TypeMatcher<_GamePageState>());

    assert(() {
      if (navigator == null) {
        throw new FlutterError(
            'MyStatefulWidgetState operation requested with a context that does '
            'not include a MyStatefulWidget.');
      }
      return true;
    }());

    return navigator;
  }

}

class _GamePageState extends State<GamePage> {
  void gestureHandle(DragEndDetails details, int dir) {
    // print(details.primaryVelocity);
    if(dir == 0 && details.primaryVelocity>0) print("down");
    if(dir == 0 && details.primaryVelocity<0) print("up");
    if(dir == 1 && details.primaryVelocity>0) print("right");
    if(dir == 1 && details.primaryVelocity<0) print("left");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            new Container(
              height: 60.0,
            ),
            //Info Area
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: new Text(
                    "2048",
                    style: new TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
              ],
            ),

            new Container(height: 80.0,),
            //GameBoard
            new GameBoard(),
          ],
        ),
      ),
    ]);
  }
}
