// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'Who invented C++?',
      'answers': [
        {'text': 'Dennis Ritchie', 'score': 0},
        {'text': 'Ken Thompson', 'score': 0},
        {'text': 'Brian Kernighan', 'score': 0},
        {'text': 'Bjarne Stroustrup', 'score': 1},
      ],
    },
    {
      'questionText': 'What is C++?',
      'answers': [
        {'text': 'C++ is an object oriented programming language', 'score': 0},
        {'text': ' C++ is a procedural programming language', 'score': 0},
        {
          'text':
              'C++ supports both procedural and object oriented programming language',
          'score': 1
        },
        {'text': 'C++ is a functional programming language', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which of the following is the correct syntax of including a user defined header files in C++?',
      'answers': [
        {'text': '#include [userdefined]', 'score': 0},
        {'text': '#include “userdefined”', 'score': 1},
        {'text': '#include <userdefined.h>', 'score': 0},
        {'text': ' #include <userdefined>', 'score': 0},
      ],
    },
    {
      'questionText': 'Which of the following is used for comments in C++?',
      'answers': [
        {'text': '/* comment */', 'score': 0},
        {'text': '// comment */', 'score': 0},
        {'text': ' // comment', 'score': 0},
        {'text': 'both // comment or /* comment */', 'score': 1},
      ],
    },
    {
      'questionText':
          'What is the difference between delete and delete[] in C++?',
      'answers': [
        {
          'text':
              'delete is syntactically correct but delete[] is wrong and hence will give an error if used in any case',
          'score': 0
        },
        {
          'text':
              'delete is used to delete normal objects whereas delete[] is used to pointer objects',
          'score': 0
        },
        {
          'text': 'delete is a keyword whereas delete[] is an identifier',
          'score': 0
        },
        {
          'text':
              'delete is used to delete single object whereas delete[] is used to multiple(array/pointer of) objects',
          'score': 1
        },
      ],
    },
    {
      'questionText':
          'Which of the following user-defined header file extension used in c++?',
      'answers': [
        {'text': 'hg', 'score': 0},
        {'text': 'cpp', 'score': 1},
        {'text': 'cp', 'score': 0},
        {'text': 'pc', 'score': 0},
      ],
    },
    {
      'questionText': 'Which of the following is a correct identifier in C++?',
      'answers': [
        {'text': 'VAR_1234', 'score': 1},
        {'text': '\$var_name', 'score': 0},
        {'text': '7VARNAME', 'score': 0},
        {'text': '7var_name', 'score': 0},
      ],
    },
    {
      'questionText':
          'Which of the following is not a type of Constructor in C++?',
      'answers': [
        {'text': 'Default constructor', 'score': 0},
        {'text': 'Parameterized constructo', 'score': 0},
        {'text': 'Copy constructor', 'score': 0},
        {'text': 'Friend constructor', 'score': 1},
      ],
    },
    {
      'questionText': 'Which of the following approach is used by C++?',
      'answers': [
        {'text': 'Left-right', 'score': 0},
        {'text': 'Right-left', 'score': 0},
        {'text': 'Bottom-up', 'score': 1},
        {'text': 'Top-down', 'score': 0},
      ],
    },
    {
      'questionText': ' What is virtual inheritance in C++?',
      'answers': [
        {'text': 'C++ technique to enhance multiple inheritance', 'score': 0},
        {
          'text':
              'C++ technique to ensure that a private member of the base class can be accessed somehow',
          'score': 0
        },
        {
          'text': 'C++ technique to avoid multiple inheritances of classes',
          'score': 0
        },
        {
          'text':
              'C++ technique to avoid multiple copies of the base class into children/derived class',
          'score': 1
        },
      ],
    },
  ];
  var _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('C++ Quiz App'),
          foregroundColor: Color.fromARGB(221, 0, 0, 0),
          backgroundColor: Color.fromARGB(221, 204, 75, 75),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore,resetQuiz),
      ),
    );
  }
}
