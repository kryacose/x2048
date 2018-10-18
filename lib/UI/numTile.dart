import 'package:flutter/material.dart';

class NumTile extends StatelessWidget {
  final double size;
  final int value;
  // var color = new Color(0xFFFF9000);

  NumTile(this.size, this.value);

  Color tileColor(int num){
    if(num == 0) return Color(0xFF202020);
    else if(num == 2) return Color(0xFFeee4da);
    else if(num == 4) return Color(0xFFede0c8);
    else if(num == 8) return Color(0xFFf2b179);
    else if(num == 16) return Color(0xFFf59563);
    else if(num == 32) return Color(0xFFf67c5f);
    else if(num == 64) return Color(0xFFf65e3b);
    else if(num == 128) return Color(0xFFedcf72);
    else if(num == 256) return Color(0xFFedcc61);
    else if(num == 512) return Color(0xFFedc850);
    else if(num == 1024) return Color(0xFFedc53f);
    else if(num == 2048) return Color(0xFFedc22e);
    else return Color(0xFF3c3a32);
  }

  Color numColor(int num){

    if(num == 0) return Color(0xFF202020);
    else return Color(0xFF000000);

  }

  double numSize(int num){
    if(num>=1024) return 35.0;
    else return 40.0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0x00000000),
      child: Container(
        height: size,
        width: size,
        decoration: new BoxDecoration(
            color: tileColor(value),
            border: new Border.all(color: Color(0x00000000), width: 0.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: value == 0 ? Container() : Text("$value", style: TextStyle(fontSize: numSize(value), color: numColor(value)),
          )
        ),
      ),
    );
  }
}

