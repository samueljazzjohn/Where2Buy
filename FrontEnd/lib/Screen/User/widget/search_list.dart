import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Models/search_shop_model.dart';
import 'package:where2buy/Screen/User/shop_detials_screen.dart';
import 'package:where2buy/Widgets/circular_image.dart';

import '../../../Components/config.dart';

class SearchList extends StatefulWidget {
  final Map<String, dynamic> searchData;
  const SearchList({Key? key, required this.searchData}) : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  bool isError = false;

  Future<List<SearchShopModel>> getShopCardDetails(
      BuildContext context, Map<String, dynamic> body) async {
    List<SearchShopModel> _searchShopList = [];
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    print(body);
    final data = jsonEncode(body);
    Response res = await _networkHandler.postReq("/shop/search/details", data);
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _searchShopList.add(SearchShopModel.fromJson(decode['data'][i]));
        print("____$_searchShopList");
        isError = false;
      }
    } else {
      print(res.body);
      setState(() {
        isError = true;
      });
    }
    return _searchShopList;
  }

  @override
  Widget build(BuildContext context) {
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 6, right: 6),
        child: isError
            ? Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  const Text('Something went wrong'),
                ],
              )
            : FutureBuilder<List<SearchShopModel>>(
                future: getShopCardDetails(context, widget.searchData),
                builder: ((context, snapshot) {
                  print(snapshot.data);
                  return snapshot.hasData
                      ? snapshot.data != []
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: ((context, index) {
                                String url =
                                    '\\${snapshot.data![index].store.shopImg}'
                                        .replaceAll(r'\', r'/');
                                print('___url$url');
                                url = _networkHandler.getImage(url);
                                return Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: ((context) {
                                        return ShopDetailsScreen(
                                            place: snapshot
                                                .data![index].store.place,
                                            phone: snapshot
                                                .data![index].store.place,
                                            id: snapshot.data![index].store.id,
                                            shopName: snapshot.data![index]
                                                .store.user.username,
                                            shopImage:
                                                'assets/images/shops/supermarket.jpg',
                                            shopType: 'Super market');
                                      })));
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: ListTile(
                                          // title: Text('hello'),
                                          leading: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              url,
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Text(
                                              '${snapshot.data![index].store.user.username}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }))
                          : Column(
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                const Text('No data found'),
                              ],
                            )
                      : Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              CircularProgressIndicator(
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        );
                }),
              ));
  }
}
