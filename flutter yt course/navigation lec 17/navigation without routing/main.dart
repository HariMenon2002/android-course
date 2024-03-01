//listile widget
import 'package:flutter/material.dart';
import 'dart:math'; // for math functionalities
import 'package:demo_project/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme:ThemeData(
          primarySwatch: Colors.blue,
      ),
      home:HomeScreen(),
    );
  }
}

/*
1.Instead of writing whole in a single file , let us create diff files and import it
2.right click on lib and create a new dart file(eg. home_screen)
3.Then you have to import the widget and the file in main.dart
 */

