// we can display the list of data in post screen
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
          Expanded(
              // child: StreamBuilder(
              //
              //    builder:(context,snapshot){
              //      return ListView.builder(
              //        itemBuilder: (context,index){
              //          return ListTile(
              //             title:Text("ASDFS"),
              //          );
              //        }
              //      );
              //    }, stream: null,
              // ),

              child: StreamBuilder(
              stream:ref.onValue,
              builder:(context,snapshot){

                if(!snapshot.hasData){return CircularProgressIndicator();}
                else {
                  Map<dynamic,dynamic> map=snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list=[];
                  list.clear();
                  list=map.values.toList();
                  return ListView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(list[index]['title']),
                          subtitle: Text(list[index]['id'].toString()),
                        );
                      }
                  );
                }
              },
            ),
          ),
          Expanded(
            child:FirebaseAnimatedList(
                query:ref,
                defaultChild:Text("loading"),
                itemBuilder:(context,snapshot,animation,index){
                  return ListTile(
                      title:Text(snapshot.child('title').value.toString()), //title attribute of a child,snapshot symbolises post
                      subtitle:Text(snapshot.child('id').value.toString()),
                  );
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
1.I am trying to bring firebase data here via a list
2.If i delete or add something, automatically this list also updates
3.You can either use streambuilder or firebase animated list.Both has its own applications
4.Both gives same result
 */
