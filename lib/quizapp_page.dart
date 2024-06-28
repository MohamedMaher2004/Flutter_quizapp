import 'package:flutter/material.dart';
import 'package:quizapp/component/circleavatar_widget.dart';

import 'model/question_answer.dart';

class QuizappPage extends StatefulWidget {
  QuizappPage({super.key});

  @override
  State<QuizappPage> createState() => _QuizappPageState();
}

class _QuizappPageState extends State<QuizappPage> {
  var index = 0;
  int score = 0;
  Answer? selectedanswer;
  bool isselected = false;
  bool isnext = false;
  bool islastquestion = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                'Question ${index + 1}/${questions.length}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Center(child: Text(questions[index].question)),
                ),
                Positioned(
                    top: -25,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.green,
                      ),
                    )),
                Positioned(
                  right: -25,
                  child: CircleAvatarWidget(
                    raduis: 25,
                    backgroundcolor: Colors.black,
                  ),
                ),
                Positioned(
                  left: -25,
                  child: CircleAvatarWidget(
                    raduis: 25,
                    backgroundcolor: Colors.black,
                  ),
                ),
              ],
            ),
            for (var ans in questions[index].answers) getbuttons(ans),
            GetNextButton(),
          ],
        ),
      ),
    );
  }

  getbuttons(Answer ans) {
    isselected = ans == selectedanswer;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {
          setState(() {
            isnext = true;
            selectedanswer = ans;
          });
        },
        child: Container(
          width: 150,
          height: 30,
          decoration: BoxDecoration(
              color: isselected ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Center(child: Text('${ans.answer}')),
        ),
      ),
    );
  }

  GetNextButton() {
    return GestureDetector(
      onTap: isnext
          ? () {
              if (index == questions.length - 1) {
                setState(() {
                  islastquestion = true;
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (Builder) {
                        return AlertDialog(
                          title: score > (questions.length * .6)
                              ? Text('Pass')
                              : Text('Failed'),
                          content: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                index = 0;
                                selectedanswer = null;
                                score = 0;
                                isnext = false;
                                isselected = false;
                                Navigator.pop(context);
                              });
                            },
                            child: Text('Reset'),
                          ),
                        );
                      });
                });
              } else {
                if (selectedanswer!.isTrue == true) {
                  score++;
                }
                setState(() {
                  index++;
                  selectedanswer = null;
                  islastquestion = false;
                  isselected = false;
                  isnext = false;
                });
              }
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 150,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.zero, color: Colors.white),
          child: islastquestion
              ? Center(child: Text('Submit'))
              : Center(child: Text('Next')),
        ),
      ),
    );
  }
}
