//main.dart same as previous (lec 20)
import 'package:flutter/material.dart';
import 'package:demo_project/screen_two.dart';
import 'package:demo_project/constant.dart';

class HomeScreen extends StatefulWidget {
  static const String id="home_screen";  //for routing
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body:SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 30),
          child: Column(

            children: [
              MyButton(),
              MyButton(),
              MyButton(),//i have created a component and using it here
              SizedBox(height:10,),
            ],
          ),
        ),
      )
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 10),
      child: Container(
          height:50,
          //width:1000,

          decoration: BoxDecoration(
          color:Colors.pink,
          borderRadius: BorderRadius.circular(50),
          ),
        child:Center(child: Text('LOGIN',style:TextStyle(fontSize: 18,color:whiteColor))),
      ),
    );
  }
}

