import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:where2buy/Components/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: AnimatedSplashScreen.withScreenFunction(
          backgroundColor: Color(0Xb09496),
          splash: Column(
            children: [
              Image.asset(
                cart1,
                width: 45,
                height: 45,
              ),
              SizedBox(width: 10),
              Text('Where2Buy',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ],
          ),
          screenFunction: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            bool loggedIn = pref.getBool('isLoggedin') ?? false;
            return loggedIn
                ? pref.getString('type') == 'user'
                    ? const UserHomeScreen(
                        type: 'user',
                      )
                    : const StoreHomeScreen(
                        type: 'store',
                      )
                : const TypeScreen();
          },
          splashTransition: SplashTransition.fadeTransition,
          // pageTransitionType: PageTransitionType.scale,
        ),
      ),
    );
  }
}
