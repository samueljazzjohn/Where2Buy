import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where2buy/assets.dart';

ValueNotifier<String> typeNotifier = ValueNotifier<String>('nodata');

class TypeCard extends StatelessWidget {
  final String cardImage;
  final String cardName;
  final String type;
  const TypeCard(
      {Key? key,
      required this.cardImage,
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
        builder: (BuildContext context, String value, child) {
          return Card(
              // margin: EdgeInsets.symmetric(vertical: 10),
              elevation: type==value && type!='nodata' ? 10 : 5 ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: type==value && type!='nodata' ? Colors.red[100] : Colors.red[50],
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    cardImage,
                    width: 60,
                    height: 60,
                  ),
                ),
                Text(
                  cardName,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ]));
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
