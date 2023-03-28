import 'package:flutter/material.dart';
import 'package:no_hunger/screen/NavBar.dart';
import 'package:no_hunger/model/food_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define a list of food items
  List<FoodItem> _foodItems = [
    FoodItem(
      name: 'Hardik Sharma',
      food: 'n210 , harion mnagar ',
      image: 'https://images.unsplash.com/photo-1606787366850-de6330128bfc',
    ),
    FoodItem(
      name: 'Sushi patel',
      food: 'janakpuri west',
      image: 'https://images.unsplash.com/photo-1565958011703-44f9829ba187',
    ),
    FoodItem(
      name: 'Tacos modi',
      food: 'patel nagar ',
      image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
    ),
    FoodItem(
      name: 'Amit kumar',
      food: 'rajiv chowk ',
      image: 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality.
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications functionality.
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement floating button functionality.
        },
        child: Icon(Icons.add),
      ),
      drawer: NavBar(),
      body: ListView.builder(
        itemCount: _foodItems.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.network(_foodItems[index].image,
                  height: 200,
                  width: screenWidth,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 10.0),
                Text(_foodItems[index].name),
                SizedBox(height: 5.0),
                Text(_foodItems[index].food),
              ],
            ),
          );
        },
      ),
    );
  }
}


