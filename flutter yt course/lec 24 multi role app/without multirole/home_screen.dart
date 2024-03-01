import 'package:flutter/material.dart';
import 'package:flutterproj/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String email='',age='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    email=sp.getString('email')??""; //?? is used as it can be null as well
    age=sp.getString('age')??"";//?? is used as it can be null as well
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        automaticallyImplyLeading: false,
      ),
      body:SafeArea(
        child: Padding(
          padding:EdgeInsets.all(20.0),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Home screen")),
              Row(           //to display entered data
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('email'),
                   Text(email),
                 ],
              ),
              SizedBox(height:10),
              Row(           //to display entered data
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('age'),
                  Text(age),
                ],
              ),


              SizedBox(height: 40,),
              InkWell(
                onTap: () async{//async is written as shared preference is used
                  SharedPreferences sp=await SharedPreferences.getInstance();
                  sp.clear(); //clears all sp data                                     //for logout


                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));

                },

                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child:Center(
                    child: Text('Logout'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
1.Make a splash_screen.dart file
2.Make a login_screen.dart file
 */
