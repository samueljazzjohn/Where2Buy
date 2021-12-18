import 'package:flutter/material.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/signup_screen.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/divider.dart';
import 'package:where2buy/Widgets/logo.dart';
import 'package:where2buy/Widgets/text_field.dart';
import 'package:where2buy/assets.dart';

class LoginScreen extends StatelessWidget {
  final String type;
  const LoginScreen({Key? key,required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    final _paswController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            // logo
            const Expanded(
                flex: 2,
                child: Center(child: Icon(Icons.shopping_cart, size: 80))),

            // Login details
            Expanded(
              flex: 4,
              child: Form(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      // Email Field
                      InputField(
                          controller: _textController,
                          textfieldIcon: Icons.mail_outline,
                          hintText: "Enter Email"),
                      const SizedBox(height: 15),

                      // Password Field
                      InputField(
                        controller: _paswController,
                        hintText: "Enter Password",
                        textfieldIcon: Icons.lock_outline,
                        isPass: true,
                      ),
                      const SizedBox(height: 15),
                      const Button(
                        isIcon: false,
                        btnText: 'Login',
                        nextScreen: UserHomeScreen(),
                      ),
                      TextButton(
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignupScreen(type: type);
                              })),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Colors.black87,
                                decoration: TextDecoration.underline),
                          )),
                      const SizedBox(height: 5),
                      // type=='user'?
                      Button(
                        isIcon: true,
                        btnText: 'Continue with Google',
                        nextScreen: UserHomeScreen(),
                        assetName: google,
                      )
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
