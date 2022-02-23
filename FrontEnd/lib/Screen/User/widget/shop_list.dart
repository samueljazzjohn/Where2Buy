import 'package:flutter/material.dart';
import 'package:where2buy/Components/shop_list.dart';
import 'package:where2buy/Screen/User/shop_list_screen.dart';
import 'package:where2buy/Screen/User/widget/shop_card_list.dart';
import 'package:where2buy/Screen/User/widget/shops_titlebar.dart';

class ShopList extends StatelessWidget {
  final Size size;
  const ShopList({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
            title: 'Others',
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
      ),
    );
  }
}
