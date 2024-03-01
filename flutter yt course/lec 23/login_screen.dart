import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            
            InkWell(
              onTap: () async{              //async is written as shared preference is used
                    // int res=add(3);
                    // print("tap");
                    // print(res);
                    //asifTaj();

                    SharedPreferences sp=await SharedPreferences.getInstance();   //it is basically used for local storage
                    sp.setString("name", "asif taj");
                    sp.setInt("age", 25);
                    sp.setBool('isLogin',false);

                    print(sp.getString('name'));
                    print(sp.getInt('age'));
                    print(sp.getBool('isLogin'));

                    //to remove a value
                    sp.remove('name');
                    print(sp.getString('name'));
              },

              child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child:Center(
                    child: Text('Click'),
                  ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  // int add(int c){
  //   int a=9,b=9;
  //   return (a+b+c);
  // }

      // Future<int> asifTaj() async{               //future function helps in waiting, it can return any data type eg.<float>,<void>etc.
      //         await Future.delayed(Duration(seconds: 3));
      //         print('delayed');
      //         return 0;
      // }//future function
}



//3.For shared preference ,go to pub.dev , get the dependency from installation section and put it in yaml file. You may require to restart the project after this