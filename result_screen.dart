import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String,Object>> getSummaryData()
  {
    final List<Map<String,Object>> summary = [];
    for(var i =0; i<chosenAnswers.length;i++)
      {
        summary.add({
          'questions_index' : i,
          'question': questions[i].text,
          'correct_answer' : questions[i].answers[0],
          'user_answer' : chosenAnswers[i]

        });
      }
    return summary;
  }

  //get onPressed => null;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQue = questions.length;
    final numCorrecQue = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return
      SizedBox(
          width: double.infinity,
          child: Container(
              margin: const EdgeInsets.all(50),
              child: Column(
                  children: [
                   Text("You answered $numCorrecQue out of $numTotalQue currently"),
              const SizedBox(height: 30,),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30,),
              TextButton(onPressed: () {},
          child: const Text('Restart Quiz')),
    ],
    ),
    )
    );
    }
}
