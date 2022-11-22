import 'package:flutter/material.dart';

import 'screens/quizz_screen.dart';

void main() => runApp(const QuizzApp());

class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TheQuizz',
      home: QuizzScreen(),
    );
  }
}
