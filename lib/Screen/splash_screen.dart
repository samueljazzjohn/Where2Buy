import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/type_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loggedIn = false;
  bool userType = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SplashScreen(
        // seconds: 3,
        // navigateAfterSeconds: new TypeScreen(),
        // title: new Text(
        //   'Where2Buy',
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        // ),
        // backgroundColor: Colors.white,
        // loaderColor: Colors.black,
    ),
    );
  }

  // isLoggedIn() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   bool loggedIn = pref.getBool('LoggedIn') ?? false;
  //   return loggedIn ? loggedIn : false;
  // }

  // getType() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getString('type') == 'user' ? true : false;
  // }
}
