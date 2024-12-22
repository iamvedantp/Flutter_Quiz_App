import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz App'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                // Handle logout logic
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Flutter Quiz App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Choose a Difficulty Level:',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            DifficultyButton(
              difficulty: 'Easy',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, '/quiz', arguments: 'easy');
              },
            ),
            const SizedBox(height: 10.0),
            DifficultyButton(
              difficulty: 'Medium',
              color: Colors.orange,
              onPressed: () {
                Navigator.pushNamed(context, '/quiz', arguments: 'medium');
              },
            ),
            const SizedBox(height: 10.0),
            DifficultyButton(
              difficulty: 'Hard',
              color: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, '/quiz', arguments: 'hard');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DifficultyButton extends StatelessWidget {
  final String difficulty;
  final Color color;
  final VoidCallback onPressed;

  const DifficultyButton({
    super.key,
    required this.difficulty,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        textStyle: const TextStyle(fontSize: 18.0),
      ),
      onPressed: onPressed,
      child: Text(difficulty),
    );
  }
}
