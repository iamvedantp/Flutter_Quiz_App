import 'package:flutter/material.dart'; // Import the Flutter library

// Import screens
import 'screens/home_screen.dart';
import 'screens/guest_login_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/results_screen.dart';

void main() {
  runApp(const QuizApp()); // Run the QuizApp widget
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      title: 'Quiz App', // App title
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the primary color theme
      ),
      initialRoute: '/', // Set the initial route (landing screen)
      routes: {
        '/': (context) => const GuestLoginScreen(), // Route for '/'
        '/home': (context) {
          final userName = ModalRoute.of(context)?.settings.arguments
              as String?; // Get username from arguments
          return HomeScreen(
              userName: userName ?? 'Guest'); // Pass username to HomeScreen
        },
        '/quiz': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, String>; // Get arguments as a map
          return QuizScreen(
            // Pass arguments to QuizScreen
            difficulty: args['difficulty'] ?? 'easy', // Set default difficulty
            userName: args['userName'] ?? 'Guest', // Set default username
          );
        },
        '/results': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>; // Get arguments as a dynamic map
          return ResultsScreen(
            // Pass arguments to ResultsScreen
            score: args['score'] ?? 0, // Set default score
            totalQuestions:
                args['totalQuestions'] ?? 0, // Set default total questions
            results: args['results'] ?? [], // Set default results as empty list
            difficulty: args['difficulty'] ?? 'easy', // Set default difficulty
            userName: args['userName'] ?? 'Guest', // Set default username
          );
        },
      },
    );
  }
}
