import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2buy/Components/app_bar.dart';
import 'package:where2buy/Components/shop_list.dart';
import 'package:where2buy/Screen/User/widget/search_list.dart';
import 'package:where2buy/Screen/User/widget/shop_card_list.dart';
import 'package:where2buy/Screen/User/shop_list_screen.dart';
import 'package:where2buy/Screen/User/widget/shop_list.dart';
import 'package:where2buy/Screen/User/widget/shops_titlebar.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:where2buy/Widgets/header_with_searchbox.dart';
import 'package:where2buy/Widgets/navigation_drawer_widget.dart';
import 'package:where2buy/Components/config.dart';

class UserHomeScreen extends StatefulWidget {
  final String type;
  const UserHomeScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  bool isSearch = false;
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic> data = {'searchItem': ''};
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
        drawer: NavigationDrawerWidget(
          type: widget.type,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                child: Column(
              children: [
                Container(
                    // margin: EdgeInsets.only(bottom:30),
                    height: size.height * 0.2,
                    child: Stack(
                      children: [
                        Container(
                            height: size.height * 0.2 - 27,
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Where2Buy',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  )
                                ],
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: primaryBlack.withOpacity(0.23))
                                  ]),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: TextFormField(
                                        controller: _searchController,
                                        cursorColor: primaryBlack,
                                        onChanged: (value) =>
                                            print('search field tapped'),
                                        decoration: InputDecoration(
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                                color: Colors.black45),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            data['searchItem'] =
                                                _searchController.text;
                                            isSearch = !isSearch;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          !isSearch ? search : close,
                                          color: Colors.black45,
                                        ),
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ))
              ],
            )),
            !isSearch
                ? ShopList(size: size)
                : SearchList(
                    searchData: data,
                  )
          ],
        )));
  }
}
