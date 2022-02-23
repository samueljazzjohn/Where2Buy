import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Models/search_shop_model.dart';
import 'package:where2buy/Widgets/circular_image.dart';

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
    Response res =
        await _networkHandler.postReq("/shop/search/details", body.toString());
    if (res.statusCode == 200 || res.statusCode == 201) {
      var decode = json.decode(res.body);
      for (int i = 0; i < (decode['data'].length); i++) {
        print("____${decode['data'][i]}");
        _searchShopList.add(SearchShopModel.fromJson(decode['data'][i]));
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
    return Container(
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
                  return snapshot.hasData && snapshot.data != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          // itemCount: snapshot.data!,
                          itemBuilder: ((context, index) {
                            return ListTile(
                              title: Text('hello'),
                              // leading: Image.network(),
                              // title: snapshot.data[index]!.store.user.username,
                            );
                          }))
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
