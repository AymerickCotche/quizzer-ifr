import 'package:quizzer/quizzer_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body:
          const SafeArea(
            child: QuizzerApp() 
          ),
      ),
    )
  );
}
