import 'package:flutter/material.dart';
import 'package:demo_project/screen_two.dart';
import 'package:demo_project/constant.dart';
import 'package:demo_project/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';
//Calculator UI

//Main fn same as lec 20


class HomeScreen extends StatefulWidget {
  static const String id="home_screen";  //for routing
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userInput="";
  var answer="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10),
          child: Column(

            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(userInput.toString(),style:TextStyle(fontSize: 30,color: Colors.white))),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(answer.toString(),style:TextStyle(fontSize: 30,color: Colors.white))),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(title: "AC",onPress: (){
                          setState(() {
                            userInput="";
                            answer="";
                          });
                          print('tap5');  //prints in terminal
                        },),
                        MyButton(title:"+/-",onPress: (){userInput+="+/-";
                        setState(() {

                        });},),
                        MyButton(title:"%",onPress: (){userInput+="%";
                        setState(() {

                        });},),
                        MyButton(title:"/",onPress: (){userInput+="/";
                        setState(() {

                        });},color: Colors.orange,),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: "7",onPress: (){
                          userInput+="7";   //i am using + to concatenate with other nos eg. suppose i want 78
                          setState(() {

                          });
                          print('tap4');  //prints in terminal
                        },),
                        MyButton(title:"8",onPress: (){
                          userInput+="8";
                          setState(() {

                          });
                        },),
                        MyButton(title:"0",onPress: (){
                          userInput+="0";
                          setState(() {

                          });
                          },),
                        MyButton(title:"x",onPress: (){
                          userInput+="x";
                          setState(() {

                          });},color: Colors.orange,),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: "4",onPress: (){
                          userInput+="4";
                          setState(() {

                          });
                          print('tap3');  //prints in terminal
                        },),
                        MyButton(title:"5",onPress: (){userInput+="5";
                        setState(() {

                        });},),
                        MyButton(title:"6",onPress: (){userInput+="6";
                        setState(() {

                        });},),
                        MyButton(title:"-",onPress: (){userInput+="-";
                        setState(() {

                        });},color: Colors.orange,),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: "1",onPress: (){
                          userInput+="1";
                          setState(() {

                          });
                          print('tap2');  //prints in terminal
                        },),
                        MyButton(title:"2",onPress: (){userInput+="2";
                        setState(() {

                        });},),
                        MyButton(title:"3",onPress: (){userInput+="3";
                        setState(() {

                        });},),
                        MyButton(title:"+",onPress: (){userInput+="+";
                        setState(() {

                        });},color: Colors.orange,),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: "0",onPress: (){
                          userInput+="0";
                          setState(() {

                          });
                          print('tap1');  //prints in terminal
                        },),
                        MyButton(title:".",onPress: (){
                          userInput+=".";
                          setState(() {

                          });
                        },),
                        MyButton(title:"DEL",onPress: (){
                          userInput=userInput.substring(0,userInput.length-1);
                          setState(() {

                          });
                        },),
                        MyButton(title:"=",onPress: (){
                          equalPress();
                          setState(() {

                          });
                        },color: Colors.orange,),
                      ],
                    ),
                  ],
                ),
              ),

              //this would not have been possible if required was used
              SizedBox(height:10,),
            ],
          ),
        ),
      )
    );
  }

  void equalPress(){

        String finalUserInput= userInput.replaceAll('x', '*');// for multiplication
        Parser p= Parser();
        Expression expression=p.parse(finalUserInput);
        ContextModel contextModel=ContextModel();

        double eval=expression.evaluate(EvaluationType.REAL,contextModel);
        answer=eval.toString();
  }
}


/*
1.Here we create a seperate components directory in lib and store a dart file there for components(MyButton)
2.Import it here
3.Go to pub.dev, get math expression version number from installation section, paste it in pubspec.yaml and do get.
4.Import it in home_screen.dart
5.It is used to evaluate the expressions.
 */


