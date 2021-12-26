import 'package:flutter/material.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/signup_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/circular_avatar_with_border.dart';
import 'package:where2buy/Widgets/divider.dart';
import 'package:where2buy/Widgets/text_field.dart';
import 'package:where2buy/config.dart';

class LoginScreen extends StatelessWidget {
  final String type;
  const LoginScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _userController = TextEditingController();
    TextEditingController _pasController = TextEditingController();

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
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black87,
                            // fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset(login,
                        width: 160, height: 100, fit: BoxFit.contain
                        // color: Colors.redAccent,
                        ),
                  ],
                )),

            // Login details
            Expanded(
              flex: 5,
              child: Form(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Email Field
                      InputField(
                          controller: _userController,
                          textfieldIcon: Icons.mail_outline,
                          hintText: "Enter Email"),
                      // Container(
                      //   width: 300,
                      //   height: 50,
                      //   child: TextFormField(
                      //     cursorColor: Colors.black54,
                      //     textAlign: TextAlign.justify,
                      //     decoration: InputDecoration(
                      //         prefixIcon: const Padding(
                      //           padding: const EdgeInsets.only(left: 8.0),
                      //           child: Icon(Icons.mail_outline,
                      //               color: Colors.black54),
                      //         ),
                      //         border: OutlineInputBorder(
                      //           borderSide:
                      //               BorderSide(color: Colors.black87, width: 1),
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         hintText: 'Enter Email',
                      //         focusedBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //                 color: Colors.black87, width: 1),
                      //             borderRadius: BorderRadius.circular(15))),
                      //     onChanged: (value) => setState(() {
                      //       username = value;
                      //       print(username);
                      //     }),
                      //   ),
                      // ),

                      const SizedBox(height: 15),

                      // Password Field
                      InputField(
                        controller: _pasController,
                        hintText: "Enter Password",
                        textfieldIcon: Icons.lock_outline,
                        isPass: true,
                      ),

                      // Container(
                      //   width: 300,
                      //   height: 50,
                      //   child: TextFormField(
                      //     obscureText: _isObscure,
                      //     cursorColor: Colors.black54,
                      //     textAlign: TextAlign.justify,
                      //     decoration: InputDecoration(
                      //         prefixIcon: const Padding(
                      //           padding: EdgeInsets.only(left: 8.0),
                      //           child: Icon(Icons.lock_outline,
                      //               color: Colors.black54),
                      //         ),
                      //         border: OutlineInputBorder(
                      //           borderSide: const BorderSide(
                      //               color: Colors.black87, width: 1),
                      //           borderRadius: BorderRadius.circular(15),
                      //         ),
                      //         suffixIcon: IconButton(
                      //           icon: Icon(
                      //             _isObscure
                      //                 ? Icons.visibility
                      //                 : Icons.visibility_off,
                      //             color: Colors.black54,
                      //           ),
                      //           onPressed: () {
                      //             setState(() {
                      //               _isObscure = !_isObscure;
                      //               print(_isObscure);
                      //             });
                      //           },
                      //         ),
                      //         hintText: 'Enter Password',
                      //         focusedBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //                 color: Colors.black87, width: 1),
                      //             borderRadius: BorderRadius.circular(15))),
                      //     onChanged: (value) => setState(() {
                      //       password = value;
                      //     }),
                      //   ),
                      // ),

                      const SizedBox(height: 15),

                      // Login Button
                      const Button(
                        isIcon: false,
                        btnText: 'Login',
                        nextScreen: UserHomeScreen(),
                      ),

                      // Forgot Password
                      TextButton(
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignupScreen(type: type);
                              })),
                          child: const Text(
                            'Don\'t have any account? sign up',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                                decoration: TextDecoration.underline),
                          )),
                      // type=='user'?
                      SizedBox(
                        height: 10,
                      ),
                      ColumnDiveder(),

                      const SizedBox(height: 15),

                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () => print('google'),
                              child: CircularAvatarWithBorder(assetName: google)),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                              onTap: () => print('facebook'),
                              child: CircularAvatarWithBorder(assetName: facebook))
                        ],
                      ))

                      // : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   width: 25,
            //     child: Align(
            //       alignment:Alignment.bottomLeft,
            //       child: IconButton(
            //         onPressed:()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            //           return TypeScreen();
            //         }
            //         ) ),
            //          icon: Icon(Icons.arrow_left_rounded),
            //          ),
            //     ),
            // )
          ],
        ),
      )),
    );
  }
}
