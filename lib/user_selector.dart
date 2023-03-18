import 'package:flutter/material.dart';
import 'package:no_hunger/feeds.dart';
import 'package:no_hunger/post_screen.dart';

class UserSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: (){
              // Use the Navigator to push a new screen onto the stack
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedWidget()),
              );
            },
            child: const Text('collector'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: (){
              // Use the Navigator to push a new screen onto the stack
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostScreen()),
              );
            },
            child: const Text('distributor'),
          ),
        ],
      ),
    );
  }
}
