import 'package:shared_preferences/shared_preferences.dart';

Future<String> getType() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? type = await pref.getString('type');
  return type!;
}
