import 'package:flutter/material.dart';

class MyFormScreen extends StatefulWidget {
  @override
  _MyFormScreenState createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _username;
  String? _email;
  String? _phoneNo;
  String? _address;
  String? _foodItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('My Form',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Center(
        child:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your username',
                          prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _username = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                          prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _phoneNo = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your address',
                          prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _address = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your food items',
                          prefixIcon: Icon(Icons.restaurant_menu),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your food items';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _foodItems = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(


                          style: TextButton.styleFrom(

                            minimumSize: Size(200,60),
                            primary: Colors.white,
                            backgroundColor: Colors.blueAccent,
                            textStyle: TextStyle(
                              color :Colors.white,
                              fontSize: 20
                            )
                          ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Do something with the user input
                            // e.g. send it to a server, update state, etc.
                          }
                        },
                        child: Text('Submit'),
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
