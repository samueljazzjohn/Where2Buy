import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Screen/Store/store_edit_profile_screen.dart';
import 'package:where2buy/Widgets/bottom_sheet.dart';

class CircularImage extends StatelessWidget {
  final bool isEditable;
  const CircularImage({Key? key, this.isEditable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: imageFileNotifier,
          builder: (BuildContext context, File image, Widget? child) {
            return Container(
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
                      // image:image!=null ? AssetImage('assets/images/profile/store.jpg') : FileImage(image),
                      image: FileImage(image, scale: 1),
                      fit: BoxFit.cover)),
            );
          },
        ),
        isEditable
            ? Positioned(
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
            : SizedBox()
      ],
    );
  }
}
