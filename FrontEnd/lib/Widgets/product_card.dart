import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Components/product_list.dart';
import 'package:where2buy/Components/config.dart';
import 'package:where2buy/Screen/Store/product_add_screen.dart';
import 'package:where2buy/Screen/Store/store_edit_profile_screen.dart';

class ProductCard extends StatefulWidget {
  final Size size;
  final String storeName;
  final String storeImage;
  final String distance;
  final String type;
  const ProductCard(
      {Key? key,
      required this.size,
      required this.storeName,
      required this.storeImage,
      required this.distance,
      required this.type})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late String url;

  setUrl(NetworkHandler _networkHandler) {
    url = _networkHandler.getImage(widget.storeImage);
  }

  @override
  Widget build(BuildContext context) {
    NetworkHandler _networkHandler = NetworkHandler(ctx: context);
    setUrl(_networkHandler);
    url = url.replaceAll(r'\', r'/');
    print('_____inside postcard ${url}');
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      // transform:
      margin: EdgeInsets.only(bottom: 20, left: 20),
      width: widget.size.width * 0.4,
      // height: 130,
      child: Stack(children: [
        Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(url,
                    width: widget.size.width * 0.4,
                    height: 100,
                    fit: BoxFit.cover)),
            // Image.asset(storeImage,
            //     width: size.width * 0.4, height: 110, fit: BoxFit.cover)),
            Container(
                width: widget.size.width * 0.4,
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: primaryBlack.withOpacity(0.23))
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.storeName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Text('Rs.${widget.distance}',
                            style: TextStyle(fontSize: 12))
                      ]),
                ))
          ],
        ),
        widget.type == 'store'
            ? Positioned(
                top: 5,
                right: 5,
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Edit'), value: 1),
                    PopupMenuItem(child: Text('Delete'), value: 2)
                  ],
                  onSelected: (choice) {
                    switch (choice) {
                      case 1:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddProductScreen(
                                      type: widget.type,
                                    )));
                        break;
                      case 2:
                        for (int i = 0; i < productList.length; i++) {
                          if (productList[i]['storeImage'] ==
                              widget.storeImage) {
                            productList.remove(productList[i]['storeImage']);
                          }
                        }
                        print(productList);
                        break;
                    }
                  },
                )
                // IconButton(
                //     onPressed: () => print('icon pressed'),
                //     icon: SvgPicture.asset(more))
                )
            : SizedBox()
      ]),
    );
  }
}
