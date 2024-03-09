import 'dart:convert';

//use the below according to the corresponding lec
import 'package:apidemo/Models/user_model.dart';
import 'package:apidemo/example_three.dart';
import 'package:apidemo/example_two.dart';
import 'package:apidemo/example_four.dart';
import 'package:apidemo/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleFour(),         // for each file do ExampleTwo(),Three(), Four() seperately
    );
  }
}

/*
1.Go to pub.dev and get http package
2.Go to plugins in android studio and get Jsontodart(api response is to be mapped to model)package from market place
3.or you can go online and convert your json to dart code and make a dart file here and paste that code
4.For eg. take the posts api link from json placeholder website, paste the json contents from that link on the jsonto dart website

//to use plugin
5.Create a directory called models in lib file
6.right click and select jsontodart in new. paste contents from api link from json placeholder and this and click on generate
7.Come back to home_screen.dart and make the future function to access the api

8.Another thing to note is that here the api content from json placeholder is in the form of array of objects ie.[{..},{..},..] and thus we use
    List<PostsModel>
9.Another problem is that becoz the array doesnt have a name, my jsontodart converter converts only the first object into dart, and that is why we need a list for all the object


 */