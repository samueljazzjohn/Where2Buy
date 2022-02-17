import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Models/user_model.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/signup_screen.dart';
import 'package:where2buy/Widgets/circular_avatar_with_border.dart';
import 'package:where2buy/Widgets/divider.dart';
import 'package:where2buy/Widgets/flash.dart';
import 'package:where2buy/Widgets/text_field.dart';
import 'package:where2buy/Components/config.dart';

class LoginScreen extends StatefulWidget {
  final String type;
  const LoginScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState>? loginFormKey;
  bool isLoading = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _pasController = TextEditingController();
  late NetworkHandler net;
  UserModel? _userModel;

  @override
  void initState() {
    loginFormKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        height: size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black87,
                        // fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(login, width: 160, height: 100, fit: BoxFit.contain
                    // color: Colors.redAccent,
                    ),
              ],
            ),

            // Login details
            Expanded(
              // flex: 5,
              child: Form(
                key: loginFormKey,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 0),
                  child: Column(
                    children: [
                      // Email Field
                      InputField(
                          controller: _userController,
                          hintText: "Enter Email",
                          textfieldIcon: Icons.mail_outline,
                          isMail: true,
                          labelText: 'email'),

                      SizedBox(height: 2),
                      // Password Field
                      InputField(
                        controller: _pasController,
                        hintText: "Enter Password",
                        textfieldIcon: Icons.lock_outline,
                        labelText: 'Password',
                        isPass: true,
                      ),

                      // const SizedBox(height: 15),

                      // Login Button
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
                            setState(() {
                              isLoading = true;
                            });
                            if (loginFormKey!.currentState!.validate()) {
                              Map<String, dynamic> data = {
                                'email': _userController.text,
                                'password': _pasController.text,
                                'type': widget.type
                              };
                              // try {
                              net = NetworkHandler(ctx: context);
                              net.postReq("/login", data).then((res) {
                                var decode = json.decode(res.body);
                                print("res=$decode");
                                setState(() {
                                  _userModel = UserModel.fromJson(decode);
                                });
                                res.statusCode == 200 || res.statusCode == 201
                                    ? LoginNavigate(widget.type, _userModel!)
                                    : buildFlash(context,
                                        "Username or password incorrect");
                              }).catchError(
                                  (err) => {buildFlash(context, err)});

                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text('Login')),
                      SizedBox(height: 3),

                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              // Forgot Password
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignupScreen(type: widget.type);
                                    }));
                                  },
                                  child: const Text(
                                    'forget password?',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black38,
                                        decoration: TextDecoration.underline),
                                  )),
                              Spacer(),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignupScreen(type: widget.type);
                                    }));
                                  },
                                  child: const Text(
                                    'Sign up',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black38,
                                    ),
                                  )),
                            ],
                          )),

                      ColumnDiveder(),

                      const SizedBox(height: 15),

                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () => print('google'),
                              child:
                                  CircularAvatarWithBorder(assetName: google)),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () => print('facebook'),
                              child:
                                  CircularAvatarWithBorder(assetName: facebook))
                        ],
                      )),
                      SizedBox(height: 2),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  LoginNavigate(String type, UserModel model) {
    storeValue(type, model);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget.type == 'user'
          ? UserHomeScreen(type: widget.type)
          : StoreHomeScreen(type: widget.type);
    }));
  }

  Future<void> storeValue(String type, UserModel model) async {
    print(type);
    print(model.username);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("type", type);
    pref.setString("token", model.token);
    pref.setString("username", model.username);
    pref.setString("mail", model.email);
    pref.setBool("isLoggedin", true);
  }
}
