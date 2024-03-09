//filtering the list

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebaseproject/ui/auth/login_screen.dart';
import 'package:firebaseproject/ui/posts/add_posts.dart';
import 'package:firebaseproject/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth=FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.ref('Post');
  final searchFilter=TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // ref.onValue.listen((event) { });           you can also do this
  }
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
        title: Center(child: Text('Post',style: TextStyle(color: Colors.white),)),
      ),

      body:Column(
        children:[
          SizedBox(height:10),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(             //for filtering list
              controller:searchFilter,
              decoration: InputDecoration(
                hintText: "Search",
                border:OutlineInputBorder(),
              ),

              onChanged: (String value){
                  setState(() {

                  });
              },

            ),
          ),
          Expanded(
            child:FirebaseAnimatedList(
                query:ref,
                defaultChild:Text("loading"),
                itemBuilder:(context,snapshot,animation,index){

                  final title=snapshot.child("title").value.toString();

                  if(searchFilter.text.isEmpty){
                    return ListTile(
                      title:Text(snapshot.child('title').value.toString()), //title attribute of a child,snapshot symbolises post
                      subtitle:Text(snapshot.child('id').value.toString()),
                    );
                  }
                  else if(title.toLowerCase().contains(searchFilter.text.toLowerCase().toString())){
                    return ListTile(
                      title:Text(snapshot.child('title').value.toString()), //title attribute of a child,snapshot symbolises post
                      subtitle:Text(snapshot.child('id').value.toString()),
                    );
                  }

                  else{
                    return Container();
                  }
                }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context)=>AddPostScreen()));

        },
        child:Icon(Icons.add),
      ),
    );
  }
}


/*
1.Now we are trying to filter the list
2.If i type in search, i will get the corresponding child
 */
