import 'package:flutter/material.dart';
import 'package:where2buy/Widgets/product_card.dart';

class ShopCardList extends StatelessWidget {
  final Size size;
  const ShopCardList({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,top: 10,),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ProductCard(size:size)],
        ),
      ),
    );
  }
}
