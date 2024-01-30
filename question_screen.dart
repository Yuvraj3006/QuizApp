import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {


  @override
  Widget build(context) {
    final currentQues = questions[x];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQues.text,
              style: GoogleFonts.lato(
                color: const Color(0x8135D0FF),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQues.getShuffledAns().map((answer) {
              //shuffle method shuffles the original list
              //converting each value into separate iterable
              return AnswerButton(answerText: answer,
                  onTap: () {
                    answerQues(answer);
              });
            }),
          ],
        ),
      ), //use as much width as possible
    );
  }
  int x = 0;

  void answerQues(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      x++;

    });
  }
}
