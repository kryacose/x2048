import 'package:flutter/material.dart';
import '../UI/gameBoard.dart';
import '../utils/board.dart';

class GamePage extends StatefulWidget {
  Board b;

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
    if (dir == 0 && details.primaryVelocity > 0)
      this.setState(() {
        widget.b.moveDown();
        widget.b.display();
      });
    else if (dir == 0 && details.primaryVelocity < 0)
      this.setState(() {
        widget.b.moveUp();
        widget.b.display();
      });
    else if (dir == 1 && details.primaryVelocity > 0)
      this.setState(() {
        widget.b.moveRight();
        widget.b.display();
      });
    else if (dir == 1 && details.primaryVelocity < 0)
      this.setState(() {
        widget.b.moveLeft();
        widget.b.display();
      });
  }

  @override
  initState() {
    super.initState();

    widget.b = new Board(4);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        // width: double.infinity,
        color: Colors.black,
        child: Column(
          children: <Widget>[
            new Container(
              height: 60.0,
            ),
            //Info Area
            Material(
              color: new Color(0x00000000),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    new Text(
                      "2048",
                      style: new TextStyle(
                          color: Colors.white, fontSize: 60.0),
                    ),
                    new Expanded(child: new Container()),
                    new Container(
                      child: Material(
                          color: Color(0xFF252525),
                          borderRadius: BorderRadius.circular(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "SCORE",
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                                Text(
                                  widget.b.score.toString(),
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                    RawMaterialButton(
                      shape: CircleBorder(),
                      onPressed: (){this.setState((){widget.b = new Board(4);});},
                      child: Icon(
                        Icons.autorenew,
                        color: Colors.white,
                        size: 50.0,),
                    )
                  ],
                ),
              ),
            ),

            new Container(
              height: 80.0,
            ),
            //GameBoard
            new GameBoard(widget.b.grid, widget.b.size),
          ],
        ),
      ),
    ]);
  }
}
