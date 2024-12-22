import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
        elevation: 2.0,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      onPressed: onPressed,
      icon: Image.asset(
        'assets/google_logo.png',
        height: 20.0,
        width: 20.0,
      ),
      label: const Text(
        'Continue with Google',
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }
}
