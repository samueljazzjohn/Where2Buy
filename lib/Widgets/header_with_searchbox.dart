import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:where2buy/config.dart';

class HeaderWithSearchbox extends StatelessWidget {
  const HeaderWithSearchbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
            // margin: EdgeInsets.only(bottom:30),
            height: size.height * 0.2,
            child: Stack(
              children: [
                Container(
                    height: size.height * 0.2 - 27,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where2Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: primaryBlack.withOpacity(0.23))
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TextFormField(
                                cursorColor: primaryBlack,
                                onChanged: (value) =>
                                    print('search field tapped'),
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: TextStyle(color: Colors.black45),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: SvgPicture.asset(
                              search,
                              color: Colors.black45,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ))
      ],
    );
  }
}
