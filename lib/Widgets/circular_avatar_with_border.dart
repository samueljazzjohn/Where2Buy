import 'package:flutter/material.dart';
import 'package:where2buy/config.dart';

class CircularAvatarWithBorder extends StatelessWidget {
  final String assetName;
  const CircularAvatarWithBorder({Key? key,required this.assetName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black45,
      radius: 18,
      child: CircleAvatar(
        radius: 17,
        child: Image.asset(
          assetName,
          width: 17,
          height: 17,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
