import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterproj/home_screen.dart';
import 'package:flutterproj/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {                      //this is the fn which runs before below widget is called
    // TODO: implement initState
    super.initState();
    //print('run');
    Timer(Duration(seconds: 5),(){           //the below scaffold widget in body appears for 5s and then it goes to LoginScreen
      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fill,
        image: NetworkImage("https://images.pexels.com/photos/958546/pexels-photo-958546.jpeg?auto=compress"),),
    );
  }
}

/*
1.Make a splash_screen.dart file
2.Make a login_screen.dart file
3.For shared preference ,go to pub.dev , get the dependency from installation section and put it in yaml file. You may require to restart the project after this

 */