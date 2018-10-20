import 'package:flutter/material.dart';

class SizeSelectionButton extends StatelessWidget {
  final double buttonSize;
  final int value;
  final VoidCallback _onPress;

  SizeSelectionButton(this.buttonSize, this.value, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 0.0,
        // fillColor: Color(0xFF252525),
        onPressed: () => _onPress(),
        child: Text(
          "$value",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      ),
    );
  }
}
