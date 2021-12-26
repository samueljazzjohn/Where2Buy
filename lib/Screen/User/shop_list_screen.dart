import 'package:flutter/material.dart';

class ShopListScreen extends StatelessWidget {
  final List<Map> shopList;
  final String shopName;
  const ShopListScreen({Key? key, required this.shopList,required this.shopName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
