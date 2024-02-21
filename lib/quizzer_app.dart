import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'quizz_brain.dart';

class QuizzerApp extends StatefulWidget {
  const QuizzerApp({super.key});

  @override
  State<QuizzerApp> createState() => _MainAppState();
}

class _MainAppState extends State<QuizzerApp> {

  List<Icon> iconLists = [];
  QuizzBrain quizz1 = QuizzBrain([Question("Fréjus est la capitale de la France", false), Question("La Casa de Papel a mangé tout le miel", true)]);

  void handleOnTapButton(userAnswer) => setState(() {
    if (iconLists.length < quizz1.questionListLength()) {
      if (userAnswer == quizz1.getAnswer(quizz1.getQuestionNumber() - 1)) {
        iconLists.add(const Icon(
          IconData(0xe156, fontFamily: 'MaterialIcons'),
          color: Colors.green,
        ));
      
      } else {
        iconLists.add(const Icon(
          IconData(0xe16a, fontFamily: 'MaterialIcons'),
          color: Colors.red,
        ));
        
      }

      quizz1.nextQuestion();
    } else {
      Alert(
        context: context,
        title: "C'est terminé",
        desc: "Vous êtes arrivé au bout de ce quizz, pour recommencer, cliquer sur le bouton ! :) ",
        buttons: [
        DialogButton(
          
          onPressed: () => {setState(() {
              iconLists.clear();
            quizz1.restartQuizz();
            Navigator.pop(context);
            })},
          width: 150,
          child: const Text(
            "Recommencer",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
      ).show();
    }
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizz1.getQuestionText(quizz1.getQuestionNumber() - 1),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ),
        ),
        Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(800),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
              onPressed: () => handleOnTapButton(true) ,
              child: const Text(
                'Vrai',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size.fromHeight(800),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
              onPressed: () => handleOnTapButton(false) ,
              child: const Text('Faux',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ),
        ),
        Expanded(child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: iconLists.length,
          itemBuilder: (BuildContext context, int index) => iconLists[index],
        ),
        ),

      ],
    );
  }
}