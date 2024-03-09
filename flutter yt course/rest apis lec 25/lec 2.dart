import "dart:convert";


import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:apidemo/Models/posts_model.dart";


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postList=[];   //we have to do it as we dont have array name for api content of the website

  Future<List<PostsModel>> getPostApi()async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
         postList.clear();
         for(Map<String, dynamic>i in data){
           postList.add(PostsModel.fromJson(i));
         }

         return postList;
    }
    else{

         return postList;
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Center(child: Text("API COURSE")),
            ),
            body:Column(
              children: [
                Expanded(                    //used as it takes more than length of screen
                  child: FutureBuilder(
                      future: getPostApi(),
                      builder:(context,snapshot){
                        if(!snapshot.hasData){return Text('loading');}
                        else{
                          return ListView.builder(
                              itemCount: postList.length,
                              itemBuilder: (context,index){
                                            //return Center(child: Text(index.toString()));
                                            return Card(
                                                child: Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Title\n'+postList[index].title.toString()),
                                                        Text('Description',style: TextStyle(fontSize: 15),),
                                                        Text(postList[index].body.toString()),
                                                      ],
                                                  ),
                                                ),
                                            );
                                        }
                          );
                        }
                      }
                  ),
                ),
              ],
            ),
        ),
    );
  }
}
