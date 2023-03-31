import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore > 20) {
      resultText = 'You are awesome!';
    } else if (resultScore > 15 && resultScore < 20) {
      resultText = 'You are Good!';
    } else {
      resultText = "Get better Score nexttime";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) return Colors.blue;
              return null; // Defer to the widget's default.
            }),
          ),
          onPressed: resetHandler,
          child: Text("Restart Quiz"),
        ),
      ],
    ));
  }
}
