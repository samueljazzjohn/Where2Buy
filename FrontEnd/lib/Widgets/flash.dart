import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildFlash(BuildContext context, String msg) async {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (context, controller) {
        return Flash.dialog(
            controller: controller,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            backgroundColor: Colors.black54,
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(msg,
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ));
      },
    );
  }