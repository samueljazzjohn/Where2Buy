import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Models/store_profile_model.dart';
import 'package:where2buy/Screen/Store/store_edit_profile_screen.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/circular_image.dart';

class StoreProfile extends StatefulWidget {
  const StoreProfile({Key? key}) : super(key: key);

  @override
  State<StoreProfile> createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  late String storename, email;
  StoreProfileModel? _storeProfileModel;
  NetworkHandler _networkHandler = NetworkHandler();

  Future<void> updateValues() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? uname = await pref.getString('username');
    String? email = await pref.getString('mail');
    print(uname);
    print(email);
    setState(() {
      storename = uname ?? ' ';
      email = email ?? ' ';
    });
  }

  Future<String> getMail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String mail = pref.getString('mail') ?? '';
    return mail;
  }

  void setModel(Response res) {
    var decode = json.decode(res.body);
    setState(() {
      _storeProfileModel = StoreProfileModel.fromJson(decode);
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5));
    updateValues().then((value) => null);
    late String mail;
    getMail().then((res) => {mail = res});
    _networkHandler
        .getReq('/profiledata', {'mail': mail}).then((res) => {setModel(res)});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: primaryBlack),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: primaryBlack,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: size.height * 0.30,
            child: Center(
              child: Column(
                children: [
                  CircularImage(),
                  SizedBox(height: 6),
                  Text(
                    storename,
                    style: TextStyle(color: Colors.grey[400]),
                  )
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
          Column(children: [
            buildListTile(
                name: email,
                iconName: Icons.mail_outline,
                isLeading: true,
                ctx: context),
            buildListTile(
                name: _storeProfileModel!.phone,
                iconName: Icons.phone,
                isLeading: true,
                ctx: context),
            buildListTile(
                name: _storeProfileModel!.place,
                iconName: Icons.location_on,
                isLeading: true,
                ctx: context),
            buildListTile(
                ctx: context,
                name: 'Edit Profile',
                iconName: Icons.edit,
                isLeading: false,
                nextScreen: StoreEditProfileScreen()),
            buildListTile(
                ctx: context,
                name: 'Logout',
                iconName: Icons.logout,
                isLeading: false,
                nextScreen: TypeScreen())
          ])
        ]),
      ),
    );
  }

  ListTile buildListTile(
      {required BuildContext ctx,
      required String name,
      required IconData iconName,
      required bool isLeading,
      Widget? nextScreen}) {
    return ListTile(
      trailing: Icon(iconName, color: Colors.grey[400]),
      title: Text(
        name,
        style: TextStyle(color: Colors.grey[400]),
      ),
      // trailing : !isLeading ? Icon(iconName,color:Colors.grey[400]):SizedBox(),
      onTap: () => !isLeading
          ? Navigator.push(
              ctx, MaterialPageRoute(builder: (ctx) => nextScreen!))
          : print('no action'),
    );
  }
}
