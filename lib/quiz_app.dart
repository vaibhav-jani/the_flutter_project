import 'package:flutter/material.dart';
import 'package:the_flutter_project/quiz.dart';
import 'package:the_flutter_project/result.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 9},
        {'text': 'Green', 'score': 8},
        {'text': 'White', 'score': 12}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 9},
        {'text': 'Elephant', 'score': 8},
        {'text': 'Lion', 'score': 12}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 9},
        {'text': 'Max', 'score': 8},
        {'text': 'Max', 'score': 12}
      ],
    },
  ];

  int _totalScore = 0;

  void _answerQuestion(int score) {
    setState(
      () {
        _totalScore += score;
        _questionIndex = (_questionIndex + 1);
      },
    );
    print(_questionIndex);
  }

  void _restart() {
    setState(
      () {
        _totalScore = 0;
        _questionIndex = 0;
      },
    );
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('My First App'),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _questionIndex, _answerQuestion)
            : Result(_restart, _totalScore),
      ),
    );
  }
}
