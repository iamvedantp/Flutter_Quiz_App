import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/results_screen.dart';
import 'screens/login_signup_screen.dart';
import 'screens/signup_form_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print('Firebase initialized successfully!');
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
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
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginSignupScreen(),
        '/signup': (context) => const SignupFormScreen(),
        '/quiz': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return QuizScreen(difficulty: args);
        },
        '/results': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ResultsScreen(
            score: args['score'],
            totalQuestions: args['totalQuestions'],
            results: args['results'],
            difficulty: args['difficulty'],
          );
        },
      },
    );
  }
}
