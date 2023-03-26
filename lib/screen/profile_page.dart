import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String id = "ProfilePageScreen";
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   // image: ,
            // ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Full Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Email address',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // logout functionality
          },
          child: Text('Logout'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/edit_profile');
          },
          child: Text('Edit Profile'),
        ),

      ],
    );
  }
}
