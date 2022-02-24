import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Screen/login_screen.dart';
import 'package:where2buy/Widgets/add_button.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/flash.dart';
import 'package:where2buy/Widgets/text_field.dart';

import '../../Widgets/bottom_sheet.dart';

class AddProductScreen extends StatefulWidget {
  final String type;
  const AddProductScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  static final productFormKey = GlobalKey<FormState>();
  TextEditingController _pname = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  TextEditingController _status = TextEditingController();
  bool isLoading = false;
  ImagePicker _picker = ImagePicker();
  File productImage = File(dummy);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBlack,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // width: size.width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text('Add Product',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 20),
                Center(
                    child: Image.file(
                  productImage,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                )),
                SizedBox(height: 20),
                AddButton(
                    btnText: 'Add Image',
                    btnIcon: addImage,
                    press: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => customeBottomSheet())),
                SizedBox(height: 15),
                Form(
                    key: productFormKey,
                    child: Container(
                        child: Column(children: [
                      InputField(controller: _pname, hintText: 'Product Name'),
                      SizedBox(height: 15),
                      InputField(controller: _price, hintText: 'Price'),
                      SizedBox(height: 15),
                      InputField(controller: _quantity, hintText: 'Quantity'),
                      SizedBox(height: 15),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              maximumSize: const Size(400, 50),
                              minimumSize: const Size(300, 50),
                              primary: Colors.black54,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              side:
                                  BorderSide(width: 1, color: Colors.black54)),
                          onPressed: () {
                            if (productFormKey.currentState!.validate()) {
                              Map<String, dynamic> data = {
                                'pname': _pname.text,
                                'qty': _quantity.text,
                                'price': _price.text,
                              };
                              final body = jsonEncode(data);
                              print(data);
                              _networkHandler
                                  .postReq('/shop/product/add', body)
                                  .then((res) => {
                                        if (res.statusCode == 200 ||
                                            res.statusCode == 201)
                                          {
                                            buildFlash(context,
                                                "Product added successfully"),
                                            // _networkHandler.patchImage(
                                            //     "/product/image/update",
                                            //     productImage.path,
                                            //     'product'),
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return StoreHomeScreen(
                                                  type: 'store');
                                            })))
                                          },
                                        if (res.body == 'Forbidden')
                                          {
                                            buildFlash(
                                                context, "jwt malformed"),
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen(
                                                                type: 'store')),
                                                    (route) => false)
                                          }
                                      })
                                  .catchError((err) => {
                                        {buildFlash(context, err.toString())},
                                      });
                            }
                          },
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text('Add')),
                    ])))
              ],
            ),
          )),
    );
  }

  void press() {}

  customeBottomSheet() {
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

  takePhoto(ImageSource source) async {
    XFile? image = await _picker.pickImage(source: source);
    var _image = File(image!.path);
    setState(() {
      productImage = _image;
    });
  }
}
