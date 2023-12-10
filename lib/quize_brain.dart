
import 'questions.dart';
class Quizebrain{
  int _questionNumber = 0;
  List <Questions> _questionbank = [
    Questions(q: '1. Enumerations are a special data type in Java that allows for a variable to be set to a predefined variable.',a: true),
    Questions(q: '2. int x[] = new int[]{10,20,30};<br><br>Array\'s can also be created and initialize as in above statement.',a: true),
    Questions(q: '3. In an instance method or a constructor, "this" is a reference to the current object.',a: true),
    Questions(q: '4. Garbage Collection is manual process.',a: false),
    Questions(q: '5. Constructor overloading is not possible in Java.',a: false)
  ];

  void nextQuestion(){
    if(_questionNumber<_questionbank.length-1){
      _questionNumber++;
    }
  }
  String getQuestions(){
    return _questionbank[_questionNumber].questionText;
  }

  bool getAnswers(){
    return _questionbank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionbank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }
  void reset() {
    _questionNumber = 0;
  }
}