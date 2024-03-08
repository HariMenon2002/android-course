// flutterfire configure --project=testing-cli-44c7c

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
      home: Scaffold(
        appBar: AppBar(title: Text("testing fire"),),
        body:SafeArea(
          child:Center(child:Text("fhdh")),
        ),
      ),
    );
  }
}

/*
1.First install nodejs and set as env variable
2.Go to  firebase and do the necessary steps
3.flutter fire configure ... command given is to be run here in the terminal
4.Go to pubspec yaml and add firebase_core
5.Import the firebase files(given in documentation)
6.Call the async initialize app fn as given above in main function
 */
