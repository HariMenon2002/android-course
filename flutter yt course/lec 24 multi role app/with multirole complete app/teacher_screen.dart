import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
 
class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {


  String email='',age='',type='';
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
    type=sp.getString('userType')??"";
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher View'),
        automaticallyImplyLeading: false,
      ),
      body:SafeArea(
        child: Padding(
          padding:EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

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
              SizedBox(height:10),
              Row(           //to display entered data
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('type'),
                  Text(type.toString()),
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
