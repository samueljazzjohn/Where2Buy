import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:where2buy/Components/app_bar.dart';
import 'package:where2buy/Components/getType.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Components/product_list.dart';
import 'package:where2buy/Models/product_model.dart';
import 'package:where2buy/Widgets/circular_avatar_with_border.dart';
import 'package:where2buy/Widgets/product_card.dart';

import '../../Components/config.dart';

class ShopDetailsScreen extends StatelessWidget {
  final String place;
  final String phone;
  final String id;
  final String shopType;
  final String shopName;
  final String shopImage;
  const ShopDetailsScreen(
      {Key? key,
      required this.id,
      required this.place,
      required this.phone,
      required this.shopName,
      required this.shopImage,
      required this.shopType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
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
                          child: Image.network(
                              NetworkHandler(ctx: context).getImage(shopImage),
                              fit: BoxFit.cover,
                              width: size.width,
                              height: size.height * 0.45)),
                      //Image.asset(shopImage,
                      //    fit: BoxFit.cover, height: size.height * 0.45)),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: primaryBlack,
                          child: IconButton(
                              onPressed: () => print('icon pressed'),
                              icon: SvgPicture.asset(phoneIcon,
                                  color: Colors.white)),
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
                    child: Row(
                      children: [
                        Container(
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
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black45),
                              )
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          place,
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        )
                      ],
                    )),
                Container(
                    height: size.height * 0.50,
                    child: FutureBuilder<List<ProductModel>>(
                        future: fetchData(context, id, _networkHandler),
                        builder: (context, snapshot) {
                          return snapshot.data != null ||
                                  snapshot.hasData ||
                                  snapshot.data == []
                              ? GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 30,
                                  children: getChildren(
                                      size: size,
                                      type: 'user',
                                      products: snapshot.data!))
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black45,
                                  ),
                                );
                        })

                    // GridView.count(
                    //     crossAxisCount: 2,
                    //     crossAxisSpacing: 10,
                    //     mainAxisSpacing: 30,
                    //     children: getChildren(size: size, type: 'store')),
                    )
              ]))),
    );
  }

  List<Widget> getChildren(
      {required Size size,
      required String type,
      required List<ProductModel> products}) {
    final children = <Widget>[];
    for (var i = 0; i < products.length; i++) {
      children.add(ProductCard(
          type: type,
          size: size,
          storeName: products[i].pname,
          storeImage: '\\${products[i].Image}'.replaceAll(r'\', r'/'),
          distance: products[i].price.toString()));
    }
    return children;
  }

  Future<List<ProductModel>> fetchData(
      BuildContext context, String id, NetworkHandler _net) async {
    List<ProductModel> _products = [];
    Map<String, dynamic> body = {'id': id};
    // var data = jsonEncode(body);
    Response res =
        await _net.postReq("/customer/product/get", jsonEncode(body));
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      print('____${decode['data'].length}');
      if (decode['data'].length == 0) {
        return _products;
      }
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _products.add(ProductModel.fromJson(decode['data'][i]));
      }
    }
    return _products;
  }
}
