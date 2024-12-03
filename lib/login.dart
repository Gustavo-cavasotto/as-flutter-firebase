import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register.dart';
import 'forget_password.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void _loginUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title or Description
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Seja Bem-vindo a AS!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            // Email TextField
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            // Password TextField
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            // Login Button
            ElevatedButton(
              onPressed: () => _loginUser(context),
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
            const SizedBox(height: 20.0),
            // "Don't have an account?" Text Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text(
                'Ainda não possui uma conta?',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 16.0),
            // Forgot password Text Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                );
              },
              child: const Text(
                'Esqueceu sua senha?',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
