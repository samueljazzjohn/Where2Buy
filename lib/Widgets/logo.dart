import 'package:flutter/material.dart';

import '../assets.dart';

class Logo extends StatelessWidget {
  final String logoName;
  const Logo({Key? key, required this.logoName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => print(''),
        child: Image.asset(logoName, width: 30, height: 30));
  }
}
