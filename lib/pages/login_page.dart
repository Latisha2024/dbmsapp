import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hi, Welcome! 👋",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            TextField(
              decoration: const InputDecoration(
                  labelText: "Email address", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?"),
                )),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/catalog'),
                child: const Text("Log In")),
            const SizedBox(height: 15),
            OutlinedButton(
                onPressed: () {},
                child: const Text("Continue with Google")),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text("Don’t have an account? Sign Up"))
          ],
        ),
      ),
    );
  }
}
