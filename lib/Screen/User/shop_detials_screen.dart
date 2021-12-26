import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:where2buy/Components/app_bar.dart';
import 'package:where2buy/Widgets/circular_avatar_with_border.dart';
import 'package:where2buy/Widgets/product_card.dart';

import '../../config.dart';

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
                  child: Column(
                    children:[
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ProductCard(size: size, storeName: 'Bag', storeImage: 'assets/images/products/bag.jpg', distance: '\$1200'),
                            ProductCard(size: size, storeName: 'camara', storeImage: 'assets/images/products/camara.jpeg', distance:'\$8500'),
                          ],
                        )
                      ),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ProductCard(size: size, storeName: 'Cycle', storeImage: 'assets/images/products/cycle.jpg', distance: '\$1200'),
                            ProductCard(size: size, storeName: 'Headphone', storeImage: 'assets/images/products/headphone.jpg', distance:'\$8500'),
                          ],
                        )
                      ),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ProductCard(size: size, storeName: 'Stool', storeImage: 'assets/images/products/stool.jpg', distance: '\$1200'),
                            ProductCard(size: size, storeName: 'Shoe', storeImage: 'assets/images/products/Shoe.jpg', distance:'\$8500'),
                          ],
                        )
                      )

                    ]
                  )
                )
              ]))),
    );
  }
}
