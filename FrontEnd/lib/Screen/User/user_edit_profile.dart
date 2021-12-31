import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Widgets/bottom_sheet.dart';
import 'package:where2buy/Widgets/circular_image.dart';
import 'package:where2buy/Widgets/text_field.dart';

class UserEditProfile extends StatelessWidget {
  const UserEditProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _email = TextEditingController();

    return Scaffold(
        appBar: AppBar(backgroundColor: primaryBlack, elevation: 0),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              children: [
                Text(
                  'Edit Profile',
                  textAlign:TextAlign.left,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25),
                Center(
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet(context: context, builder: (context)=>BuildBottomSheet()),
                    child: CircularImage(isEditable: true,)
                  ),
                ),
                SizedBox(height: 35),
                InputField(controller: _username, hintText: 'Enter Username'),
                SizedBox(
                  height: 20,
                ),
                InputField(controller: _password, hintText: 'Enter Password'),
                SizedBox(
                  height: 20,
                ),
                InputField(controller: _email, hintText: 'Enter email'),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin:EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(150, 50),
                          minimumSize: Size(150, 50),
                          primary:Colors.white,
                          onPrimary:primaryBlack,
                          side: BorderSide(width: 1,color: primaryBlack),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                          onPressed: () => print(''), child: Text('Cancel')),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(150, 50),
                          minimumSize: Size(150, 50),
                          primary:primaryBlack,
                          onPrimary:Colors.white,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                          onPressed: () => print(''), child: Text('Save')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}