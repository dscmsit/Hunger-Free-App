import 'package:flutter/material.dart';
import 'package:no_hunger/screen/authentication.dart';
import 'package:no_hunger/screen/check_user_details.dart';
import 'package:no_hunger/screen/collector_distributor_screen.dart';
import 'package:no_hunger/screen/home_screen.dart';
import 'package:no_hunger/screen/on_boarding_screen.dart';
import 'package:no_hunger/screen/post_create_screen.dart';
import 'package:no_hunger/screen/profile_page.dart';
import 'package:no_hunger/screen/user_setup_screen.dart';
import 'package:no_hunger/utills/auth_gate.dart';
import 'package:no_hunger/utills/route_names.dart';

class RoutesBuilder {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      case RouteNames.profileScreenOriginal:
        return MaterialPageRoute(
            builder: (context) => const ProfilePageOriginal());
      case RouteNames.authenticationScreen:
        return MaterialPageRoute(
            builder: (context) => const AuthenticationScreen());
      case RouteNames.authGate:
        return MaterialPageRoute(builder: (context) => const AuthGate());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouteNames.collectorDistributorScreen:
        return MaterialPageRoute(
            builder: (context) => const CollectorDistributor());

      case RouteNames.userDetails:
        return MaterialPageRoute(builder: (context) => const UserDetails());
      case RouteNames.userSetup:
        return MaterialPageRoute(builder: (context) => const UserSetup());
      case RouteNames.newPost:
        return MaterialPageRoute(
            builder: (context) => Builder(builder: (BuildContext context) {
                  return const NewPost();
                }));

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("Wrong Route"),
            ),
          );
        });
    }
  }
}
