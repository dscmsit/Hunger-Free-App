import 'package:flutter/material.dart';

import '../utills/firebase_login_and_signup.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _showLogin = true;

  void toggleView() {
    setState(() {
      _showLogin = !_showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showLogin
        ? LogIn(toggleView: toggleView)
        : SignUp(toggleView: toggleView);
  }
}

class LogIn extends StatefulWidget {
  final Function() toggleView;

  const LogIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();
  bool isHidden = true;

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
              'Log In',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: SizedBox(
                height: 60,
                child: TextField(
                  obscureText: false,
                  controller: _emailTextFieldController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
              child: SizedBox(
                height: 60,
                child: TextField(
                  obscureText: isHidden,
                  controller: _passwordTextFieldController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidden ? isHidden = false : isHidden = true;
                          });
                        },
                        icon: Icon(
                            isHidden ? Icons.visibility : Icons.visibility_off),
                      )),
                ),
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
                    onTap: widget.toggleView,
                    child: const Text('Don\'t have an Account?')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: OutlinedButton(
                onPressed: () {
                  signInWithGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png',
                      height: 50,
                    ),
                    Text(
                      'Login with Google',
                      style: TextStyle(color: Colors.grey[700]),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  final Function() toggleView;

  const SignUp({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();

  bool isHidden = true;

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: _emailTextFieldController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: "Email",
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    obscureText: isHidden,
                    controller: _passwordTextFieldController,
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: "Password",
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden ? isHidden = false : isHidden = true;
                            });
                          },
                          icon: Icon(isHidden
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                  ),
                ),
              ),
              FilledButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  signUpAccount(_emailTextFieldController.text,
                      _passwordTextFieldController.text);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: GestureDetector(
                  onTap: widget.toggleView,
                  child: const Text(
                    'Already Have an Account?',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: OutlinedButton(
                  onPressed: () {
                    signUpWithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google_logo.png',
                        height: 50,
                      ),
                      Text(
                        'Continue with Google',
                        style: TextStyle(color: Colors.grey[700]),
                        textScaleFactor: 1.3,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
