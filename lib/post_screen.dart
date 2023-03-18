import 'package:flutter/material.dart';
import 'package:no_hunger/people_count.dart';

class PostScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        IconButton(
            icon: Icon(Icons.image),
            tooltip: 'Add Image',
            onPressed: null,
        ),
        IconButton(
            onPressed: null, 
            tooltip: 'Add Document',
            icon: Icon(Icons.document_scanner)
        ),
        IconButton(
            onPressed: null, 
            tooltip: 'Add Video',
            icon: Icon(Icons.video_file)
        ),
        IconButton(
            onPressed: null, 
            tooltip: 'Add Location',
            icon: Icon(Icons.location_city)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(onPressed: (){// Use the Navigator to push a new screen onto the stack
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterScreen()),
            );}, icon: Icon(Icons.plus_one_outlined))
          ],
        )
      ],
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  
}
