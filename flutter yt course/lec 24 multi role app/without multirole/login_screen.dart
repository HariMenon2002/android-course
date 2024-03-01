import 'package:flutter/material.dart';
import 'package:flutterproj/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final emailController= TextEditingController();             //to store the value in text field
  final passwordController=TextEditingController();
  final ageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          automaticallyImplyLeading: false,   //to remove the back arrow

        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "email",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "age",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "password",
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () async{//async is written as shared preference is used
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                // i am not storing password

                sp.setBool('isLogin', true);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));

              },

              child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child:Center(
                    child: Text('Login'),
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



//3.For shared preference ,go to pub.dev , get the dependency from installation section and put it in yaml file. You may require to restart the project after this