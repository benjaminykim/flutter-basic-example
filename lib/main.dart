import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var questions = [
      'What\'s your favorite animal?',
      'What\'s your favorite meal?',
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex >= 2) {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(children: <Widget>[
          Text(questions.elementAt(_questionIndex)),
          RaisedButton(
            child: Text('Answer 1'),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer 2'),
            onPressed: () => print('Answer 2 chosen!'),
          ),
          RaisedButton(
            child: Text('Answer 3'),
            onPressed: () {
              print('Answer 3 chosen!');
            },
          ),
        ]),
      ),
    );
  }
}
