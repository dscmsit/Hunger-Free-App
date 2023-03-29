import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../utills/route_builder.dart';
import 'firebase_options.dart';
import 'utills/route_names.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.newPost,
      // home: UserSetup(),
      onGenerateRoute: RoutesBuilder.generateRoute,
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
  }

  void loadUserInfo() async {
    // Get the current user's information from Firebase and display it
//     User user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DocumentSnapshot userInfo = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get();
//       setState(() {
//         _nameController.text = userInfo['name'];
//         _addressController.text = userInfo['address'];
//         _phoneNoController.text = userInfo['phoneNo'];
//         _emailController.text = user.email;
//       });
//     }
  }

  void saveUserInfo() async {
    // Save the user's updated information to Firebase
//     User user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .update({
//         'name': _nameController.text,
//         'address': _addressController.text,
//         'phoneNo': _phoneNoController.text
//       });
//     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Switch to edit mode when the user taps on the edit button
              setState(() {
                _isEditing = true;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/profile_picture.jpg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Add logic to update the profile picture here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  enabled: _isEditing,
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _isEditing
                        ? () {
                            // Save the user's updated information and switch back to view mode
                            if (_formKey.currentState?.validate() ?? false) {
                              saveUserInfo();
                              setState(() {
                                _isEditing = false;
                              });
                            }
                          }
                        : null,
                    child: Text(_isEditing ? 'Save' : 'Edit'),
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
