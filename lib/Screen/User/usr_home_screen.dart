import 'package:flutter/material.dart';
import 'package:where2buy/Screen/User/shop_card_list.dart';
import 'package:where2buy/Screen/User/shops_titlebar.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:where2buy/Widgets/header_with_searchbox.dart';
import 'package:where2buy/config.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: primaryBlack,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0),
            child: IconButton(onPressed: (){}, icon: SvgPicture.asset(camara,color:Colors.white,width:50,height:50)),
          )
        ],
        leading: IconButton(
          onPressed: (){},
           icon: SvgPicture.asset(menu,color:Colors.white)
           )
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         padding: EdgeInsets.only(top: 20, left: 15, bottom: 15),
      //         child: Column(
      //           children: [
      //             Expanded(child: Align(alignment: Alignment.centerLeft,child: Row(
      //               children: [
      //                 Icon(Icons.shopping_cart,color: Colors.white, size: 45,),
      //                 SizedBox(width: 10),
      //                 Text('Where2Buy',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
      //               ],
      //             ))),
      //             Align(
      //                 alignment: Alignment.bottomLeft,
      //                 child: Text(
      //                   'Username',
      //                   style: TextStyle(color: Colors.white),
      //                 )),
      //           ],
      //         ),
      //         decoration: BoxDecoration(color: primaryBlack),
      //       ),
      //       const ListTile(
      //         title: Text('Home'),
      //       ),
      //       ListTile(
      //         title: Text('About'),
      //       ),
      //       ListTile(
      //         title: Text('Content'),
      //       ),
      //       ListTile(
      //         title: Text('Close'),
      //         onTap: () {
      //           Navigator.of(context).pop();
      //         },
      //       ),
      //       ListTile(
      //         title: Text('logout'),
      //         onTap: () {
      //           Navigator.of(context).pushReplacement(
      //               MaterialPageRoute(builder: (context) => TypeScreen()));
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWithSearchbox(),
            ShopsTitleBar(size: size, title: 'Gocery Shop'),
            ShopCardList(size: size),
            ShopsTitleBar(size: size, title: 'Electronic shop'),
            ShopCardList(size: size)
          ],
        )
        )
    );
  }
}
