import 'package:flutter/material.dart';

class NumTile extends StatelessWidget {

  final double size;
  final int value = 0;
  // var color = new Color(0xFFFF9000);

  NumTile(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: new BoxDecoration(
          color: Color(0xFFFF9000),
          border: new Border.all(
            color: Colors.black
          ),
          borderRadius: BorderRadius.circular(20.0)
        ),
      // child: Center(
      //   child: Text("2",style: TextStyle(fontSize: 10.0),)),
    );
  }
}