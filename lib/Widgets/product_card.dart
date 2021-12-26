import 'package:flutter/material.dart';
import 'package:where2buy/config.dart';

class ProductCard extends StatelessWidget {
  final Size size;
  final String storeName;
  final String storeImage;
  final String distance;
  const ProductCard({Key? key, required this.size,required this.storeName,required this.storeImage,required this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds:250),
      // transform: 
      margin: EdgeInsets.only(bottom: 20, left: 20),
      width: size.width * 0.4,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.asset(storeImage,width: size.width*0.4,height:130,fit: BoxFit.cover)),
          Container(
              width: size.width * 0.4,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: primaryBlack.withOpacity(0.23))
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(storeName,
                          maxLines:1,
                          overflow:TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(distance, style: TextStyle(fontSize: 12))
                    ]),
              ))
        ],
      ),
    );
  }
}
