import 'package:flutter/material.dart';
import 'package:where2buy/Screen/type_screen.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(top: 20, left: 15, bottom: 15),
              child: Column(
                children: [
                  Expanded(child: Align(alignment: Alignment.centerLeft,child: Row(
                    children: [
                      Icon(Icons.shopping_cart,color: Colors.white, size: 45,),
                      SizedBox(width: 10),
                      Text('Where2Buy',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
                    ],
                  ))),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Username',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              decoration: BoxDecoration(color: Colors.black87),
            ),
            const ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('About'),
            ),
            ListTile(
              title: Text('Content'),
            ),
            ListTile(
              title: Text('Close'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('logout'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TypeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
