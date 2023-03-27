

import 'package:flutter/material.dart';
import 'package:no_hunger/log_in.dart';
import 'package:no_hunger/screen/collector_distributor_screen.dart';
import 'package:no_hunger/screen/onBoardingScreen.dart';
import 'package:no_hunger/screen/profile_page.dart';
import 'package:no_hunger/screen/user_selector.dart';
import 'package:no_hunger/sign_up.dart';
import 'package:no_hunger/utills/route_names.dart';

class RoutesBuilder {

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
      case RouteNames.logInScreen:
        return MaterialPageRoute(builder: (context) => const LogIn());
      case RouteNames.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case RouteNames.profileScreen:
        return MaterialPageRoute(builder: (context) =>  ProfilePage());
      case RouteNames.userSelectorScreen:
        return MaterialPageRoute(builder: (context) => const UserSelector());
      case RouteNames.collectorDistributorScreen:
        return MaterialPageRoute(builder: (context) => const CollectorDistributor());
      default :
        return MaterialPageRoute(builder:
        (context){
          return const Scaffold(
            body: Center(
              child: Text("Wrong Route"),
            ),
          );
        }
        );
    }
  }







}