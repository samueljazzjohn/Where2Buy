import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Screen/Store/store_edit_profile_screen.dart';
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
        backgroundColor:primaryBlack
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        decoration:BoxDecoration(
          color:primaryBlack,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[ 
            Container(
            height: size.height*0.35,
            child: Center(
              child: Column(
                children: [
                  CircularImage(),
                  SizedBox(height:10),
                  Text('StoreName',style: TextStyle(color:Colors.grey[400]),)
                ],
              ),
            ),
          ),
          // Container(
          //   height: size.height*0.25,
          //   child: Column(
          //     children: [
          //       // buildListTile(iconName: Icons.store,name: 'StoreName',isLeading: true,ctx: context),
          //       buildListTile(name: 'mail', iconName: Icons.mail_outline,isLeading: true,ctx: context),
          //       buildListTile(name: '9851234562', iconName: Icons.phone,isLeading: true,ctx: context),
          //       SizedBox(height:15,),
          //       // Divider(color: Colors.black26,)
          //     ],
          //   ),
          // ),
          // Spacer(),
          Column(
            children:[
              buildListTile(name: 'mail', iconName: Icons.mail_outline,isLeading: true,ctx: context),
              buildListTile(name: '9851234562', iconName: Icons.phone,isLeading: true,ctx: context),
              buildListTile(ctx: context, name: 'Edit Profile', iconName: Icons.edit, isLeading: false,nextScreen: StoreEditProfileScreen()),
              buildListTile(ctx: context, name: 'Logout', iconName: Icons.logout, isLeading: false,nextScreen: TypeScreen())
            ]
          )
          ]),
      ),
    );
  }

  ListTile buildListTile({required BuildContext ctx, required String name,required IconData iconName,required bool isLeading, Widget? nextScreen}) {
    return ListTile(
                trailing:Icon(iconName,color:Colors.grey[400]),
                title: Text(name,style: TextStyle(color:Colors.grey[400]),),
                // trailing : !isLeading ? Icon(iconName,color:Colors.grey[400]):SizedBox(),
                onTap:() => !isLeading ? Navigator.push(ctx, 
                  MaterialPageRoute(builder: (ctx)=>
                    nextScreen!
                  )
                ): print('no action'), 
              );
  }
}
