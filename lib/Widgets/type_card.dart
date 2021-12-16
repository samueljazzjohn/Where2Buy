import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<String> typeNotifier = ValueNotifier<String>('nodata');


class TypeCard extends StatelessWidget {
  final double cardWidth;
  final double cardHeight;
  final IconData cardIcon;
  final String cardName;
  final String type;
  const TypeCard(
      {Key? key,
      required this.cardWidth,
      required this.cardHeight,
      required this.cardIcon,
      required this.type,
      // required this.value,
      required this.cardName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setType(type);
      },
      child: ValueListenableBuilder(
        valueListenable: typeNotifier,
        builder: (BuildContext context, String value,  child) {
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: (value == type && value != 'nodata')
                    ? const BorderSide(width: 1, color: Colors.blue)
                    : const BorderSide(width: 1, color: Color(0Xff7E7E7E))),
            child: SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Icon(
                      cardIcon,
                      size: 45,
                    ),
                  ),
                  // const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cardName,
                      style:const TextStyle(fontSize: 20),
                    ),
                  )
                  // Expanded(flex: 2, child: cardName!=null  ? Text(cardName!) : SizedBox())
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> setType(String type) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('type', type);
    typeNotifier.value = type;
  }
}
