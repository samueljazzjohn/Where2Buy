import 'package:flutter/material.dart';
import 'package:where2buy/Screen/login_screen.dart';
import 'package:where2buy/Screen/signup_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Components/config.dart';

class WelcomeScreen extends StatelessWidget {
  final String type ;
  const WelcomeScreen({ Key? key , required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left:20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Align(alignment: Alignment.bottomCenter, child: Text('Welcome to Where2Buy',style: TextStyle(color:Colors.black38, fontWeight:FontWeight.bold))),
              ),
              Expanded(
                flex: 3,
                child: Image.asset(
                  cart2,
                  alignment: Alignment.bottomCenter,
                  width: size.width*0.6,
                  // height: 150,
                  ),
              ),
              Expanded(
                flex:2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Button(isIcon: false, btnText: 'SignIn', nextScreen: LoginScreen(type: type)),
                      SizedBox(height: 20,),
                      Button(isIcon: true, btnText: 'SignUp', nextScreen: SignupScreen(type: type))
                    ],
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}