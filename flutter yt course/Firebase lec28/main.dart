import 'package:firebaseproject/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//firebase

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:'flutter demo',
      // theme:ThemeData(
      //   primarySwatch: Colors.purple,
      // ),
      home: SplashScreen(),
    );
  }
}



/*
1.This lec 28 is almost same as 27 except that we are doing authentication and data entering here ie.basically crud operation in firebase
2.Gradle files are same as lec 27
 */
