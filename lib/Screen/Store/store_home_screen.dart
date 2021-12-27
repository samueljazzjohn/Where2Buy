import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:where2buy/Components/product_list.dart';
import 'package:where2buy/Widgets/header_with_searchbox.dart';
import 'package:where2buy/Widgets/navigation_drawer_widget.dart';
import 'package:where2buy/Widgets/product_card.dart';
import 'package:where2buy/Components/config.dart';

class StoreHomeScreen extends StatefulWidget {
  final String type;
  const StoreHomeScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<StoreHomeScreen> createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen> {
  final GlobalKey<ScaffoldState> _storeKey = GlobalKey<ScaffoldState>();

  List<Widget> getChildren({required Size size}) {
    final children = <Widget>[];
    for (var i = 0; i < productList.length; i++) {
      children.add(ProductCard(
          type: widget.type,
          size: size,
          storeName: productList[i]['productName'],
          storeImage: productList[i]['productImage'],
          distance: productList[i]['price']));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _storeKey,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryBlack,
          foregroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(camara,
                      color: Colors.white, width: 50, height: 50)),
            )
          ],
          leading: IconButton(
              onPressed: () {
                _storeKey.currentState?.openDrawer();
                // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NavigationDrawerWidget()));
              },
              icon: SvgPicture.asset(menu, color: Colors.white))),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWithSearchbox(),
            SizedBox(height: 40),
            Container(
              height: size.height * 0.7,
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                  children: getChildren(size: size)),
            )

            // Container(
            //     child: Column(children: [
            //   Container(
            //       child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       ProductCard(
            //           size: size,
            //           storeName: 'Bag',
            //           storeImage: 'assets/images/products/bag.jpg',
            //           distance: '\$1200'),
            //       ProductCard(
            //           size: size,
            //           storeName: 'camara',
            //           storeImage: 'assets/images/products/camara.jpeg',
            //           distance: '\$8500'),
            //     ],
            //   )),
            //   Container(
            //       child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       ProductCard(
            //           size: size,
            //           storeName: 'Cycle',
            //           storeImage: 'assets/images/products/cycle.jpg',
            //           distance: '\$1200'),
            //       ProductCard(
            //           size: size,
            //           storeName: 'Headphone',
            //           storeImage: 'assets/images/products/headphone.jpg',
            //           distance: '\$8500'),
            //     ],
            //   )),
            //   Container(
            //       child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       ProductCard(
            //           size: size,
            //           storeName: 'Stool',
            //           storeImage: 'assets/images/products/stool.jpg',
            //           distance: '\$1200'),
            //       ProductCard(
            //           size: size,
            //           storeName: 'Shoe',
            //           storeImage: 'assets/images/products/Shoe.jpg',
            //           distance: '\$8500'),
            //     ],
            //   ))
            // ]))
          ],
        ),
      ),
    );
  }
}
