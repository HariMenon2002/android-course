//dealing with complex json

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Models/products_model.dart';


class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({Key? key}) : super(key: key);

  @override
  State<LastExampleScreen> createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {

  Future<ProductsModel> getProductApi() async{
    final response=await http.get(Uri.parse("https://webhook.site/f2bf3143-3e68-46d1-a5a2-d5ae3cc07bde"));   //the link may expire after some days
    var data=jsonDecode(response.body.toString());

    if(response.statusCode==200){
        return ProductsModel.fromJson(data);
    }
    else{
      return ProductsModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("api course"),
          ),

          body: Column(
            children: [
              Expanded(
                  child: FutureBuilder<ProductsModel>(
                    future: getProductApi(),
                    builder: (context,snapshot){

                      if(snapshot.hasData)
                      {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,  //the api also has a section named data
                          itemBuilder: (context,index){
                                      return Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                             // Text(index.toString()),
                                              ListTile(
                                                title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                                subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                                                leading:CircleAvatar(
                                                  backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                                                ),
                                              ),
                                              Container(
                                                height:MediaQuery.of(context).size.height*.3,
                                                width:MediaQuery.of(context).size.width*1,
                                                child:ListView.builder(
                                                  scrollDirection:Axis.horizontal,
                                                  itemCount: snapshot.data!.data![index].images!.length,
                                                  itemBuilder:(context,position){    //giving another name eg.position instead of index
                                                    return Padding(
                                                      padding: EdgeInsets.only(right:10),
                                                      child: Container(
                                                        height:MediaQuery.of(context).size.height*.25,
                                                        width:MediaQuery.of(context).size.width*.5,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          image:DecorationImage(
                                                              fit:BoxFit.cover,
                      /*data is a list */                     image:NetworkImage(snapshot.data!.data![index].images![position].url.toString()),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              //Icon(snapshot.data!.data![index].inWishList==true? Icons.favorite:Icons.favorite_outline),
                                            ],
                                        ),
                                      );
                          }
                      );
                      }
                      else{
                        return Text("loading");
                       }

                    },

                  ),
              ),
            ],
          ),
        ),);
  }
}













/*
1.Suppose I have a complete response(given below)(copy from tech brothers yt channel api part 11), i can view its overall structure by going to json viewer and pasting the response
2.To create an api link from response(reverse of what we did in previous lectures) go to webhook.site, go to edit section and paste the response
3.Copy that link
4.Take the same response and convert it to a model using json to dart and create a file products_model.dart in models directory.Let the class name be ProductModel
5.Another thing to note is that this response is covered as an object and not list of objects like in prev lectures 
 */

//this is the given response
/*
 {
"success" : true, 
"message" : "All data" ,
"data" : [
        {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"on_sale" : true, 
"sale_percent" : 20,
"sold" : 20, 
"slider_new" : false, 
"slider_recent" : false, 
"slider_sold" : false, 
"date" : "2023-01-05T07: 56: 19.219Z" , 
"title" :"TMTS121-50199" , 
"categories" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"type" : "Women" , 
"sale_percent" : 20,
"date" : "2023-01-05T07: 56: 19.219Z" , 
"name" : "clothes" ,
"image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" 
            },
"subcat" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"type" : "Women" , 
"sale_percent" : 20,
"date" : "2023-01-05T07: 56: 19.219Z" , 
"name" :"Shirts"
            },
"shop" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"is_active" : false, 
"created_At" : "2023-01-05T07: 56: 19.219Z" , 
"name" :"Shirts" ,
"description" : "This is enderobe brand" ,
"shopemail" : "adenreobe@gmail.com" ,
"shopaddress" : "Islamabad F8" ,
"shopcity" : "Islamabad" ,
"userid" : "23asdfasfdsfd" ,
"image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" 
            },
"price" : "2500" ,
"sale_title" : "Winter Sale" ,
"sale_price" : "2300" ,
"description" : "22% off all the sales " ,
"color" : "#FF6347,#CD5C5C" ,
"size" : "S,M,L,XL,XXL" ,
"in_wishlist" : true, 
"images" : [
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                },
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200"
                },
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200"
                }
            ]
        
    },
     {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"on_sale" : true, 
"sale_percent" : 20,
"sold" : 20, 
"slider_new" : false, 
"slider_recent" : false, 
"slider_sold" : false, 
"date" : "2023-01-05T07: 56: 19.219Z" , 
"title" :"TMTS121-50199" , 
"categories" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"type" : "Women" , 
"sale_percent" : 20,
"date" : "2023-01-05T07: 56: 19.219Z" , 
"name" : "clothes" ,
"image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" 
            },
"subcat" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"type" : "Women" , 
"sale_percent" : 20,
"date" : "2023-01-05T07: 56: 19.219Z" , 
"name" :"Shirts"
            },
"shop" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"is_active" : false, 
"created_At" : "2023-01-05T07: 56: 19.219Z" , 
"name" :"Shirts" ,
"description" : "This is enderobe brand" ,
"shopemail" : "adenreobe@gmail.com" ,
"shopaddress" : "Islamabad F8" ,
"shopcity" : "Islamabad" ,
"userid" : "23asdfasfdsfd" ,
"image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" 
            },
"price" : "2500" ,
"sale_title" : "Winter Sale" ,
"sale_price" : "2300" ,
"description" : "22% off all the sales " ,
"color" : "#FF6347,#CD5C5C" ,
"size" : "S,M,L,XL,XXL" ,
"in_wishlist" : true, 
"images" : [
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                },
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200"
                },
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200"
                }
            ]
        
    },
     {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"on_sale" : true, 
"sale_percent" : 20,
"sold" : 20, 
"slider_new" : false, 
"slider_recent" : false, 
"slider_sold" : false, 
"date" : "2023-01-05T07: 56: 19.219Z" , 
"title" :"TMTS121-50199" , 
"categories" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"type" : "Women" , 
"sale_percent" : 20,
"date" : "2023-01-05T07: 56: 19.219Z" , 
"name" : "clothes" ,
"image" : "https: //images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200" 
            },
"subcat" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"type" : "Women" , 
"sale_percent" : 20,
"date" : "2023-01-05T07: 56: 19.219Z" , 
"name" :"Shirts"
            },
"shop" : {
"_id" : "asdf231asdfadsfsad2438rjsd" ,
"is_active" : false, 
"created_At" : "2023-01-05T07: 56: 19.219Z" , 
"name" :"Shirts" ,
"description" : "This is enderobe brand" ,
"shopemail" : "adenreobe@gmail.com" ,
"shopaddress" : "Islamabad F8" ,
"shopcity" : "Islamabad" ,
"userid" : "23asdfasfdsfd" ,
"image" : "https://images.pexels.com/photos/5531004/pexels-photo-5531004.jpeg?auto=compress&cs=tinysrgb&w=1200" 
            },
"price" : "2500" ,
"sale_title" : "Winter Sale" ,
"sale_price" : "2300" ,
"description" : "22% off all the sales " ,
"color" : "#FF6347,#CD5C5C" ,
"size" : "S,M,L,XL,XXL" ,
"in_wishlist" : true, 
"images" : [
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                },
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/4495705/pexels-photo-4495705.jpeg?auto=compress&cs=tinysrgb&w=1200"
                },
                {
"id" : "2342asdfasdf34",
"url" : "https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&w=1200"
                }
            ]
        
    }
]
}

*/

