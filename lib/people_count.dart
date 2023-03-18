import 'package:flutter/material.dart';

// Define the Counter class to hold the count value
class Counter {
  int count;

  Counter({required this.count});
}

// Define the CounterService class to handle making HTTP requests
class CounterService {
  final String apiUrl;

  CounterService({required this.apiUrl});

  Future<Counter> getCount() async {
    final response = await http.get(Uri.parse(apiUrl));
    final json = jsonDecode(response.body);
    return Counter(count: json['count']);
  }
}

// Define the CounterScreen widget to display the count
class CounterScreen extends StatefulWidget {
  final CounterService counterService;

  CounterScreen({required this.counterService});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late Counter _counter;

  @override
  void initState() {
    super.initState();
    _fetchCount();
  }

  void _fetchCount() async {
    final counter = await widget.counterService.getCount();
    setState(() {
      _counter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_counter == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: Text(
          'Count: ${_counter.count}',
          style: TextStyle(fontSize: 24),
        ),
      );
    }
  }
}
