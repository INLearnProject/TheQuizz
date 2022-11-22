import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../controllers/quizz_controller.dart';
import '../ressources/quizz_builder.dart';

QuizzController quizzController = QuizzController();

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({super.key});

  @override
  QuizzScreenState createState() => QuizzScreenState();
}

class QuizzScreenState extends State<QuizzScreen> {
  final List<Widget> _score = [];
  List<Widget> _randomButton = [];
  int _counter = 0;
  late bool isFinished;

  @override
  void initState() {
    super.initState();
    isFinished = false;
    _randomButton = [
      QuizzBuilder.buildButton(
          onTap: () {
            setState(() {
              if (!isFinished) {
                if (quizzController.getAnswer(_counter) == true) {
                  _score.add(QuizzBuilder.check());
                } else {
                  _score.add(QuizzBuilder.close());
                }
              }
            });

            increment();
          },
          name: 'Vrai',
          color: Colors.green),
      QuizzBuilder.buildButton(
          name: 'Faux',
          onTap: () {
            setState(() {
              if (!isFinished) {
                if (quizzController.getAnswer(_counter) == false) {
                  _score.add(QuizzBuilder.check());
                } else {
                  _score.add(QuizzBuilder.close());
                }
              }
            });

            increment();
          },
          color: Colors.red)
    ];
  }

  void showResetAlert() {
    Alert(
        context: context,
        type: AlertType.info,
        title: 'Fin du quiz',
        desc: 'Le quiz est terminé, voulez-vous le relancer ?',
        buttons: <DialogButton>[
          QuizzBuilder.buttonDial(
              name: 'Non',
              onTap: () {
                Navigator.pop(context);
              }),
          QuizzBuilder.buttonDial(
              name: 'Oui',
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  quizzController.shuffleQuestions();
                  _counter = 0;
                  _score.clear();
                  isFinished = false;
                });
              })
        ]).show();
  }

  void increment() {
    if (_counter == (quizzController.getLenght() - 1)) {
      isFinished = true;
      showResetAlert();
    } else {
      setState(() {
        _counter++;
        _randomButton.shuffle();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildScore(),
            QuizzBuilder.buildQuestion(
                quizzController.getQuestionText(_counter)),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _randomButton),
          ],
        ),
      ),
    );
  }

  Widget _buildScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _score,
    );
  }
}
