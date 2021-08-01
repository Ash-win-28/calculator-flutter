import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.light(),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var questionText = '';
  var answerText = '';

  void equalFunction() {
    String question = questionText;
    question = question.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    var eval = exp.evaluate(EvaluationType.REAL, cm);

    answerText = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8FE),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      questionText,
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xFF5876E0),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answerText,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xFF5876E0),
                  ),
                ],
              ),
              color: Color(0xFF5876E0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFFF6F8FE),
              child: GridView.builder(
                itemCount: kButtonTexts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return CalciButtons(
                      colour: Color(0xFFE3EBFF),
                      textColour: Color(0xFF879FE5),
                      buttonNum: kButtonTexts[index],
                      onTapped: () {
                        setState(() {
                          questionText = '';
                          answerText = '';
                        });
                      },
                    );
                  } else if (index == 1) {
                    return CalciButtons(
                      colour: Color(0xFFE3EBFF),
                      textColour: Color(0xFF879FE5),
                      buttonNum: kButtonTexts[index],
                      onTapped: () {
                        setState(() {
                          questionText = questionText.substring(
                              0, questionText.length - 1);
                        });
                      },
                    );
                  } else if (index == kButtonTexts.length - 1) {
                    return CalciButtons(
                      colour: Color(0xFF5876E0),
                      textColour: Colors.white,
                      buttonNum: kButtonTexts[index],
                      onTapped: () {
                        setState(() {
                          equalFunction();
                        });
                      },
                    );
                  } else {
                    return CalciButtons(
                      colour: isOperator(kButtonTexts[index])
                          ? Color(0xFF5876E0)
                          : Color(0xFFF0F5FF),
                      textColour: isOperator(kButtonTexts[index])
                          ? Colors.white
                          : Color(0xFF778CD4),
                      buttonNum: kButtonTexts[index],
                      onTapped: () {
                        setState(() {
                          questionText += kButtonTexts[index];
                        });
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

bool isOperator(String a) {
  if (a == '+' || a == '/' || a == '-' || a == 'x' || a == '%' || a == '=') {
    return true;
  }
  return false;
}
