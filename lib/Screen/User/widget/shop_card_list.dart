import 'package:flutter/material.dart';
import 'package:where2buy/Screen/User/shop_detials_screen.dart';
import 'package:where2buy/Widgets/product_card.dart';
import 'package:where2buy/Components/config.dart';

class ShopCardList extends StatelessWidget {
  final Size size;
  final List<Map> shopList;
  const ShopCardList({Key? key, required this.size, required this.shopList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < shopList.length; i++) {
      children.add(shopCard(shopList[i]['storeName'], shopList[i]['storeImage'],
          shopList[i]['distance'], context));
    }

    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start, children: children
            // [
            //   shopCard('Naalumukku Shop', 'assets/images/shops/grocery.jpg', '5Km'),
            //   shopCard('KK Store', 'assets/images/shops/grocery1.jpg', '8Km'),
            //   shopCard('Anandhu Shop', 'assets/images/shops/grocery.jpg', '15Km')
            // ],
            ),
      ),
    );
  }

  Widget shopCard(String storeName, String storeImage, String distance,
      BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ShopDetailsScreen(
                shopType: 'Grocery Shop',
                shopName: storeName,
                shopImage: storeImage,
              );
            }));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20),
        width: size.width * 0.4,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.asset(storeImage)),
            Container(
                width: size.width * 0.4,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: primaryBlack.withOpacity(0.23))
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(storeName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text(distance, style: TextStyle(fontSize: 12))
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
