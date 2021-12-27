import 'package:flutter/material.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/circular_image.dart';

class StoreProfile extends StatelessWidget {
  const StoreProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children:[ 
          Container(
          height: size.height*0.5,
          child: Center(
            child: CircularImage(),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.store),
                title: Text('Store Name'),
              ),
              ListTile(
                leading: Icon(Icons.mail_outline),
                title: Text('mail'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('5020154235'),
              ),
              Button(isIcon: false, btnText: 'LogOut', nextScreen: TypeScreen())
            ],
          ),
        ),
        ]),
    );
  }
}
