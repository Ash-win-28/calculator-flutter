import 'package:flutter/material.dart';

class CalciButtons extends StatelessWidget {
  CalciButtons(
      {@required this.colour,
      @required this.textColour,
      @required this.buttonNum,
      @required this.onTapped});

  final colour;
  final textColour;
  final buttonNum;
  final onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            color: colour,
            child: Center(
              child: Text(
                buttonNum,
                style: TextStyle(
                  fontSize: 25.0,
                  color: textColour,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
