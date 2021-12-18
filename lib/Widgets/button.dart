import 'package:flutter/material.dart';
import 'package:where2buy/assets.dart';

class Button extends StatelessWidget {
  final bool isIcon;
  final String btnText;
  final Widget nextScreen;
  final String? assetName;
  const Button(
      {Key? key,
      required this.isIcon,
      required this.btnText,
      required this.nextScreen,
      this.assetName })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            maximumSize: const Size(400, 50),
            minimumSize: const Size(300, 50),
            primary: !isIcon ? Colors.black87 : Colors.white,
            onPrimary: !isIcon ? Colors.white : Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            side: BorderSide(width: 1, color: Colors.black87)),
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return nextScreen;
            })),
        icon: isIcon ? ImageIcon(AssetImage(assetName!)) : SizedBox(),
        label: Text(btnText));
  }
}
