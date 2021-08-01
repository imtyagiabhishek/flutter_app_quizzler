import 'package:flutter_app_quizzler/Question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        question: "this is the first question, and a it's true",
        questionAnswer: true),
    Question(
        question: 'this is the second question, and ans is false',
        questionAnswer: false),
    Question(
        question: "this is the third question, and ans is true this is last's",
        questionAnswer: true),
    Question(
        question: "this is the 4th question, and a it's true",
        questionAnswer: true),
    Question(
        question: 'this is the 5th question, and ans is false',
        questionAnswer: false),
    Question(
        question: "this is the 6th question, and ans is true this is last's",
        questionAnswer: true),
    Question(
        question: "this is the 7th question, and a it's true",
        questionAnswer: true),
    Question(
        question: 'this is the 8th question, and ans is false',
        questionAnswer: false),
    Question(
        question: "this is the last question, and ans is true this is last's",
        questionAnswer: true),
  ];

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
