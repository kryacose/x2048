import 'package:flutter/material.dart';
import '../UI/gameBoard.dart';
import '../UI/numTile.dart';
import '../utils/board.dart';

class GamePage extends StatefulWidget {
  final int size;

  GamePage(this.size);

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
  Board b;
  List<Widget> tiles;

  void makeTiles(){
    tiles = new List<Widget>();
    for (var i = 0; i < b.size * b.size; i++) {
      tiles.add(NumTile(20.0, b.grid[i ~/ b.size][i % b.size]));
    }
  }

  void gestureHandle(DragEndDetails details, int dir) {
    // print(details.primaryVelocity);
    if (dir == 0 && details.primaryVelocity > 0)
      this.setState(() {
        b = b.moveDown();
        b.display();
        makeTiles();
      });
    else if (dir == 0 && details.primaryVelocity < 0)
      this.setState(() {
        b = b.moveUp();
        b.display();
        makeTiles();
      });
    else if (dir == 1 && details.primaryVelocity > 0)
      this.setState(() {
        b = b.moveRight();
        b.display();
        makeTiles();
      });
    else if (dir == 1 && details.primaryVelocity < 0)
      this.setState(() {
        b = b.moveLeft();
        b.display();
        makeTiles();
      });
  }

  @override
  initState() {
    super.initState();

    b = new Board(widget.size);
    b.randomNum();
    makeTiles();
  }

  @override
  build(BuildContext context) {
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
                        color: Colors.white,
                        fontSize: 70.0,
                      ),
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
                                  b.score.toString(),
                                  style: new TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                    RawMaterialButton(
                      shape: CircleBorder(),
                      onPressed: () {
                        this.setState(() {
                          b = new Board(widget.size);
                          b.randomNum();
                        });
                      },
                      child: Icon(
                        Icons.autorenew,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    )
                  ],
                ),
              ),
            ),

            new Container(
              height: 80.0,
            ),

            //GameBoard
            GestureDetector(
                onHorizontalDragEnd: (gestureDetails) =>
                    gestureHandle(gestureDetails, 1),
                onVerticalDragEnd: (gestureDetails) =>
                    gestureHandle(gestureDetails, 0),
                child: GameBoard(tiles, b.size)),
          ],
        ),
      ),
    ]);
  }
}
