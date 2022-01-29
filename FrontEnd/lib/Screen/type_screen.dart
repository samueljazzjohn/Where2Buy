import 'dart:ui';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2buy/Screen/login_screen.dart';
import 'package:where2buy/Screen/welcome_screen.dart';
import 'package:where2buy/Widgets/flash.dart';
import 'package:where2buy/Widgets/type_card.dart';
import 'package:where2buy/Components/config.dart';

ValueNotifier<bool> selectedNotifier = ValueNotifier(false);

class TypeScreen extends StatefulWidget {
  const TypeScreen({Key? key}) : super(key: key);

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // String type = "null";
    return Scaffold(
        body: SafeArea(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 12,
            child: Center(
                child: Container(
                    width: 300,
                    // height: 400,
                    // alignment: Alignment.bottomCenter,
                    // decoration: BoxDecoration(
                    //     border:
                    //         Border.all(width: 1, color: const Color(0Xff7E7E7E)),
                    //     borderRadius: BorderRadius.circular(12)),
                    child: Column(children: [
                      // const Expanded(
                      //     flex: 1,
                      //     child: Padding(
                      //       padding: EdgeInsets.only(top: 75),
                      //       child: Text('Select Type',
                      //           style: TextStyle(
                      //               // color:Colors.redAccent,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 20)),
                      //     )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Image.asset(
                              cart1,
                              alignment: Alignment.bottomCenter,
                              width: 100,
                              height: 100,
                              // color: Colors.redAccent,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: size.width * 0.30,
                                      height: 130,
                                      child: TypeCard(
                                          cardImage: shop,
                                          type: 'store',
                                          cardName: 'Store'))),
                              Expanded(

                                  // )
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: size.width * 0.30,
                                      height: 130,
                                      child: TypeCard(
                                          cardImage: customer,
                                          type: 'user',
                                          cardName: 'User'))),
                            ],
                          ))
                    ]))),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 15),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          if (typeNotifier.value == 'nodata') {
                            print("type");

                            buildFlash(context, "Please select one type ! ");

                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //   content: Text("Please select one type!!!"),
                            // ));

                            // Fluttertoast.showToast(
                            //     msg: "Please Select one type!!!",
                            //     toastLength: Toast.LENGTH_LONG,
                            //     gravity: ToastGravity.BOTTOM,
                            //     timeInSecForIosWeb: 2,
                            //     backgroundColor: Colors.black,
                            //     textColor: Colors.white,
                            //     // fontSize: 16.0
                            //     );
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              print(typeNotifier.value);
                              return WelcomeScreen(
                                type: typeNotifier.value,
                              );
                            }));
                          }
                        },
                        icon: SvgPicture.asset(
                          arrowRight,
                          color: primaryBlack,
                          width: 180,
                          height: 180,
                        ))),
              ))
        ],
      ),
    ));
  }
}
