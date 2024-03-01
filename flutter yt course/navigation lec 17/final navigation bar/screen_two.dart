import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  static const String id="screen_two";      //for routing
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Navigation Drawer')),
        backgroundColor: Color(0xff764abc),

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount:100,
                itemBuilder: (context,index){

                  return ListTile(
                    leading: Icon(Icons.home),
                    title:Text('Page 1'),
                    onTap:(){
                      Navigator.pushNamed(context,ScreenTwo.id);
                    },
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}

/*
1.You can use either the back button or Navigator.pop(context); inside onPressed function
 */