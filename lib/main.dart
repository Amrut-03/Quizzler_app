import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'quize_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizebrain quize_brain = Quizebrain();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int questionNumber = 0;
  List <Icon> scorekeeper = [];

  void checkAnswer(bool useranswer){

    bool correctanswer = quize_brain.getAnswers();
    setState(() {
      if (quize_brain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        Alert(
          context: context,
          title: 'Successful',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quize_brain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scorekeeper = [];
      }
      else
        {
          if(useranswer == correctanswer){
            scorekeeper.add(
              const Icon(
                Icons.check,
                color: Colors.green,),
            );
          }else{
            const Icon(
              Icons.close,
              color: Colors.red,
            );
          }
          quize_brain.nextQuestion();
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child : Center(
              child: Text(
                quize_brain.getQuestions(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Oswald',
                  color: Colors.white,
                ),
              ),
            )
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(

                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),

              onPressed: (){
                checkAnswer(true);
              },
            )
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: (){
                  checkAnswer(false);
                },
              )
          ),
        ),
        Row(
          children: scorekeeper
        )
      ],
    );
  }
}

