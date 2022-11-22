import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzBuilder {
  static Widget close() {
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  static Widget check() {
    return const Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  static Widget buildQuestion(String questionText) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Text(
          questionText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  static Widget buildButton(
      {required String name,
      required VoidCallback onTap,
      required MaterialColor color}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: color, backgroundColor: Colors.white),
        onPressed: onTap,
        child: Text(
          name,
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  static DialogButton buttonDial(
      {required String name, required VoidCallback onTap}) {
    return DialogButton(
      onPressed: onTap,
      child: Text(name),
    );
  }
}
