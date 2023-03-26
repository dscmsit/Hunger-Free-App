import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_hunger/sign_up.dart';

import 'firebase_login_and_signup.dart';

class LogIn extends StatefulWidget {
  static const String id = "LoginScreen";
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Create an account',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: TextField(
                controller: _emailTextFieldController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: TextField(
                controller: _passwordTextFieldController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
              ),
            ),
            FilledButton(
              onPressed: () {
                logInAccount(_emailTextFieldController.text,
                    _passwordTextFieldController.text);
              },
              child: const Text('Login'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: GestureDetector(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text('Don\'t have and account')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

