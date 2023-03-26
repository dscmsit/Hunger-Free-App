import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_hunger/screen/NavBar.dart';


class OnBoardingScreen extends StatefulWidget {
  static const String id = "OnBoardingScreen";
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List onBoardingData = [
    {
      "image": 'assets/images/screen1.png',
      "title": "Product 1",
      "description": "Get The Food From Your NearBy"
    },
    {
      "image": 'assets/images/screen2.png',
      "title": "Product 2",
      "description": "Contribute to the society"
    },
    {
      "image":  'assets/images/screen3.png',
      "title": "Product 3",
      "description": "Enjoy the meal"
    }
  ];

  PageController pageController = PageController();

  void onPressed() {

    //Yaha pe likhna hai kii konse page pe jaana hai
  }


  @override
  Widget build(BuildContext context) {
    //this will remove the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom]);
    return  Scaffold(

      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(onPressed: onPressed, child: Text('Skip') )
        ],
      ),
      
      body: Stack(children: [
        SizedBox(
          height: 30,
        ),
        PageView.builder(scrollDirection: Axis.horizontal,
          controller: pageController,
          itemCount: onBoardingData.length,
          itemBuilder: (context,index){
            return Center(
              child: Column(

                children: [

                  Image.asset(onBoardingData[index]['image']),
                  Text(
                    onBoardingData[index]['title'],
                    style: TextStyle(fontSize: 20, color: Colors.blue),

                  )
                  ,
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    onBoardingData[index]['description'],
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent),

                  )


                ],


              ),
            );


          },




        )




      ],),
    );
  }


}
