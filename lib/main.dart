import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "Which of these is the best show?",
      'answers': [
        {'text': "Friends", 'score': 10},
        {'text': "Seinfeld", 'score': 1},
        {'text': "RuPaul's Drag Race", 'score': 2},
        {'text': "Family Guy", 'score': 7}
      ],
    },
    {
      'questionText': "Which most closely aligns to your purpose?",
      'answers': [
        {'text': "To serve God", 'score': 10},
        {'text': "To serve myself", 'score': 3},
        {'text': "To serve others", 'score': 5},
        {'text': "To serve myself, but say I'm serving others", 'score': 1},
      ],
    },
    {
      'questionText': "Which of the following is the greatest person?",
      'answers': [
        {'text': "Janet Verwolf", 'score': 3},
        {'text': "Will Wright", 'score': 3},
        {'text': "Sam Harris", 'score': 1},
        {'text': "Larry David", 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
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
