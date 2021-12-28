import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';

class Button extends StatelessWidget {
  final bool isIcon;
  final String btnText;
  final Widget? nextScreen;
  final bool isNext;
  final Function()? onClick;
  final IconData? assetName;
  const Button(
      {Key? key,
      required this.isIcon,
      required this.btnText,
      this.nextScreen,
      this.isNext = true,
      this.onClick,
      this.assetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            maximumSize: const Size(400, 50),
            minimumSize: const Size(300, 50),
            primary: !isIcon ? Colors.black54 : Colors.white,
            onPrimary: !isIcon ? Colors.white : Colors.black54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            side: BorderSide(width: 1, color: Colors.black54)),
        onPressed: () {
          isNext
              ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return nextScreen!;
                }))
              : onClick;
        },
        icon: isIcon && assetName != null ? Icon(assetName!) : SizedBox(),
        label: Text(btnText));
  }
}
