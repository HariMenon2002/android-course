//listile widget
import 'package:demo_project/screen_two.dart';
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

      initialRoute: HomeScreen.id,
      routes:{
        HomeScreen.id:(context)=>HomeScreen(),
        ScreenTwo.id:(context)=>ScreenTwo(),
      },
    );
  }
}

/*
1.Same as prev
 */

