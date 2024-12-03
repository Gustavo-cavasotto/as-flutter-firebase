import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'forget_password.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
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
        title: const Text('Register'),
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
                'Crie sua conta na AS!',
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
                labelText: 'Password',
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
            // Register Button
            ElevatedButton(
              onPressed: () => _registerUser(context),
              child: const Text('Register'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
            const SizedBox(height: 20.0),
            // "Already have an account?" Text Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text(
                'Já tem uma conta? Faça login aqui',
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
                'Esqueceu a senha?',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
