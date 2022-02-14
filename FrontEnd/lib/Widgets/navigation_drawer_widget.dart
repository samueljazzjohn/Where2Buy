import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2buy/Screen/Store/store_home_screen.dart';
import 'package:where2buy/Screen/Store/store_profile_screen.dart';
import 'package:where2buy/Screen/User/user_profile.dart';
import 'package:where2buy/Screen/User/usr_home_screen.dart';
import 'package:where2buy/Screen/type_screen.dart';
import 'package:where2buy/Components/config.dart';

class NavigationDrawerWidget extends StatefulWidget {
  final String type;
  const NavigationDrawerWidget({Key? key, required this.type})
      : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  late String username, email;

  Future<void> updateValues() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? uname = await pref.getString('username');
    String? mail = await pref.getString('mail');
    print(uname);
    print(mail);
    setState(() {
      username = uname ?? ' ';
      email = mail ?? ' ';
    });
  }

  @override
  void initState() {
    super.initState();
    updateValues().then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: primaryBlack,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              height: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 45,
                              ),
                              SizedBox(width: 10),
                              Text('Where2Buy',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ))),
                  Text(
                    username,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.grey),
            SizedBox(height: 10),
            // buildMenuItem(itemName:'Home',itemIcon:  Icons.home,press:()=>selectedItem(context, 0)),
            // buildMenuItem(
            //     itemName: 'Profile',itemIcon:  Icons.person,press:()=>selectedItem(context, 1)),
            // // buildMenuItem('Content',Icons.content_copy,()=>selectedItem(context,2)),
            // buildMenuItem(itemName: 'Close',itemIcon:  Icons.close, press: () => selectedItem(context, 2)),
            // buildMenuItem(itemName: 'logout', itemIcon: Icons.logout_outlined,
            //     press: () => selectedItem(context, 3)),
            ListTile(
              title: Text('Home', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.home, color: Colors.white),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => widget.type == 'user'
                        ? UserHomeScreen(
                            type: 'store',
                          )
                        : StoreHomeScreen(type: widget.type)));
              },
            ),
            SizedBox(height: 15),
            ListTile(
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.person, color: Colors.white),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => widget.type == 'user'
                        ? UserProfile()
                        : StoreProfile()));
              },
            ),
            SizedBox(height: 15),
            ListTile(
              title: Text('Close', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.close, color: Colors.white),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 15),
            ListTile(
              title: Text('logout', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.logout, color: Colors.white),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TypeScreen()));
              },
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
