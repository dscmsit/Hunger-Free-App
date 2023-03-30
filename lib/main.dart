import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../utills/route_builder.dart';
import 'firebase_options.dart';
import 'utills/route_names.dart';

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
      initialRoute: RouteNames.onBoardingScreen,
      // home: UserSetup(),
      onGenerateRoute: RoutesBuilder.generateRoute,
    );
  }
}
