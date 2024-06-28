class Question {
  String question;
  List answers;

  Question({required this.question, required this.answers});
}

class Answer {
  String answer;
  bool isTrue;

  Answer({required this.answer, required this.isTrue});
}

List<Question> questions = [
  Question(
    question: 'what is the capital of egypt?',
    answers: [
      Answer(answer: 'cairo', isTrue: true),
      Answer(answer: 'alex', isTrue: false),
      Answer(answer: 'tanta', isTrue: false),
      Answer(answer: 'banha', isTrue: true),
    ],
  ),
  Question(
    question: 'what is the capital of us?',
    answers: [
      Answer(answer: 'newyourk', isTrue: true),
      Answer(answer: 'mombabi', isTrue: false),
      Answer(answer: 'kalifo', isTrue: false)
    ],
  ),
  Question(
    question: 'what is the capital of uk?',
    answers: [
      Answer(answer: 'london', isTrue: true),
      Answer(answer: 'barcelona', isTrue: false),
      Answer(answer: 'madrid', isTrue: false)
    ],
  ),
];
