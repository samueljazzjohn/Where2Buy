import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/type_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSplashScreen.withScreenFunction(
          splash: Column(
            children: const [
              Icon(Icons.shopping_cart, size: 40),
              SizedBox(width: 5),
              Text('Where2Buy',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
            ],
          ),
          screenFunction: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            bool loggedIn = pref.getBool('LoggedIn') ?? false;
            return loggedIn
                ? pref.getString('type') == 'user'
                    ? const UserHomeScreen()
                    : const StoreHomeScreen()
                : const TypeScreen();
          },
          splashTransition: SplashTransition.fadeTransition,
          // pageTransitionType: PageTransitionType.scale,
        ),
      ),
    );
  }
}
