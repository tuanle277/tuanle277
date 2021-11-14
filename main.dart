import 'package:flutter/material.dart';
import 'dart:math';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var array = [];

  String correct = "Correct answer";

  int _questionIndex = 0;

  int _score = 0;

  Random random = Random();

  void _answerQuestion() {
    setState(() {
      // if (_questionIndex <= 0) _score = 0;
      // if (_questionIndex == questions.length - 1) {
      //   print("your score is " + (_score + 1).toString());
      //   _questionIndex = 0;
      // } else if (array[_questionIndex] == questionPressed) {
      //   _score++;
      //   _questionIndex++;
      // } else {
      //   _score--;
      //   _questionIndex++;
      //   _score++;
      // }
      if (_questionIndex == 3) {
        _questionIndex = 0;
      } else {
        _questionIndex++;
      }
    });
  }

  //main widget
  @override //decorator, makes the code cleaner and clearer
  Widget build(BuildContext context) {
    for (int i = 0; i < 4; i++) {
      array.add(random.nextInt(4));
    }

    final questions = [
      {
        'questionText': '1 + 1 = ?',
        'answerText': ['1', '2', '3', '4']
      },
      {
        'questionText': '2 * 3 = ?',
        'answerText': ['7', '5', '8', '6']
      },
      {
        'questionText': '5 * 34 = ?',
        'answerText': ['43', '23', '84', '653']
      },
      {
        'questionText': '9 * 23 = ?',
        'answerText': ['23', '43', '56', '72']
      }
    ];

    var answers = [2, 9, 600, 121];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is a title mate'),
        ),
        body: Column(
          children: [
            Text(
              "Quiz App",
              style: TextStyle(fontSize: 20),
            ),
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answerText'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
