import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  // VoidCallback tells flutter we get a function that does not accept an argument
  // it's a more specific type of Function

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
