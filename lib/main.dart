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
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary theme color
      ),
      initialRoute: '/', // The initial route of the application
      routes: {
        '/': (context) => const GuestLoginScreen(), // Entry point for login

        // Home Screen route: Pass the username as an argument
        '/home': (context) {
          final userName =
              ModalRoute.of(context)?.settings.arguments as String?;
          return HomeScreen(
              userName: userName ?? 'Guest'); // Fallback to 'Guest' if null
        },

        // Quiz Screen route: Pass the difficulty level as an argument
        '/quiz': (context) {
          final difficulty =
              ModalRoute.of(context)?.settings.arguments as String?;
          return QuizScreen(
              difficulty: difficulty ?? 'easy'); // Default to 'easy'
        },

        // Results Screen route: Pass score, total questions, results, and difficulty as arguments
        '/results': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          return ResultsScreen(
            score: args['score'] ?? 0, // Default to 0 if score is null
            totalQuestions: args['totalQuestions'] ?? 0, // Default to 0
            results: args['results'] ?? [], // Default to an empty list
            difficulty: args['difficulty'] ?? 'easy', // Default to 'easy'
          );
        },
      },
    );
  }
}
