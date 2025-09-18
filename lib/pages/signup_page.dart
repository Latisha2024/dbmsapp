import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Let’s get Started!")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(decoration: const InputDecoration(labelText: "Name")),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: "Email")),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: "Phone")),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: "Address")),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Confirm Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/catalog'),
                child: const Text("Create Account")),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Already have an account? Log In"))
          ],
        ),
      ),
    );
  }
}
