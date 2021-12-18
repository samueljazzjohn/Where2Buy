import 'package:flutter/material.dart';
import 'package:where2buy/Screen/login_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/text_field.dart';
import 'package:where2buy/assets.dart';

class SignupScreen extends StatelessWidget {
  final String type;
  const SignupScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    final _paswController = TextEditingController();
    final _mailController = TextEditingController();
    final _confirmPassController = TextEditingController();
    final _typeController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 40,bottom:20),
                child: Center(child: Text('SignUp',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35 ),) )),
            Expanded(
              flex: 6,
              child: Center(
                child: Form(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        InputField(
                            controller: _textController,
                            textfieldIcon: Icons.person,
                            hintText: type == 'user'
                                ? "Enter Username"
                                : 'Enter Store Name'),
                        SizedBox(height: 20),
                        // type == 'store'
                        //     ? InputField(
                        //         controller: _mailController,
                        //         hintText: "Enter Type",
                        //         textfieldIcon: Icons.mail_outline,
                        //         isPass: true,
                        //       )
                        //     : const SizedBox(),
                        // type == 'store'
                        //     ? const SizedBox(height: 20)
                        //     : const SizedBox(),
                        InputField(
                          controller: _mailController,
                          hintText: "Enter Email",
                          textfieldIcon: Icons.mail_outline,
                          isPass: true,
                        ),
                        SizedBox(height: 20),
                        InputField(
                          controller: _paswController,
                          hintText: "Enter Password",
                          textfieldIcon: Icons.lock_outline,
                          isPass: true,
                        ),
                        SizedBox(height: 20),
                        InputField(
                          controller: _confirmPassController,
                          hintText: "Confirm Password",
                          textfieldIcon: Icons.lock_outline,
                          isPass: true,
                        ),
                        SizedBox(height: 20),
                        // type == 'store'
                        //     ? Button(
                        //         isIcon: true,
                        //         btnText: 'Location',
                        //         nextScreen: SignupScreen(type: 'store'),
                        //         assetName: location,
                        //       )
                        //     : SizedBox(),
                        // type == 'store'
                        //     ? const SizedBox(height: 20)
                        //     : SizedBox(),
                        const Button(
                          isIcon: false,
                          btnText: 'SignUp',
                          nextScreen: LoginScreen(
                            type: 'user',
                          ),
                        ),
                        const SizedBox(height: 2),
                        TextButton(
                            onPressed: () => Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen(
                                    type: type,
                                  );
                                })),
                            child: const Text(
                              'Already have an account?',
                              style: TextStyle(
                                  color: Colors.black87,
                                  decoration: TextDecoration.underline),
                            )),
                      ],
                    ),
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
