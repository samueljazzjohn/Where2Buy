import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:where2buy/Screen/login_screen.dart';
import 'package:where2buy/Widgets/type_card.dart';

ValueNotifier<bool> selectedNotifier = ValueNotifier(false);

class TypeScreen extends StatelessWidget {
  const TypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    height: 260,
                    // alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: const Color(0Xff7E7E7E)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(children: [
                      const Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 55),
                            child: Text('Select Type',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                          )),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Expanded(
                                child: TypeCard(
                                  cardWidth: 80,
                                  cardHeight: 120,
                                  cardIcon: Icons.store,
                                  cardName: 'Store',
                                  type: 'store',
                                ),
                              ),
                              Expanded(
                                  child: TypeCard(
                                cardWidth: 80,
                                cardHeight: 120,
                                cardIcon: Icons.person,
                                cardName: 'User',
                                type: 'user',
                              )),
                            ],
                          )))
                    ]))),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          if (typeNotifier.value == 'nodata') {
                            Fluttertoast.showToast(
                                msg: "Please Select one type!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              print(typeNotifier);
                              return LoginScreen();
                            }));
                          }
                        },
                        icon: Icon(Icons.arrow_right))),
              ))
              ],
            ),
        ));
  }
}
