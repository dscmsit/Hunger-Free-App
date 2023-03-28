import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:no_hunger/screen/collector_distributor_screen.dart';
import 'package:no_hunger/screen/onBoardingScreen.dart';
import 'package:no_hunger/screen/post_create_screen.dart';
import 'package:no_hunger/screen/profile_page_@.dart';
import 'package:no_hunger/utills/route_builder.dart';
import 'package:no_hunger/utills/route_names.dart';
import 'screen/SplashScreen.dart';
import 'package:no_hunger/sign_up.dart';
import 'firebase_options.dart';
import 'screen/user_selector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: MyFormScreen(),
      // initialRoute: RouteNames.collectorDistributorScreen,
      onGenerateRoute: RoutesBuilder.generateRoute,
    );
  }
}