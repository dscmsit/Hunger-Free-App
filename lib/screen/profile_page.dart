import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_hunger/utills/firebase_login_and_signup.dart';
import 'package:no_hunger/utills/route_names.dart';

class ProfilePageOriginal extends StatefulWidget {
  const ProfilePageOriginal({Key? key}) : super(key: key);

  @override
  State<ProfilePageOriginal> createState() => _ProfilePageOriginalState();
}

class _ProfilePageOriginalState extends State<ProfilePageOriginal> {
  bool _isEditing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  void loadUserInfo() async {
    // Get the current user's information from Firebase and display it
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _nameController.text = userInfo['Name'];
        _addressController.text = userInfo['Address'];
        _phoneNoController.text = userInfo['Phone No'];
        _emailController.text = user.email!;
      });
    }
  }

  void saveUserInfo() async {
    updateUserDetails(
        _nameController.text, _phoneNoController.text, _addressController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = true;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              signOutAccount();
              Navigator.pushReplacementNamed(context, RouteNames.authenticationScreen);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: const [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage:
                              AssetImage('assets/images/google_logo.png'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    enabled: _isEditing,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _addressController,
                    enabled: _isEditing,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneNoController,
                    enabled: _isEditing,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Visibility(
                      visible: _isEditing,
                      child: ElevatedButton(
                        onPressed: _isEditing
                            ? () {
                                // Save the user's updated information and switch back to view mode
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  saveUserInfo();
                                  setState(() {
                                    _isEditing = false;
                                  });
                                }
                              }
                            : null,
                        child: const Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
