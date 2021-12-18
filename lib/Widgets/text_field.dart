import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  final IconData textfieldIcon;
  const InputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.textfieldIcon,
      this.isPass = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:300,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: isPass,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(textfieldIcon, color: Colors.black54),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87,width:1),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87,width:1),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
