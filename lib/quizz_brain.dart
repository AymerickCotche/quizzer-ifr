import 'question.dart';

class QuizzBrain {
  int _questionnumber = 1;
  List<Question> _questions = [];
  QuizzBrain(this._questions);

  String getQuestionText(index) => _questions[_questionnumber - 1].text;
  int questionListLength() => _questions.length;
  bool getAnswer(index) => _questions[_questionnumber - 1].answer;
  int getQuestionNumber() => _questionnumber;
  void restartQuizz() {
    _questionnumber = 1;
  }

  void nextQuestion() {
    if (_questionnumber < _questions.length) _questionnumber++;
  }


}