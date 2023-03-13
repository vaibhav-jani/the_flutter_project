import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:the_flutter_project/quizs/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> _questions;

  final int _questionIndex;

  final Function _answerQuestion;

  const Quiz(this._questions, this._questionIndex, this._answerQuestion,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Question(
          _questions[_questionIndex]['questionText'] as String,
        ),
        ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>)
            .map(
          (answer) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Answer(() => _answerQuestion(answer['score']),
                  answer['text'] as String),
            );
          },
        ).toList()
      ],
    );
  }
}
