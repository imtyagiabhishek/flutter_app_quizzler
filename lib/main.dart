import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_quizzler/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = new QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeQuiz();
  }
}

class HomeQuiz extends StatefulWidget {
  @override
  _HomeQuizState createState() => _HomeQuizState();
}

class _HomeQuizState extends State<HomeQuiz> {
  List<Icon> iconAns = [];

  Widget setQuestion() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Text(
        quizBrain.getQuestion(),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  onPressFB() {
    setState(() {
      quizBrain.nextQuestion();
      setQuestion();
    });
  }

  _onAlertPress(context) {
    Alert(
      context: context,
      title: 'Finished!',
      desc: 'You\'ve reached the end of the quiz.',
    ).show();
  }

  checkAns(bool ans, context) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        _onAlertPress(context);
        quizBrain.reset();
        iconAns = [];
        print('no more question');
      } else {
        if (quizBrain.getQuestionAnswer() == ans) {
          iconAns.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          iconAns.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        onPressFB();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: setQuestion(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                padding: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Builder(
                    builder: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          height: 50,
                          color: Colors.green,
                          onPressed: () {
                            checkAns(true, context);
                          },
                          child: Text(
                            'True',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FlatButton(
                          height: 50,
                          color: Colors.red,
                          onPressed: () {
                            checkAns(false, context);
                          },
                          child: Text(
                            'False',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: iconAns,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
