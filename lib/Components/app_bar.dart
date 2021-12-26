import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:where2buy/Widgets/navigation_drawer_widget.dart';

import '../config.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      elevation: 0,
      backgroundColor: primaryBlack,
      foregroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(camara,
                  color: Colors.white, width: 50, height: 50)),
        )
      ],
      leading: IconButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NavigationDrawerWidget()));
          },
          icon: SvgPicture.asset(menu, color: Colors.white)));
}
