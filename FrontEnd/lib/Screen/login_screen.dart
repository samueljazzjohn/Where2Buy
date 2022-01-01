import 'package:flutter/material.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/signup_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/circular_avatar_with_border.dart';
import 'package:where2buy/Widgets/divider.dart';
import 'package:where2buy/Widgets/text_field.dart';
import 'package:where2buy/Components/config.dart';

class LoginScreen extends StatefulWidget {
  final String type;
  const LoginScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _userController = TextEditingController();
    TextEditingController _pasController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

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
            // Spacer(),
            // Login details
            Expanded(
              // flex: 5,
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 0),
                  child: Column(
                    children: [
                      // Email Field
                      InputField(
                          controller: _userController,
                          textfieldIcon: Icons.mail_outline,
                          hintText: "Enter Email",
                          labelText:"Email"
                          ),

                      const SizedBox(height: 15),

                      // Password Field
                      InputField(
                        controller: _pasController,
                        hintText: "Enter Password",
                        textfieldIcon: Icons.lock_outline,
                        isPass: true,
                        labelText:'Password'
                      ),

                      const SizedBox(height: 15),

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
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return widget.type == 'user'
                                    ? UserHomeScreen(type: widget.type)
                                    : StoreHomeScreen(type: widget.type);
                              }));
                            }
                          },
                          child: Text('Login')),
                      // Forgot Password
                      TextButton(
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignupScreen(type: widget.type);
                              })),
                          child: const Text(
                            'forget password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                                decoration: TextDecoration.underline),
                          )),

                      ColumnDiveder(),

                      const SizedBox(height: 15),

                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () => print('google'),
                              child:
                                  CircularAvatarWithBorder(assetName: google)),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                              onTap: () => print('facebook'),
                              child:
                                  CircularAvatarWithBorder(assetName: facebook))
                        ],
                      )),
                      SizedBox(height: 2),
                      TextButton(
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignupScreen(type: widget.type);
                              })),
                          child: const Text(
                            'Don\'t have an account? Sign up',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                                decoration: TextDecoration.underline),
                          )),
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
}
