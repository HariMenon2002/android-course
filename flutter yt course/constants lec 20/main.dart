import 'package:demo_project/home_screen.dart';
import 'package:flutter/material.dart';
//whatsapp ui

void main() {
  //print("hello guys");
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeScreen(),
    );
  }
}

/*
1.create a constant file so that eg instead of Colors.grey i just have to put Gray
2.Also if you have to change same property of widgets, you just have to change value of const
 */


