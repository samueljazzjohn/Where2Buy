import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:where2buy/Components/app_bar.dart';
import 'package:where2buy/Components/getType.dart';
import 'package:where2buy/Components/product_list.dart';
import 'package:where2buy/Widgets/circular_avatar_with_border.dart';
import 'package:where2buy/Widgets/product_card.dart';

import '../../Components/config.dart';

class ShopDetailsScreen extends StatelessWidget {
  final String shopType;
  final String shopName;
  final String shopImage;
  const ShopDetailsScreen(
      {Key? key,
      required this.shopName,
      required this.shopImage,
      required this.shopType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(),
      body: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  height: size.height * 0.45,
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(45)),
                          child: Image.asset(shopImage,
                              fit: BoxFit.cover, height: size.height * 0.45)),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: primaryBlack,
                          child: IconButton(
                              onPressed: () => print('icon pressed'),
                              icon:
                                  SvgPicture.asset(phone, color: Colors.white)),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 10,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: primaryBlack,
                          child: IconButton(
                              onPressed: () => print('icon pressed'),
                              icon: SvgPicture.asset(map, color: Colors.white)),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                    // color: Colors.green,
                    // height: size.height * 0.05,
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: primaryBlack.withOpacity(0.23))
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shopName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          shopType,
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    )),
                Container(
                  height: size.height * 0.50,
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                      children: getChildren(size: size,type:'store')),
                )
              ]))),
    );
  }

  List<Widget> getChildren({required Size size, required String type}) {
    final children = <Widget>[];
    for (var i = 0; i < productList.length; i++) {
      children.add(ProductCard(
          type: type,
          size: size,
          storeName: productList[i]['productName'],
          storeImage: productList[i]['productImage'],
          distance: productList[i]['price']));
    }
    return children;
  }
}
