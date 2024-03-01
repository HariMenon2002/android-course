import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const String id="home_screen";  //for routing
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Whatsapp'),
          bottom:TabBar(
              tabs: [
                Tab(child: Icon(Icons.camera_alt)),
                Tab(child: Text('Chats')),
                Tab(child:Text('Status')),
                Tab(child: Text('Call')),
              ],
          ),
          actions:[
            Icon(Icons.search),
            SizedBox(width:10),
            //Icon(Icons.more_horiz_outlined),
            PopupMenuButton(
                icon:Icon(Icons.more_vert_outlined),
                itemBuilder: (context)=>[
                  PopupMenuItem(
                      value:'1',
                      child: Text('New Group')
                  ),
                  PopupMenuItem(
                      value:'1',
                      child: Text('Settings')
                  ),
                  PopupMenuItem(
                      value:'1',
                      child: Text('Logout'),
                  ),
                ],
            ),
            SizedBox(width:10),
          ],

        ),
        body:TabBarView(
          children: [
            Text('Camera'),

            ListView.builder(        //this will be for chats
                  itemCount: 100,
                  itemBuilder: (context,index){
                         return ListTile(
                           leading:CircleAvatar(
                             backgroundImage:AssetImage("assets/virat kohli 2.jpg"),
                         ),
                             title: Text("john wick"),
                           subtitle: Text("where is my dog"),
                           trailing: Text("6:26 pm"),
                         );
                  }
              ),//will be for Chats

            ListView.builder(        //this will be for status
                itemCount: 100,
                itemBuilder: (context,index){

                    return ListTile(
                        leading: Container(

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 5,
                                color: Colors.green
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/virat kohli 2.jpg"),
                          ),
                        ),
                        title: Text("john wick"),
                        subtitle: Text("35m ago"),

                      );


                }
            ),// for status
            ListView.builder(        //this will be for call
                itemCount: 100,
                itemBuilder: (context,index){
                  return ListTile(

                      leading:CircleAvatar(
                        backgroundImage: AssetImage("assets/virat kohli 2.jpg"),
                    ),
                    title: Text("john wick"),
                    subtitle: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.phone)
                    ),
                    trailing: Icon(index/2==0?Icons.phone:Icons.video_call), //you can use ternary operator as well
                  );
                }
            ),
          ],       //attaches view to each tab in appbar
        )
           //for the navigation bar


      ),
    );
  }
}
