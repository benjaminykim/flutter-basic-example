import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 15},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 10},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 15},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 10},
        {'text': 'Snake', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite meal?',
      'answers': [
        {'text': 'Lasagna', 'score': 15},
        {'text': 'Burger', 'score': 5},
        {'text': 'Taco', 'score': 10},
        {'text': 'Egg', 'score': 1},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(
      () {
        _questionIndex = 0;
        _totalScore = 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
