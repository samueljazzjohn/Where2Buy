import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Components/shop_list.dart';
import 'package:where2buy/Models/shop_card_model.dart';
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
          FutureBuilder<List<ShopCardModel>>(
              future: buildSupermarket(context),
              builder: ((context, snapshot) {
                return snapshot.data != null
                    ? ShopCardList(size: size, shopList: snapshot.data!)
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.black45,
                        ),
                      );
              })),
          // ShopCardList(size: size, shopList: superMarketList),
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
          FutureBuilder<List<ShopCardModel>>(
              future: buildGrocery(context),
              builder: ((context, snapshot) {
                return snapshot.data != null
                    ? ShopCardList(size: size, shopList: snapshot.data!)
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.black45,
                        ),
                      );
              })),
          // ShopCardList(size: size, shopList: groceryShopList),
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
          FutureBuilder<List<ShopCardModel>>(
              future: buildElectric(context),
              builder: ((context, snapshot) {
                return snapshot.data != null
                    ? ShopCardList(size: size, shopList: snapshot.data!)
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.black45,
                        ),
                      );
              })),
          // ShopCardList(size: size, shopList: electronicShopList),
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
          FutureBuilder<List<ShopCardModel>>(
              future: buildOthers(context),
              builder: ((context, snapshot) {
                return snapshot.data != null
                    ? ShopCardList(size: size, shopList: snapshot.data!)
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.black45,
                        ),
                      );
              })),
          // ShopCardList(size: size, shopList: bookShopList)
        ],
      ),
    );
  }

  Future<List<ShopCardModel>> buildSupermarket(BuildContext context) async {
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    List<ShopCardModel> _supermarketList = [];
    Response res = await _networkHandler.getReq("/shop/supermarket/details");
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      print('____${decode['data'].length}');
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _supermarketList.add(ShopCardModel.fromJson(decode['data'][i]));
      }
    }
    return _supermarketList;
  }

  Future<List<ShopCardModel>> buildGrocery(BuildContext context) async {
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    List<ShopCardModel> _groceryList = [];
    Response res = await _networkHandler.getReq("/shop/grocery/details");
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      print('____${decode['data'].length}');
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _groceryList.add(ShopCardModel.fromJson(decode['data'][i]));
      }
    }
    return _groceryList;
  }

  Future<List<ShopCardModel>> buildElectric(BuildContext context) async {
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    List<ShopCardModel> _electricList = [];
    Response res = await _networkHandler.getReq("/shop/electric/details");
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      print('____${decode['data'].length}');
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _electricList.add(ShopCardModel.fromJson(decode['data'][i]));
      }
    }
    return _electricList;
  }

  Future<List<ShopCardModel>> buildOthers(BuildContext context) async {
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    List<ShopCardModel> _othersList = [];
    Response res = await _networkHandler.getReq("/shop/others/details");
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      print('____${decode['data'].length}');
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _othersList.add(ShopCardModel.fromJson(decode['data'][i]));
      }
    }
    return _othersList;
  }
}
