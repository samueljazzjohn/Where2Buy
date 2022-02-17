import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Screen/Store/store_edit_profile_screen.dart';

ValueNotifier<File> imageFileNotifier =
    ValueNotifier(File('assets/images/profile/store.jpg'));

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagePicker _picker = ImagePicker();

    void takePhoto(ImageSource source) async {
      XFile? image = await _picker.pickImage(source: source);
      var _image = File(image!.path);
      imageFileNotifier.value = _image;
    }

    return Container(
      height: 130,
      // width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Choose a profile photo',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () => takePhoto(ImageSource.camera),
                  icon: Icon(Icons.camera, color: primaryBlack),
                  label: Text(
                    'Camara',
                    style: TextStyle(color: primaryBlack),
                  )),
              SizedBox(width: 10),
              TextButton.icon(
                  onPressed: () => takePhoto(ImageSource.gallery),
                  icon: Icon(Icons.photo, color: primaryBlack),
                  label: Text(
                    'Gallary',
                    style: TextStyle(color: primaryBlack),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
