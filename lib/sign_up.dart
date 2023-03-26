import 'package:flutter/material.dart';
import 'package:no_hunger/log_in.dart';

import 'firebase_login_and_signup.dart';

class SignUp extends StatefulWidget {
  static const String id = "SignUpScreen";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkAuthState();
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
                signUpAccount(_emailTextFieldController.text,
                    _passwordTextFieldController.text);
              },
              child: const Text('Create an Account'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LogIn(),
                    ),
                  );
                },
                child: const Text(
                  'Already Have an Account',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                signInWithGoogle();
              },
              child: const Text('Continue with Google'),
            )
          ],
        ),
      ),
    );
  }
}

