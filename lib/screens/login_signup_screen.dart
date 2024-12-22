import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/google_button.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isLogin = true; // Toggles between login and signup

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void switchForm() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void handleAuthAction() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      if (isLogin) {
        // Perform login logic
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Perform signup logic
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
    }
  }

  void handleGoogleSignIn() {
    // TODO: Implement Google Sign-In Logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Google Sign-In not implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isLogin ? 'Login' : 'Sign Up',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: handleAuthAction,
              child: Text(isLogin ? 'Login' : 'Sign Up'),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: switchForm,
              child: Text(
                isLogin
                    ? 'Don\'t have an account? Sign Up'
                    : 'Already have an account? Login',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20.0),
            GoogleSignInButton(onPressed: handleGoogleSignIn),
          ],
        ),
      ),
    );
  }
}
