import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import './question.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max']
    },
  ];
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < questions.length) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < questions.length
              ? Column(
                  children: [
                    Question(questions[_questionIndex]['questionText']),
                    // ... here s they take a list which is exactly what we have here
                    // and they pull all the values in the list out of it
                    // and add them to the surrounding list as individual values,
                    // so that we don't add a list to a list but the values of a list to a list,
                    // having only one list without a nested list.
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(_answerQuestion, answer);
                    }).toList()
                  ],
                )
              : Center(
                  child: Text('You did it!'),
                )),
    );
  }
}
