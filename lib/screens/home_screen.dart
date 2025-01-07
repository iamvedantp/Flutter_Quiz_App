import 'package:flutter/material.dart'; // Import Flutter library

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App bar with title, logout button, and centering
        title: const Text('Flutter Quiz App'),
        automaticallyImplyLeading: false, // Remove back button
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            // Logout popup menu
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushReplacementNamed(
                    context, '/'); // Navigate to login screen on logout
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                // Logout menu item
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
        // Content with padding
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Main column for layout
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch content horizontally
          children: [
            Text(
              // Welcome message with username
              'Welcome, $userName!',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0), // Spacing between elements
            const Text(
              // Difficulty level label
              'Choose a Difficulty Level:',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0), // Spacing between elements
            DifficultyButton(
              // Difficulty button for easy level
              difficulty: 'Easy',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(
                  // Navigate to quiz screen with arguments
                  context,
                  '/quiz',
                  arguments: {
                    'difficulty': 'easy',
                    'userName': userName,
                  },
                );
              },
            ),
            const SizedBox(height: 10.0), // Spacing between buttons
            DifficultyButton(
              // Difficulty button for medium level (similar structure)
              difficulty: 'Medium',
              color: Colors.orange,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/quiz',
                  arguments: {
                    'difficulty': 'medium',
                    'userName': userName,
                  },
                );
              },
            ),
            const SizedBox(height: 10.0), // Spacing between buttons
            DifficultyButton(
              // Difficulty button for hard level (similar structure)
              difficulty: 'Hard',
              color: Colors.red,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/quiz',
                  arguments: {
                    'difficulty': 'hard',
                    'userName': userName,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DifficultyButton extends StatelessWidget {
  // Custom button widget
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
      // ElevatedButton for styled button
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
