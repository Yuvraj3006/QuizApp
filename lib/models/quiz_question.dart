class QuizQuestion
{

  const QuizQuestion(this.text, this.answers);

  final String text;
  final List <String> answers;

  List<String> getShuffledAns()
  {
    //what we did here is called chaining
   final shuffledList = List.of(answers); //here a new list will be shuffled and the old list will remain as it is
    shuffledList.shuffle();
    //here final symbolizes that we cant reassign a answer
    return shuffledList;
  }
}