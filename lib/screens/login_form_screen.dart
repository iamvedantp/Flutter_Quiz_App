import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function(String emailOrMobile, String password) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: emailController,
          decoration:
              const InputDecoration(labelText: 'Email or Mobile Number'),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: () {
            widget.onLogin(
              emailController.text.trim(),
              passwordController.text.trim(),
            );
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
