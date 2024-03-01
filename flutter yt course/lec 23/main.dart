import 'package:flutter/material.dart';
import "package:flutterproj/home_screen.dart";
import "package:flutterproj/splash_screen.dart";

//splash screen and future and shared preference
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "Multirole",
      // darkTheme: ThemeData(brightness: Brightness.dark),
      // themeMode: ThemeMode.dark,
      home:const SplashScreen(),
    );
  }
}

