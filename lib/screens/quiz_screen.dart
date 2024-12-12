import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  List<Question> questions = [
    Question(
      text: 'What is the capital city of India?',
      options: ['Mumbai', 'New Delhi', 'Kolkata', 'Bengaluru'],
      correctOptionIndex: 1,
    ),
    // Add more questions here
  ];

  void _submitAnswer() {
    if (_selectedOptionIndex != -1) {
      setState(() {
        questions[_currentQuestionIndex].selectedOptonIndex =
            _selectedOptionIndex;
      });

      if (_currentQuestionIndex < questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedOptionIndex = -1;
        });
      } else {
        Navigator.pushNamed(context, '/results');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ...currentQuestion.options.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              bool isCorrect = index == currentQuestion.correctOptionIndex;
              bool isSelected = index == _selectedOptionIndex;

              Color? color;
              if (currentQuestion.selectedOptonIndex != -1) {
                if (isSelected && !isCorrect) {
                  color = Colors.red;
                } else if (isCorrect) {
                  color = Colors.green;
                }
              }
              return GestureDetector(
                onTap: () {
                  if (currentQuestion.selectedOptonIndex == -1) {
                    setState(() {
                      _selectedOptionIndex = index;
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: color ?? Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(option),
                ),
              );
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: _submitAnswer,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
