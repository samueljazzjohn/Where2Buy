import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Widgets/add_button.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/text_field.dart';

class AddProductScreen extends StatelessWidget {
  final String type;
  const AddProductScreen({Key? key,required this.type }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _pname = TextEditingController();
    TextEditingController _price = TextEditingController();
    TextEditingController _quantity = TextEditingController();
    TextEditingController _status = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBlack,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal:20),
          // width: size.width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                SizedBox(height:20),
                Text('Add Product',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 20),
                Center(
                    child: Image.asset(
                  dummy,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                )),
                SizedBox(height: 20),
                AddButton(btnText: 'Add Image', btnIcon: addImage, press: ()=>print('added')),
                SizedBox(height: 20),
                InputField(controller: _pname, hintText: 'Product Name'),
                SizedBox(height: 20),
                InputField(controller: _price, hintText: 'Price'),
                SizedBox(height: 20),
                InputField(controller: _quantity, hintText: 'Quantity'),
                SizedBox(height: 20),
                Button(
                  isIcon: false,
                  btnText: 'Add',
                  nextScreen: StoreHomeScreen(type: type),
                )
              ],
            ),
          )),
    );
  }

  void press() {}
}
