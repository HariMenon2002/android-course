import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/ui/auth/login_screen.dart';
import 'package:firebaseproject/ui/posts/add_posts.dart';
import 'package:firebaseproject/utils/utils.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
                  IconButton(color:Colors.white,onPressed: (){
                    auth.signOut().then((value) {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  }, icon:Icon(Icons.logout_outlined)),
                  SizedBox(width:10,)
        ],
        backgroundColor:Colors.deepPurple,
        title: Center(child: Text('Post',style: TextStyle(color: Colors.white),)),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context)=>AddPostScreen()));

        },
        child:Icon(Icons.add),
      ),
    );
  }
}
