import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/guest_login_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/results_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GuestLoginScreen(),
        '/home': (context) {
          final userName =
              ModalRoute.of(context)?.settings.arguments as String?;
          return HomeScreen(
              userName: userName ?? 'Guest'); // Fallback to 'Guest'
        },
        '/quiz': (context) {
          final difficulty =
              ModalRoute.of(context)?.settings.arguments as String?;
          return QuizScreen(
              difficulty: difficulty ?? 'easy'); //Default to 'easy'
        },
        '/results': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          return ResultsScreen(
            score: args?['score'] ?? 0,
            totalQuestions: args?['totalQuestions'] ?? 0,
            results: args?['results'] ?? [],
            difficulty: args?['difficulty'] ?? 'easy',
          );
        },
      },
    );
  }
}
