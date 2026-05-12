import 'package:flutter/material.dart';
import 'package:woman_health/ui/auth/view_models/login_scope.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = LoginScope.of(context); 

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _email, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _pass, obscureText: true),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            viewModel.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => viewModel.signIn(context, _email.text, _pass.text),
                    child: const Text('Sign In'),
                  ),
          ],
        ),
      ),
    );
  }
}