import 'package:flutter/material.dart';
import 'package:demo_project/screen_two.dart';
import 'package:demo_project/constant.dart';

//use main and constant file from prev components file
//constructor


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
              MyButton(title1:"I am good",subtitle: "Testing",),
              MyButton(title1:"Signup",subtitle: "Second",),
              MyButton(title1:"Good",subtitle: "Third",),//i have created a component and using it here
              //MyButton(),  //i can do this if required was not there
              SizedBox(height:10,),
            ],
          ),
        ),
      )
    );
  }
}

class MyButton extends StatelessWidget {
  final String title1,subtitle;                                                    //instead of final you can also remove const
  const MyButton({Key? key,required this.title1,required this.subtitle}) : super(key: key);      //This is the constructor, i can pass title to this
  //const MyButton({Key? key,this.title1="",this.subtitle=""}) : super(key: key); //this can be used if the parameter is not compulsory

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
        //child:Center(child: Text(title1,style:TextStyle(fontSize: 18,color:whiteColor))),
        child:Center(child: Text(title1+subtitle,style:TextStyle(fontSize: 18,color:whiteColor))),
      ),
    );
  }
}

