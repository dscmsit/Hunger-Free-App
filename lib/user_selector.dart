import 'package:flutter/material.dart';

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
            onPressed: null,
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
