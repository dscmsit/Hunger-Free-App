import 'package:flutter/material.dart';
import 'package:no_hunger/screen/feeds.dart';

class UserSelector extends StatelessWidget {
  static const String id = "UserSelectorScreen";
  const UserSelector({Key? key}) : super(key: key);

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
            onPressed: null,
            child: const Text('distributor'),
          ),
        ],
      ),
    );
  }
}
