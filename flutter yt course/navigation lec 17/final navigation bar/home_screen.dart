import 'package:flutter/material.dart';
import 'package:demo_project/screen_two.dart';

class HomeScreen extends StatefulWidget {
  static const String id="home_screen";  //for routing
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Navigation Drawer')),
        backgroundColor: Color(0xff764abc),

      ),
      drawer: Drawer(
        child:ListView(
          padding:EdgeInsets.only(top:0), //or EdgeInsets.zero
          children: [
            //DrawerHeader(child: Text('Hari Menon')),
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color:Color(0xff764abc),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://images.pexels.com/photos/18911192/pexels-photo-18911192/free-photo-of-the-bridge-is-over-water-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                ),
                accountName: Text('Hari Menon'),
                accountEmail: Text('dkfjs@gmail.com')
            ),
            ListTile(
               leading: Icon(Icons.home),
              title:Text('Page 1'),
              onTap:(){
                 Navigator.pushNamed(context,ScreenTwo.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title:Text('Page 2'),
              onTap:(){
                Navigator.pushNamed(context,HomeScreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title:Text('Logout'),
              onTap:(){
                Navigator.pushNamed(context,HomeScreen.id);
              },
            ),

          ],
        ),
      ),   //for the navigation bar

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Center(
                child: TextButton(
                    onPressed: (){  //if i tap on this, i will go to screen two
                      Navigator.pushNamed(context,ScreenTwo.id);
                      // Navigator.push(
                      //   context,MaterialPageRoute(builder: (context)=>ScreenTwo())
                      // );
                    },
                    child: Text('Screen 1'),
                ),
              ),
          ],
      ),
    );
  }
}
f