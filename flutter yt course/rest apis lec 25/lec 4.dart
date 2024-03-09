import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:apidemo/Models/user_model.dart';

//in this example we will deal with complex json data

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List<UserModel> userList=[];
  Future<List<UserModel>> getUserApi() async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data=jsonDecode(response.body.toString());

    for(Map<String,dynamic> i in data){            //so first parameter is string, second is dynamic ie.it can be of anytype
      print(i["name"]);
      userList.add(UserModel.fromJson(i)); //to map to usermodel
    }

    if(response.statusCode==200){
        return userList;
    }
    else{
       return userList;
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("API Course"),
            ),

           body:Column(
             children: [
                   Expanded(
                      child:FutureBuilder(
                        future: getUserApi(),
                        builder: (context,AsyncSnapshot<List<UserModel>>snapshot){

                          if(!snapshot.hasData){
                            return CircularProgressIndicator();
                          }
                                return ListView.builder(
                                    itemCount: userList.length,
                                    itemBuilder: (context,index){
                                            return Card(
                                              child:Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Column(
                                                         children: [
                                                            ReusableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                                            ReusableRow(title: 'username', value: snapshot.data![index].username.toString()),
                                                            ReusableRow(title: 'email', value: snapshot.data![index].email.toString()),

                                                           //complex json part
                                                            ReusableRow(title: 'address',
                                                                value: snapshot.data![index].address!.city.toString()+"\n"+
                                                                       snapshot.data![index].address!.geo!.lat.toString()+"\n"+
                                                                       snapshot.data![index].address!.suite.toString()
                                                            ),



                                                         ],
                                                ),
                                              ),
                                            );
                                     }
                                );
                        }
                      ),
                   ),
             ],
           ),


        ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
  ReusableRow({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}


/*
1.Take the /users link from json placeholder
2.In this eg. we have objects inside objects
3.Copy the contents of the link and use json to dart. Paste the converted data in user_model.dart
 */