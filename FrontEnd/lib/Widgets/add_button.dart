import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:where2buy/Components/config.dart';

class AddButton extends StatelessWidget {
  final String btnText;
  final String btnIcon;
  final Function() press;
  const AddButton(
      {Key? key,
      required this.btnText,
      required this.btnIcon,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 200,
            color: primaryBlack.withOpacity(0.23)
          )
        ]
      ),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              maximumSize: const Size(400, 50),
              minimumSize: const Size(300, 50),
              primary: Colors.grey[300],
              onPrimary: primaryBlack,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () => press(),
            icon: SvgPicture.asset(btnIcon,color: Colors.black38,),
            label: Text(btnText)));
  }
}
