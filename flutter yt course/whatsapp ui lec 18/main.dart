import 'package:demo_project/home_screen.dart';
import 'package:flutter/material.dart';
//whatsapp ui

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Whatsapp",
      theme:ThemeData(
        primarySwatch: Colors.teal,     //teal color for whatsapp
      ),
      home: HomeScreen(),
    );
  }
}



