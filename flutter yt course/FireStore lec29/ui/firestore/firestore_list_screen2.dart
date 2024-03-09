import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebaseproject/ui/auth/login_screen.dart';
import 'package:firebaseproject/ui/firestore/add_firestore_data.dart';
import 'package:firebaseproject/ui/posts/add_posts.dart';
import 'package:firebaseproject/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

//retrieving from firestore database

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {

  final auth=FirebaseAuth.instance;

  final editController=TextEditingController();
  final fireStore=FirebaseFirestore.instance.collection('users').snapshots();


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
        title: Center(child: Text('Firestore',style: TextStyle(color: Colors.white),)),
      ),

      body:Column(
        children:[
          const SizedBox(height:10),
          
          
          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){


                if(snapshot.connectionState==ConnectionState.waiting) return CircularProgressIndicator();
                if(snapshot.hasError) return Text('some error');
                return Expanded(
                  child:ListView.builder(itemCount:snapshot.data!.docs.length,itemBuilder: (context,index){
                    return ListTile(
                        title:Text(snapshot.data!.docs[index]['title'].toString()),
                    );
                  },

                  ),
                );
              }
          ),


        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>AddFirestoreDataScreen()));

        },
        child:Icon(Icons.add),
      ),
    );
  }


  Future<void> showMyDialog(String title,String id )async{
    editController.text=title;
    return showDialog(
        context:context,
        builder:(BuildContext context){
          return AlertDialog(
            title:Text("update"),
            content:Container(
              child:TextField(
                controller:editController,
                decoration: InputDecoration(
                  hintText: 'edit',

                ),
              ),
            ),
            actions:[
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("cancel")),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);




                  },

                  child: Text("update")),
            ],
          );
        }
    );
  }





}


