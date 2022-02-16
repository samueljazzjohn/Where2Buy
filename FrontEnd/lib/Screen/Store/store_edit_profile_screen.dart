// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Widgets/add_button.dart';
import 'package:where2buy/Widgets/bottom_sheet.dart';
import 'package:where2buy/Widgets/circular_image.dart';
import 'package:where2buy/Widgets/text_field.dart';

class StoreEditProfileScreen extends StatefulWidget {
  const StoreEditProfileScreen({Key? key}) : super(key: key);

  @override
  State<StoreEditProfileScreen> createState() => _StoreEditProfileScreenState();
}

class _StoreEditProfileScreenState extends State<StoreEditProfileScreen> {
  GlobalKey<FormState>? storeProfileKey;

  @override
  void initState() {
    storeProfileKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    TextEditingController _storeName = TextEditingController();
    // TextEditingController _password = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _place = TextEditingController();
    String dropdownValue = 'Select Store type';

    final items = [
      'Super Market',
      'Grocery Shop',
      'Cosmetic Shop',
      'Book Store',
      'Electronic Shop',
      'others'
    ];

    // final ImagePicker _picker = ImagePicker();

    return Scaffold(
        appBar: AppBar(backgroundColor: primaryBlack, elevation: 0),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              children: [
                Text(
                  'Add Profile Details',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                Center(
                  child: GestureDetector(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => BuildBottomSheet()),
                      child: CircularImage(isEditable: true)),
                ),
                SizedBox(height: 35),
                // InputField(controller: _storeName, hintText: 'Enter StoreName'),
                // SizedBox(
                //   height: 20,
                // ),
                // InputField(controller: _email, hintText: 'Enter email'),
                // SizedBox(
                //   height: 20,
                // ),

                Form(
                    key: storeProfileKey,
                    child: Container(
                      child: Column(
                        children: [
                          InputField(
                              controller: _phone,
                              hintText: 'Enter Phone Number'),
                          SizedBox(
                            height: 10,
                          ),
                          InputField(
                              controller: _place, hintText: 'Enter place'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                              border: Border.all(width: 1, color: primaryBlack),
                              // boxShadow: [
                              //   BoxShadow(
                              //     offset: Offset(0, 10),
                              //     blurRadius:50,
                              //     color: primaryBlack.withOpacity(0.23)
                              //   )
                              // ]
                            ),
                            height: 50,
                            width: size.width * 0.8,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                    isExpanded: true,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    elevation: 0,
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(dropdownValue),
                                    ),
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    items: items
                                        .map((e) => DropdownMenuItem(
                                            value: e, child: Text(e)))
                                        .toList(),
                                    onChanged: (e) => setState(() {
                                          dropdownValue = e.toString();
                                        })),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          AddButton(
                              btnText: 'Set Location',
                              btnIcon: setLocation,
                              press: () => print('btn pressed')),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      maximumSize: Size(150, 50),
                                      minimumSize: Size(150, 50),
                                      primary: Colors.white,
                                      onPrimary: primaryBlack,
                                      side: BorderSide(
                                          width: 1, color: primaryBlack),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    onPressed: () => print(''),
                                    child: Text('Cancel')),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      maximumSize: Size(150, 50),
                                      minimumSize: Size(150, 50),
                                      primary: primaryBlack,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    onPressed: () {
                                      if (storeProfileKey!.currentState!
                                          .validate()) {
                                        var mail = getMail();
                                        _networkHandler.postReq(
                                            "/profileupdate", {
                                          'mail': mail
                                        }).then((res) => {
                                              if (res == 200 || res == 201)
                                                {
                                                  // _networkHandler.patchImage(
                                                  //     "/upload/image", _image.path)
                                                }
                                            });
                                      }
                                    },
                                    child: Text('Save')),
                              ],
                            ),
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  Future<String?> getMail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? mail = await pref.getString('mail');
    return mail;
  }
}
