import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_hunger/model/food_item.dart';
import 'package:no_hunger/screen/NavBar.dart';
import 'package:no_hunger/utills/route_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define a list of food items
  List<FoodItem> _foodItems = [];

  Future<void> getPosts() async {
    _foodItems.clear();
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;
    db.collection("posts").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          String name = docSnapshot.get('Name');
          String image = docSnapshot.get('Image');
          String address = docSnapshot.get('Address');
          String food = docSnapshot.get('FoodDetails');
          String phoneNo = docSnapshot.get('PhoneNo');
          FoodItem item = FoodItem(
              name: name,
              food: food,
              image: image,
              address: address,
              phoneNo: phoneNo);
          setState(() {
            _foodItems.add(item);
          });

          // print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.profileScreenOriginal);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.newPost);
        },
        child: const Icon(Icons.add),
      ),
      drawer: NavBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await getPosts();

          setState(() {});
        },
        child: ListView.builder(
          itemCount: _foodItems.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  _foodItems[index].image != "Empty"
                      ? Image.network(
                          _foodItems[index].image,
                          height: 200,
                          width: screenWidth,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          'https://orbis-alliance.com/wp-content/themes/consultix/images/no-image-found-360x260.png',
                          height: 200,
                          width: screenWidth,
                          fit: BoxFit.fill,
                        ),
                  const SizedBox(height: 10.0),
                  Text(_foodItems[index].name),
                  const SizedBox(height: 5.0),
                  Text(_foodItems[index].food),
                  const SizedBox(height: 5.0),
                  Text(_foodItems[index].phoneNo),
                  const SizedBox(height: 5.0),
                  Text(_foodItems[index].address),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
