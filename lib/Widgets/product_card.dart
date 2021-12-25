import 'package:flutter/material.dart';
import 'package:where2buy/config.dart';

class ProductCard extends StatelessWidget {
  final Size size;
  const ProductCard({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width*0.4,
      child: Column(
        children: [
          Image.asset('assets/images/shops/grocery.jpg'),
          Container(
            width: size.width*0.4,
            padding: EdgeInsets.all(10),
            decoration:BoxDecoration(
              color: Colors.white,
              boxShadow: [ BoxShadow(
                offset:Offset(0, 10),
                blurRadius: 50,
                color: primaryBlack.withOpacity(0.23)
              )]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text('Grocery Shop',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  Text('5 Km',style:TextStyle(fontSize: 12))
                ]
              ),
            )
          )
        ],
      ),
    );
  }
}
