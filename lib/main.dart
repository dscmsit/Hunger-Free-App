import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'screen/SplashScreen.dart';
=======
import 'package:no_hunger/sign_up.dart';
>>>>>>> 2301f0914e67d3077a555c838aa249ef3187d6ba

import 'firebase_options.dart';

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
<<<<<<< HEAD
    return  const MaterialApp(
      home: SplashScreen(),
    );
  }
}



=======
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const SignUp(),
    );
  }
}
>>>>>>> 2301f0914e67d3077a555c838aa249ef3187d6ba
