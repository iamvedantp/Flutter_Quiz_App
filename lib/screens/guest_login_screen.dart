import 'package:flutter/material.dart';

// Entry point screen for guest login
class GuestLoginScreen extends StatefulWidget {
  const GuestLoginScreen({super.key});

  @override
  State<GuestLoginScreen> createState() => _GuestLoginScreenState();
}

class _GuestLoginScreenState extends State<GuestLoginScreen> {
  // Controller to handle input from the text field
  final TextEditingController _nameController = TextEditingController();

  // Navigate to the Home Screen with the user's name as an argument
  void _navigateToHomeScreen() {
    if (_nameController.text.trim().isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/home',
        arguments: _nameController.text.trim(),
      );
    } else {
      // Show a SnackBar message if the name field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest Login'), // Title of the screen
        centerTitle: true, // Center the title in the AppBar
        automaticallyImplyLeading: false, // Disable the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            // Instructional text
            const Text(
              "Enter Your Name to Continue",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Space between text and input field

            // Input field for the user to enter their name
            TextField(
              controller:
                  _nameController, // Connect controller to the input field
              decoration: const InputDecoration(
                border: OutlineInputBorder(), // Add an outline around the field
                labelText: 'Your Name', // Placeholder text
              ),
            ),
            const SizedBox(height: 20), // Space between input field and button

            // Button to navigate to the home screen
            ElevatedButton(
              onPressed:
                  _navigateToHomeScreen, // Trigger navigation when pressed
              child: const Text('Continue'), // Button label
            ),
          ],
        ),
      ),
    );
  }
}
