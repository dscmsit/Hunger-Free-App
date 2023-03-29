import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

void checkAuthState() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

Future<void> signUpAccount(String email, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      addUserToDatabase(user.email);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

void addUserToDatabase(String? email) async {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  final user = <String, dynamic>{
    "Email": email,
    "UserSetup": 'Incomplete',
    "UserType": 'Null'
  };
  await db.collection("users").doc(auth.currentUser?.uid).set(user);
}

Future<void> addUserTypeToFirestore(String type) async {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  final user = <String, dynamic>{
    "UserType": type,
  };
  await db.collection("users").doc(auth.currentUser?.uid).update(user);
}

Future<void> addUserDetailsToDatabase(
    String? name, String? phoneNo, String? address) async {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  final user = <String, dynamic>{
    "Name": name,
    "Phone No": phoneNo,
    "Address": address,
    "UserSetup": 'Complete'
  };
  await db.collection("users").doc(auth.currentUser?.uid).update(user);
}

Future<void> updateUserDetails(
    String? name, String? phoneNo, String? address) async {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  final user = <String, dynamic>{
    "Name": name,
    "Phone No": phoneNo,
    "Address": address,
  };
  await db.collection("users").doc(auth.currentUser?.uid).update(user);
}

Future<void> logInAccount(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

Future<void> signOutAccount() async {
  await FirebaseAuth.instance.signOut();
}

Future<bool> signUpWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);

  addUserToDatabase(googleUser?.email);
  return true;
}

Future<void> post(String name, String foodName, String phoneNo, String address,
    String image) async {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  String randomId = const Uuid().v4();

  final user = <String, dynamic>{
    "Name": name,
    "FoodDetails": foodName,
    "PhoneNo": phoneNo,
    "Address": address,
    "Image": image
  };

  await db.collection("posts").doc(randomId).set(user);
}
