import 'package:flutter/material.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/result_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];
  var activeScreen = 'resultScreen';

  // Widget? activeScreen ; // specifies that it can also be null
  //
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'Question Screen';
      // activeScreen = QuestionScreen();
    });
  }

  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length)
      {
        setState(() {

          activeScreen='startScreen';
        });
      }
  }


  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    // if(activeScreen == 'questions-screen')
    //   {
    //      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    //   }
    //
    //
    // if(activeScreen == 'results-screen')
    //   {
    //     screenWidget =  ResultScreen(chosenAnswers: selectedAnswers,);
    //   }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.indigoAccent, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
          ),
          child: Center(
            child: activeScreen == 'startScreen'
                ?   StartScreen(switchScreen)
                :  QuestionScreen( onSelectAnswer: chooseAnswer,),
          ),
        ),
      ),
    );
  }
}
