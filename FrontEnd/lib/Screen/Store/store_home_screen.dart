import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Components/product_list.dart';
import 'package:where2buy/Models/product_model.dart';
import 'package:where2buy/Screen/Store/product_add_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/flash.dart';
import 'package:where2buy/Widgets/header_with_searchbox.dart';
import 'package:where2buy/Widgets/navigation_drawer_widget.dart';
import 'package:where2buy/Widgets/product_card.dart';
import 'package:where2buy/Components/config.dart';

class StoreHomeScreen extends StatefulWidget {
  final String type;
  const StoreHomeScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<StoreHomeScreen> createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen> {
  final GlobalKey<ScaffoldState> _storeKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  late NetworkHandler _networkHandler;
  List<ProductModel>? Products;

  // List<Widget> getChildren({required Size size}) {
  //   final children = <Widget>[];
  //   for (var i = 0; i < productList.length; i++) {
  //     children.add(ProductCard(
  //         type: widget.type,
  //         size: size,
  //         storeName: productList[i]['productName'],
  //         storeImage: productList[i]['productImage'],
  //         distance: productList[i]['price']));
  //   }
  //   return children;
  // }

  Future<List<ProductModel>> fetchData(BuildContext context) async {
    _networkHandler = NetworkHandler(ctx: context);
    List<ProductModel> _products = [];
    Response res = await _networkHandler.getReq("/shop/product/get");
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      print(decode['data'].length);
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _products.add(ProductModel.fromJson(decode['data'][i]));
      }
    }
    // setState(() {
    //   Products!.addAll(_products);
    // });
    return _products;
  }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   Products=fetchData() as List<ProductModel>;
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _storeKey,
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
                _storeKey.currentState?.openDrawer();
                // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NavigationDrawerWidget()));
              },
              icon: SvgPicture.asset(menu, color: Colors.white))),
      drawer: NavigationDrawerWidget(
        type: widget.type,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWithSearchbox(),
            SizedBox(height: 30),
            Button(
                isIcon: true,
                btnText: 'Add a product',
                nextScreen: AddProductScreen(type: widget.type),
                assetName: Icons.add_box_outlined),
            SizedBox(height: 30),
            Container(
                height: size.height * 0.7,
                child: FutureBuilder<List<ProductModel>>(
                    future: fetchData(context),
                    builder: (context, snapshot) {
                      return snapshot.data != null || snapshot.hasData
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 2 / 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 20),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                print(
                                    '_______\\${snapshot.data![index].Image}');
                                return ProductCard(
                                    size: size,
                                    storeName: snapshot.data![index].pname,
                                    storeImage:
                                        '\\${snapshot.data![index].Image}',
                                    distance:
                                        snapshot.data![index].price.toString(),
                                    type: widget.type);
                              })
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.black45,
                              ),
                            );
                    }))
          ],
        ),
      ),
    );
  }
}
