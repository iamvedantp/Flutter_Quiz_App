import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, dynamic>> results;
  final String difficulty;
  final String userName; // Add userName parameter

  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.results,
    required this.difficulty,
    required this.userName, // Add required userName
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (dynamic, result) {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: userName, // Pass userName when going back
        );
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(
              context,
              '/home',
              arguments: userName, // Pass userName
            ),
            child: const Text('Quiz'),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              '/home',
              arguments: userName, // Pass userName
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Score: $score / $totalQuestions',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Review your answers:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(result['question']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Answer: ${result['selectedOption']}'),
                            Text('Correct Answer: ${result['correctOption']}'),
                            Text(
                              result['isCorrect'] ? 'Correct!' : 'Incorrect!',
                              style: TextStyle(
                                color: result['isCorrect']
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/quiz',
                    arguments: {
                      'difficulty': difficulty,
                      'userName': userName, // Pass userName when restarting
                    },
                  );
                },
                child: const Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
