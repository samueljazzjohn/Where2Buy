import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    spreadRadius: 2,
                    color: primaryBlack.withOpacity(0.23))
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/profile/store.jpg'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: primaryBlack,
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: Colors.white)),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 15,
              ),
            ))
      ],
    );
  }
}
