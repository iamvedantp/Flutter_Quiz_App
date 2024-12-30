import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/guest_login_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/results_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const GuestLoginScreen(),
        '/home': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return HomeScreen(userName: args);
        },
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
