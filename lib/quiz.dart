import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int score = 0;
  final quiz = [
    {
      'question':
          'Q 1 - Which of the following is correct about Java 8 lambda expression ?',
      'answers': [
        {
          'answer':
              'A - Using lambda expression, you can refer to final variable or effectively final variable (which is assigned only once)',
          'correct': false
        },
        {
          'answer':
              'B - Lambda expression throws a compilation error, if a variable is assigned a value the second time ?',
          'correct': false
        },
        {'answer': 'C - Both of the above.', 'correct': true},
        {'answer': 'D - None of the above.', 'correct': false},
      ],
    },
    {
      'question':
          'Q 8 - Which of the following is the correct lambda expression which add two numbers and return their sum?',
      'answers': [
        {'answer': 'A - (int a, int b) -> { return a + b;};', 'correct': false},
        {'answer': 'B - (a, b) -> {return a + b;};', 'correct': false},
        {'answer': 'C - Both of the above.', 'correct': true},
        {'answer': 'D - None of the above.', 'correct': false},
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return (currentQuestionIndex >= quiz.length)
        ? Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Text(
                'Results: Your score is ${score / quiz.length * 100} %',
                style: TextStyle(fontSize: 20),
              ),
              FlatButton(
                child: Text('Restart',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
                onPressed: resetQuiz,
              )
            ]))
        : SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                    (currentQuestionIndex + 1).toString() +
                        "/" +
                        quiz.length.toString(),
                    style: TextStyle(fontSize: 22)),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    quiz[currentQuestionIndex]['question'] as String,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                ...(quiz[currentQuestionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          answer['answer'] as String,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      onPressed: () => handleAnswer(answer),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  );
                }),
              ],
            ));
  }

  void handleAnswer(answser) {
    print('Answer of question $currentQuestionIndex');
    setState(() {
      ++currentQuestionIndex;
    });
    if (answser['correct'] == true) ++score;
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }
}
