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
  bool _isAnswered = false;
  List<Question> questions = [
    Question(
      text: 'What is Flutter?',
      options: [
        ' programming language',
        ' mobile app SDK',
        ' database management tool',
        ' operating system'
      ],
      correctOptionIndex: 1,
      definitions: [
        'Flutter is not a programming language.',
        'Flutter is a mobile app SDK by Google.',
        'Flutter is not a database management tool.',
        'Flutter is not an operating system.'
      ],
    ),

    Question(
      text: 'Which language is used to code Flutter apps?',
      options: ['Java', 'Swift', 'Dart', 'Python'],
      correctOptionIndex: 2,
      definitions: [
        'Java is not used to code Flutter apps.',
        'Swift is not used to code Flutter apps.',
        'Dart is the programming language for Flutter.',
        'Python is not used to code Flutter apps.'
      ],
    ),

    Question(
      text: 'What is the main UI building block in Flutter?',
      options: ['Activity', 'View', 'Widget', 'Fragment'],
      correctOptionIndex: 2,
      definitions: [
        'Activities are used in Android, not Flutter.',
        'Views are used in Android, not Flutter.',
        'Widgets are the main building blocks in Flutter.',
        'Fragments are used in Android, not Flutter.'
      ],
    ),

    Question(
      text: 'Which company developed Flutter?',
      options: ['Microsoft', 'Apple', 'Facebook', 'Google'],
      correctOptionIndex: 3,
      definitions: [
        'Microsoft did not develop Flutter.',
        'Apple did not develop Flutter.',
        'Facebook did not develop Flutter.',
        'Flutter was developed by Google.'
      ],
    ),

    Question(
      text: 'What does the "hot reload" feature in Flutter do?',
      options: [
        'Recompile the app and restarts it',
        'Refreshes the UI without losing state',
        'Clears all errors',
        'Optimizes app performance'
      ],
      correctOptionIndex: 1,
      definitions: [
        'Hot reload does not restart the app.',
        'Hot reload refreshes the UI without losing state.',
        'Hot reload does not clear errors.',
        'Hot reload does not optimize app performance.'
      ],
    ),

    Question(
      text: 'What is the default programming paradigm of Flutter?',
      options: ['Object-Oriented', 'Functional', 'Declarative', 'Procedural'],
      correctOptionIndex: 2,
      definitions: [
        'Object-oriented is a paradigm but not default in Flutter.',
        'Functional is not the default paradigm.',
        'Flutter uses a declarative programming paradigm.',
        'Procedural is not the default paradigm.'
      ],
    ),

    Question(
      text: 'Which widget is used for immutable UI components?',
      options: [
        'StatelessWidget',
        'StatefulWidget',
        'InheritedWidget',
        'Container'
      ],
      correctOptionIndex: 0,
      definitions: [
        'StatelessWidget is used for immutable UI components.',
        'StatefulWidget is used for mutable components.',
        'InheritedWidget is for data propagation.',
        'Container is a UI widget but not specifically immutable.'
      ],
    ),

    Question(
      text: 'What is the purpose of the "pubspec.yaml" file in Flutter?',
      options: [
        'Manage dependencies',
        'Define app routes',
        'Set app permissions',
        'Create widgets'
      ],
      correctOptionIndex: 0,
      definitions: [
        'pubspec.yaml manages dependencies in a Flutter project.',
        'It does not define app routes.',
        'It does not set app permissions.',
        'It does not create widgets.'
      ],
    ),

    Question(
      text: 'Which widget is used for creating scrollable lists?',
      options: ['Column', 'Row', 'ListView', 'GridView'],
      correctOptionIndex: 2,
      definitions: [
        'Column is not scrollable by default.',
        'Row is not scrollable.',
        'ListView is used for creating scrollable lists.',
        'GridView is used for grids, not lists.'
      ],
    ),

    Question(
      text: 'What command is used to create a new Flutter project?',
      options: [
        'flutter init',
        'flutter new',
        'flutter create',
        'flutter setup'
      ],
      correctOptionIndex: 2,
      definitions: [
        'flutter init is incorrect.',
        'flutter new is incorrect.',
        'flutter create is used to create new Flutter projects.',
        'flutter setup is incorrect.'
      ],
    ),
    // Your question data here
  ];

  void _submitAnswer() {
    if (_selectedOptionIndex != -1) {
      setState(() {
        _isAnswered = true;
        questions[_currentQuestionIndex].selectedOptionIndex =
            _selectedOptionIndex;
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (_currentQuestionIndex < questions.length - 1) {
          setState(() {
            _currentQuestionIndex++;
            _selectedOptionIndex = -1;
            _isAnswered = false;
          });
        } else {
          List<Map<String, dynamic>> results = questions.map((q) {
            bool isCorrect = q.selectedOptionIndex == q.correctOptionIndex;
            return {
              'question': q.text,
              'selectedOption': q.selectedOptionIndex != -1
                  ? q.options[q.selectedOptionIndex]
                  : 'No answer selected',
              'correctOption': q.options[q.correctOptionIndex],
              'isCorrect': isCorrect,
            };
          }).toList();

          int score = results.where((r) => r['isCorrect']).length;

          Navigator.pushNamed(context, '/results', arguments: {
            'score': score,
            'totalQuestions': questions.length,
            'results': results,
          });
        }
      });
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
              if (_isAnswered) {
                if (isSelected && !isCorrect) {
                  color = Colors.red;
                } else if (isCorrect) {
                  color = Colors.green;
                }
              }

              return GestureDetector(
                onTap: !_isAnswered
                    ? () {
                        setState(() {
                          _selectedOptionIndex = index;
                        });
                      }
                    : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: _isAnswered
                          ? (isCorrect
                              ? Colors.green
                              : (isSelected ? Colors.red : Colors.grey[200]))
                          : (isSelected ? Colors.blue : Colors.transparent)),
                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: _isAnswered ? null : _submitAnswer,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
