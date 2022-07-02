// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget
{
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);



  @override
  Widget build(BuildContext context){
    // ignore: prefer_const_constructors
    return Center(
      // ignore: prefer_const_constructors
      child: Column(
        children: <Widget>[
          Text(
            resultScore.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart'))
        ]
      )
    );
  }
}