import 'dart:ui';

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget
{
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex
  });

  @override
  Widget build(BuildContext context)
  {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}