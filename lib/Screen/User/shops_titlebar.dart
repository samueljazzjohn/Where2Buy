import 'package:flutter/material.dart';
import 'package:where2buy/config.dart';

class ShopsTitleBar extends StatelessWidget {
  final Size size;
  final String title;
  const ShopsTitleBar({Key? key, required this.size, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20,vertical: 30),
      child: Row(children: [
        RichText(
            text: TextSpan(
          text: title,
          style: TextStyle(fontWeight:FontWeight.bold,color: primaryBlack)
        )),
        Spacer(),
        ElevatedButton(
          style:ElevatedButton.styleFrom(
            primary: primaryBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
            onPressed: () {
              print('more button pressed');
            },
            child: Text('More',style:TextStyle(color: Colors.white,fontSize: 12)))
      ]),
    );
  }
}
