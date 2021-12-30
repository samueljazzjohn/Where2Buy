import 'package:flutter/material.dart';
import 'package:where2buy/Components/app_bar.dart';
import 'package:where2buy/Components/shop_list.dart';
import 'package:where2buy/Screen/User/widget/shop_card_list.dart';
import 'package:where2buy/Screen/User/shop_list_screen.dart';
import 'package:where2buy/Screen/User/widget/shops_titlebar.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:where2buy/Widgets/header_with_searchbox.dart';
import 'package:where2buy/Widgets/navigation_drawer_widget.dart';
import 'package:where2buy/Components/config.dart';

class UserHomeScreen extends StatefulWidget {
  final String type;
  const UserHomeScreen({Key? key,required this.type}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final GlobalKey<ScaffoldState> _userKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        key: _userKey,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: primaryBlack,
            foregroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(camara,
                        color: Colors.white, width: 50, height: 50)),
              )
            ],
            leading: IconButton(
                onPressed: () {
                  _userKey.currentState?.openDrawer();
                  // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NavigationDrawerWidget()));
                },
                icon: SvgPicture.asset(menu, color: Colors.white))),
        drawer: NavigationDrawerWidget(type: widget.type,),
        body: SingleChildScrollView(
            child: Column(
          children: [
            HeaderWithSearchbox(),
            ShopsTitleBar(
                size: size,
                title: 'SuperMarket',
                press: () {
                  print('more pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShopListScreen(
                      shopList: superMarketList,
                      shopName: 'SuperMarket',
                    );
                  }));
                }),
            ShopCardList(size: size, shopList: superMarketList),
            ShopsTitleBar(
              size: size,
              title: 'Gocery Shop',
              press: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShopListScreen(
                  shopList: groceryShopList,
                  shopName: 'Grocery Shop',
                );
              })),
            ),
            ShopCardList(size: size, shopList: groceryShopList),
            ShopsTitleBar(
              size: size,
              title: 'Electronic shop',
              press: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShopListScreen(
                  shopList: electronicShopList,
                  shopName: 'Electronic Shop',
                );
              })),
            ),
            ShopCardList(size: size, shopList: electronicShopList),
            ShopsTitleBar(
              size: size,
              title: 'Book store',
              press: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShopListScreen(
                  shopList: bookShopList,
                  shopName: 'Book Store',
                );
              })),
            ),
            ShopCardList(size: size, shopList: bookShopList)
          ],
        )));
  }
}
