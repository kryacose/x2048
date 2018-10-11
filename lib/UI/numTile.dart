import 'package:flutter/material.dart';

class NumTile extends StatelessWidget {
  final double size;
  final int value = 0;
  // var color = new Color(0xFFFF9000);

  NumTile(this.size);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: new Color(0x00000000),
      child: Container(
        height: size,
        width: size,
        decoration: new BoxDecoration(
            color: Color(0xFFFF9000),
            border: new Border.all(color: Color(0x00000000), width: 0.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Text("2", style: TextStyle(fontSize: 40.0,),
          )
        ),
      ),
    );
  }
}

