import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// doing api call without a model
//note :It is always best to do it with a model, this is just for reference
class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {

  var data;
  Future<void> getUserApi()async{
     final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
     if(response.statusCode==200){
          data=jsonDecode(response.body.toString());
     }
     else{

     }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
             appBar: AppBar(
               title: Text("API COURSE"),
               centerTitle: true,
             ),

             body:Column(
               children: [
                 Expanded(
                     child: FutureBuilder(
                       future: getUserApi() ,
                       builder: (context,snapshot){
                         if(snapshot.connectionState==ConnectionState.waiting) return Text('loading');
                         //else return Text(data[0]['name'].toString());

                         else {
                          return ListView.builder(
                               itemCount: data.length,
                               itemBuilder: (context, index) {
                                 return Card(
                                     child:Column(
                                       children: [
                                          ReusableRow(title: 'name', value: data[index]['name'].toString()),
                                          ReusableRow(title: 'username', value: data[index]['username'].toString()),
                                          ReusableRow(title: 'address', value: data[index]['address']['street'].toString()),
                                          ReusableRow(title: 'geo', value: data[index]['address']['geo'].toString()),
                                       ],
                                     )
                                 );


                           });
                         }
                       },
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

