import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../questions/easy_questions.dart';
import '../questions/medium_questions.dart';
import '../questions/hard_questions.dart';

class QuizScreen extends StatefulWidget {
  final String difficulty;
  final String userName; // Add userName parameter

  const QuizScreen({
    super.key,
    required this.difficulty,
    required this.userName, // Add required userName
  });

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  bool _isAnswered = false;
  late List<Question> questions;

  @override
  void initState() {
    super.initState();
    questions = loadQuestionsForDifficulty(widget.difficulty);
  }

  // Function to load questions based on difficulty
  List<Question> loadQuestionsForDifficulty(String difficulty) {
    if (difficulty == 'easy') return easyQuestions;
    if (difficulty == 'medium') return mediumQuestions;
    return hardQuestions;
  }

  // Function to handle answer submission and navigate to results
  void _submitAnswer() {
    if (_selectedOptionIndex != -1) {
      setState(() {
        _isAnswered = true;
        questions[_currentQuestionIndex].selectedOptionIndex =
            _selectedOptionIndex; // Update selected option index
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          if (_currentQuestionIndex < questions.length - 1) {
            setState(() {
              _currentQuestionIndex++; // Move to next question
              _selectedOptionIndex = -1;
              _isAnswered = false;
            });
          } else {
            // Calculate results and navigate to results screen
            List<Map<String, dynamic>> results = questions.map((q) {
              bool isCorrect = q.selectedOptionIndex == q.correctOptionIndex;
              return {
                'question': q.text,
                'selectedOption': q.options[q.selectedOptionIndex],
                'correctOption': q.options[q.correctOptionIndex],
                'isCorrect': isCorrect,
              };
            }).toList();

            int score = results.where((r) => r['isCorrect']).length;

            Navigator.pushNamed(
              context,
              '/results',
              arguments: {
                'score': score,
                'totalQuestions': questions.length,
                'results': results,
                'difficulty': widget.difficulty,
                'userName': widget.userName, // Pass userName to results
              },
            );
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

    return PopScope(
      // Handle back button press
      onPopInvokedWithResult: (dynamic, result) {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: widget.userName, // Pass userName when going back
        );
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            // Tappable app bar title
            onTap: () => Navigator.pushReplacementNamed(
              context,
              '/home',
              arguments: widget.userName, // Pass userName
            ),
            child: const Text('Quiz'),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              '/home',
              arguments: widget.userName, // Pass userName
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                ...currentQuestion.options.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  final isCorrect = index == currentQuestion.correctOptionIndex;
                  final isSelected = index == _selectedOptionIndex;

                  return GestureDetector(
                    onTap: !_isAnswered
                        ? () {
                            setState(() {
                              _selectedOptionIndex = index;
                            });
                            _submitAnswer();
                          }
                        : null,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: _isAnswered
                            ? isSelected
                                ? (isCorrect
                                    ? Colors.green[100]
                                    : Colors.red[100])
                                : (isCorrect ? Colors.green[100] : Colors.white)
                            : Colors.white,
                        border: Border.all(
                          color: isSelected
                              ? (isCorrect ? Colors.green : Colors.red)
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(option, textAlign: TextAlign.center),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
