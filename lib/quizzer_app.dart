import 'package:flutter/material.dart';

class QuizzerApp extends StatefulWidget {
  const QuizzerApp({super.key});

  @override
  State<QuizzerApp> createState() => _MainAppState();
}

class _MainAppState extends State<QuizzerApp> {
  var questionNumber = 1;

  List<Icon> iconLists = [];
  List<String> questionLists = ['La capitale de la France est Marseille','La casa de Papel a mangé tout le miel'];
  List<bool> answerLists = [false,true];

  void handleOnTapButton(userAnswer) => setState(() {
    if (iconLists.length < questionLists.length) {
      if (userAnswer == answerLists[questionNumber - 1 ]) {
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
    }
    if (questionNumber < questionLists.length) {
      questionNumber = questionNumber + 1;
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
                questionLists[questionNumber - 1],
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