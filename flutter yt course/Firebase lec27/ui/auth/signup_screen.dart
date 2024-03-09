import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/ui/auth/login_screen.dart';
import 'package:firebaseproject/widgets/round_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey=GlobalKey<FormState>();        //works as a unique identifier for a form
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  FirebaseAuth _auth  =FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();            //dispose when screen is not there
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.deepPurple,
          title: Padding(padding:EdgeInsets.only(bottom:8),child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white),))),
        ),
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key:_formKey,
                  child:Column(
                    children: [
                      TextFormField(

                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          // helperText: 'Enter email e.g.jon@gmail.com',
                          prefixIcon: Icon(Icons.alternate_email),
                        ),

                        validator: (value){
                          if(value!.isEmpty) return 'Enter email';
                          return null;
                        },   //if user has not entered anything and is trying to login
                      ),
                      SizedBox(height:10),
                      TextFormField(

                        controller: passwordController,
                        obscureText: true,             //to hide the password
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          // helperText: 'Enter email e.g.jon@gmail.com',
                          prefixIcon: Icon(Icons.lock_open),
                        ),

                        validator: (value){
                          if(value!.isEmpty) return 'Enter password';
                          return null;
                        },
                      ),


                    ],
                  )
              ),
              const SizedBox(height: 50,),

              RoundButton(title: 'Sign Up',onTap: (){
                if(_formKey.currentState!.validate()){

                }
              },),
              const SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Text('Login'))
                ],
              ),
            ],
          ),
        )
    );
  }
}
