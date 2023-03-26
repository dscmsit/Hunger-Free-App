import 'package:flutter/material.dart';

class FeedItem {

  final String title;
  final String description;

  FeedItem({required this.title, required this.description});
}

// Create a widget to display a single feed item
class FeedItemWidget extends StatelessWidget {
  final FeedItem feedItem;

  FeedItemWidget({required this.feedItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feedItem.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              feedItem.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Create a list of feed items
final List<FeedItem> feedItems = [
  FeedItem(
    title: 'First Feed Item',
    description: 'This is the first item in the feed.',
  ),
  FeedItem(
    title: 'Second Feed Item',
    description: 'This is the second item in the feed.',
  ),
  FeedItem(
    title: 'Third Feed Item',
    description: 'This is the third item in the feed.',
  ),
];

// Create a widget to display the list of feed items
class FeedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: feedItems.length,
      itemBuilder: (context, index) {
        final feedItem = feedItems[index];
        return FeedItemWidget(feedItem: feedItem);
      },
    );
  }
}