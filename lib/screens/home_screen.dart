import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App bar title
        title: const Text('Flutter Quiz App'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          // Popup menu button for additional actions
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                // Navigate back to the Guest Login screen
                Navigator.pushReplacementNamed(context, '/');
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
            // Greeting the user with their name
            Text(
              'Welcome, $userName!',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            // Prompting the user to choose a difficulty level
            const Text(
              'Choose a Difficulty Level:',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            // Easy difficulty button
            DifficultyButton(
              difficulty: 'Easy',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, '/quiz', arguments: 'easy');
              },
            ),
            const SizedBox(height: 10.0),
            // Medium difficulty button
            DifficultyButton(
              difficulty: 'Medium',
              color: Colors.orange,
              onPressed: () {
                Navigator.pushNamed(context, '/quiz', arguments: 'medium');
              },
            ),
            const SizedBox(height: 10.0),
            // Hard difficulty button
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

// A reusable widget for difficulty level buttons
class DifficultyButton extends StatelessWidget {
  final String difficulty; // Difficulty level label (e.g., Easy, Medium, Hard)
  final Color color; // Button background color
  final VoidCallback onPressed; // Callback for button press

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
      // Displaying the difficulty level as button text
      child: Text(difficulty),
    );
  }
}
