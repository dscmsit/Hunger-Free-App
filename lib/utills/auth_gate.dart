import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_hunger/screen/authentication.dart';
import 'package:no_hunger/screen/check_user_type.dart';
import 'package:no_hunger/screen/collector_distributor_screen.dart';
import 'package:no_hunger/screen/home_screen.dart';
import 'package:no_hunger/screen/profile_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const AuthenticationScreen();
        } else {
          return const UserType();
        }
      },
    );
  }
}
