import 'package:flutter/material.dart';

import 'package:first_app/result.dart';
import './quiz.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return _MyAppSate();
  }
}

class _MyAppSate extends State <MyApp>
{
  static const _questions = [
    {'questionText': 'What\'s your favourite color', //0
      'answer': [
        {'text': 'red','score': 1},
        {'text':'yellow', 'score': 2},
        {'text':'blue', 'score': 3},
        {'text':'black', 'score': 4}]
    },
    {'questionText': 'What\'s your favourite Animal', //1
      'answer': [
        {'text': 'Horse','score': 1},
        {'text':'Fish', 'score': 2},
        {'text':'Cat', 'score': 3},
        {'text':'Dog', 'score': 4}]
    },
    {'questionText': 'What\'s your favourite Food', //2
      'answer': [
        {'text': 'Eggplant','score': 0},
        {'text':'Bread', 'score': 2},
        {'text':'Pizza', 'score': 3},
        {'text':'Croissant', 'score': 4}]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz()
  {
    setState(()
    {_questionIndex = 0;
    _totalScore = 0;
    });

  }

  void _answerQuestion(int score)
  {
    _totalScore += score;

    setState(()
    {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first app'),
      ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questions: _questions,
          questionIndex: _questionIndex,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}