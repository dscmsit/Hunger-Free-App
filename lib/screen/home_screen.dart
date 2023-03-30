import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:no_hunger/model/food_item.dart';
import 'package:no_hunger/utills/route_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define a list of food items
  final List<FoodItem> _foodItems = [];

  Future<void> getPosts() async {
    _foodItems.clear();
    var db = FirebaseFirestore.instance;
    db.collection("posts").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          String name = docSnapshot.get('Name');
          String image = docSnapshot.get('Image');
          String address = docSnapshot.get('Address');
          String food = docSnapshot.get('FoodDetails');
          String phoneNo = docSnapshot.get('PhoneNo');
          String dateAndTime = docSnapshot.get('Date');
          FoodItem item = FoodItem(
              name: name,
              food: food,
              image: image,
              address: address,
              phoneNo: phoneNo,
              dateAndTime: dateAndTime);

          setState(() {
            _foodItems.add(item);
          });
        }
        _foodItems.sort((a, b) => b.dateAndTime.compareTo(a.dateAndTime));
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
                  GestureDetector(
                      child: Text(_foodItems[index].phoneNo),
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: _foodItems[index].phoneNo));
                        Fluttertoast.showToast(
                          msg: 'Number Copied',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }),
                  const SizedBox(height: 5.0),
                  Text(_foodItems[index].address),
                  const SizedBox(height: 5.0),
                  Text(_foodItems[index].dateAndTime),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
