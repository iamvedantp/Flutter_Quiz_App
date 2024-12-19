import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final String difficulty;

  const QuizScreen({Key? key, required this.difficulty}) : super(key: key);

  void _navigateToQuestions(BuildContext context) {
    String route;
    switch (difficulty) {
      case 'easy':
        route = '/easyQuestions';
        break;
      case 'medium':
        route = '/mediumQuestions';
        break;
      case 'hard':
        route = '/hardQuestions';
        break;
      default:
        route = '/home';
    }
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          child: const Text('Quiz'),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selected Difficulty: $difficulty',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () => _navigateToQuestions(context),
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
