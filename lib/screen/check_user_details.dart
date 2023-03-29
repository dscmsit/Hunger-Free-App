import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utills/route_names.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  Future<void> checkUserDetails() async {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;
    String? userSetup;
    await db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .get()
        .then((documentSnapshot) {
      if (documentSnapshot.exists) {
        userSetup = documentSnapshot.data()!['UserSetup'];
        print(userSetup);
        if (userSetup != 'Incomplete') {
          Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
        } else {
          Navigator.pushReplacementNamed(
              context, RouteNames.userSetup);
        }
      } else {
        // Handle document not found error
      }
      return userSetup;
    });
  }

  @override
  void initState() {
    super.initState();
    checkUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // set the background color here
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
