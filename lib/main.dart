import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //throw UnimplementedError();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'what \s your favourite colour?',
      'answers': [
        {'text': 'red', 'score': 10},
        {'text': 'black', 'score': 6},
        {'text': 'blue', 'score': 3},
      ],
    },
    {
      'questionText': 'what\s your favourite author',
      'answers': [
        {'text': 'Basheer', 'score': 10},
        {'text': 'MT', 'score': 8},
        {'text': 'OV', 'score': 6},
      ],
    },
    {
      'questionText': 'what\s your favourite place',
      'answers': [
        {'text': 'Bali', 'score': 10},
        {'text': 'Maldives', 'score': 8},
        {'text': 'brazil', 'score': 6},
      ],
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("you have more questions");
    } else {
      print("NO more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Try'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
