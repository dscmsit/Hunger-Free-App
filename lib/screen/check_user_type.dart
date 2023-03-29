import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utills/route_names.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  Future<void> checkUserType() async {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;
    String? userType;
    await db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .get()
        .then((documentSnapshot) {
      if (documentSnapshot.exists) {
        userType = documentSnapshot.data()!['UserType'];
        print(userType);
        if (userType != 'Null') {
          Navigator.pushReplacementNamed(context, RouteNames.userDetails);
        } else {
          Navigator.pushReplacementNamed(context, RouteNames.collectorDistributorScreen);
        }
      } else {
        // Handle document not found error
      }
      return userType;
    });
  }

  @override
  void initState() {
    super.initState();
    checkUserType();
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
