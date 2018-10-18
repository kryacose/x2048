import 'package:flutter/material.dart';
import './gamePage.dart';
import '../UI/sizeSelectionButton.dart';

class LandingPage extends StatefulWidget {
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedSize = 4;
  int selectedFlex = 1;
  double sizeSelectorButtonSize = 60.0;


  void selectSize(int value){
    selectedSize = 3 + value;
    this.setState(() {
      selectedFlex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "2048",
              style: TextStyle(fontSize: 80.0, color: Colors.white),
            ),

            Container(
              height: 50.0,
            ),

            // Size Selector
            Material(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF252525),
              child: Stack(
                // fit: StackFit.expand,
                children: <Widget>[

                  Container(
                    width: 3* sizeSelectorButtonSize,
                    child: Row(
                      children: <Widget>[

                        Expanded(
                          flex: selectedFlex,
                          child: Container(),
                          ),

                        Container(
                          width: sizeSelectorButtonSize,
                          height: sizeSelectorButtonSize,
                          
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),

                        Expanded(
                          flex: 2 - selectedFlex,
                          child: Container(),
                          ),

                      ],
                    )
                  ),


                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizeSelectionButton(sizeSelectorButtonSize, 3, () => selectSize(0)),
                      SizeSelectionButton(sizeSelectorButtonSize, 4, () => selectSize(1)),
                      SizeSelectionButton(sizeSelectorButtonSize, 5, () => selectSize(2)),
                    ],
                  ),

                  
                ],
              ),
            ),

            Container(
              height: 50.0,
            ),

            // Start Button
            RawMaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Text(
                "START",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              fillColor: Colors.greenAccent,
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new GamePage(selectedSize))),
            )
          ],
        ),
      ),
    );
  }
}
