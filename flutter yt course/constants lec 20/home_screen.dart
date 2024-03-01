import 'package:flutter/material.dart';

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
              Text('Asif Taj',style:TextStyle(fontSize: 30,color:Gray),),
              Text('Asif Taj',style:TextStyle(fontSize: 30,color:Green),),
              Text('Asif Taj',style:hariTextStyle),
              Container(
                height:50,

                decoration: BoxDecoration(
                    color:Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child:Text('Login',style:headingTextStyle,)),
              ),
              SizedBox(height: 10,),
              Container(
                height:50,

                decoration: BoxDecoration(
                    color:Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child:Text('Sign up',style: headingTextStyle,)),
              ),
              SizedBox(height: 10,),
              Container(
                height:50,

                decoration: BoxDecoration(
                    color:Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child:Text('Verify up',style:headingTextStyle)),
              ),
              SizedBox(height: 10,),
              Container(
                height:50,

                decoration: BoxDecoration(
                    color:Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child:Text('Continue up',style: headingTextStyle,)),
              ),

            ],
          ),
        ),
      )
    );
  }
}
