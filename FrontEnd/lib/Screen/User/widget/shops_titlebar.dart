import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';

class ShopsTitleBar extends StatelessWidget {
  final Size size;
  final String title;
  final Function() press;
  const ShopsTitleBar(
      {Key? key, required this.size, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
      child: Row(children: [
        RichText(
            text: TextSpan(
                text: title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: primaryBlack))),
        Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: primaryBlack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () => press ,
            child: Text('More',
                style: TextStyle(color: Colors.white, fontSize: 12)))
      ]),
    );
  }
}
