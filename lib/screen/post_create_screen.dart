import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_hunger/utills/firebase_login_and_signup.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void loadUserInfo() async {
    // Get the current user's information from Firebase and display it
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _addressController.text = userInfo['Address'];
        _phoneNoController.text = userInfo['Phone No'];
        _nameController.text = userInfo['Name'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      //Gallery Permission
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    //Camera Permission
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Food Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _foodNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter food name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Image'),
                  onTap: () {
                    _showPicker(context);
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Contact Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  enabled: false,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _phoneNoController,
                  decoration: const InputDecoration(
                    hintText: 'Enter phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    hintText: 'Enter address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await post(_nameController.text, _foodNameController.text, _phoneNoController.text,
                          _addressController.text, 'Empty');
                      Navigator.pop(context);
                    },
                    child: const Text('Post'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
