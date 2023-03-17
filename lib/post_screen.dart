import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: IconButton(
            icon: Icon(Icons.image),
            tooltip: 'Add Image',
            onPressed: null,
        )
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: IconButton(
            onPressed: null, 
            tooltip: 'Add Document',
            icon: Icon(Icons.document_scanner))
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: IconButton(
            onPressed: null, 
            tooltip: 'Add Video',
            icon: Icon(Icons.video_file))
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: IconButton(
            onPressed: null, 
            tooltip: 'Add Location',
            icon: Icon(Icons.location_city))
        )
      ],
    );
  }
}
