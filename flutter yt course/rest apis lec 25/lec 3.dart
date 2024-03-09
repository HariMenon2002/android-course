
import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

//in this example we will build our own custom model

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  List<Photos> photosList=[];
  Future<List<Photos>> getPhotos() async{
    final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());

    if(response.statusCode==200){
            for (Map i in data){
              Photos photos=Photos(title:i['title'],url:i['url'],id:i['id']);
              photosList.add(photos);
            }
            return photosList;
    }
    else{
      return photosList;
    }


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:Text('API Course'),
          ),

          body:Column(
            children: [
                Expanded(
                  child: FutureBuilder(
                      future:getPhotos(),
                      builder: (context,AsyncSnapshot<List<Photos>>snapshot){
                        return ListView.builder(
                            itemCount: photosList.length,
                            itemBuilder: (context,index){
                            return ListTile(
                                leading:CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                                ),
                                subtitle: Text(snapshot.data![index].id.toString()),
                                title: Text(snapshot.data![index].title.toString()),  //! means it should not be null , i can also do photosList[index].title.toString()
                            );
                        });
                  }),
                ),
                
            ],
          ),
        ),
    );
  }
}

class Photos{
  String title,url;//these parameters are present in the url
  int id;

  Photos({required this.title, required this.url,required this.id});
}
/*
1.Go to json placeholder website and go to /photos in resources and copy the link and observe its parameters
2.
 */