import 'package:flutter/material.dart';

ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);

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
  _isObscure.value = isPass;

    return Container(
      width:300,
      height: 50,
      child: ValueListenableBuilder(
        valueListenable:  _isObscure,
        builder: (BuildContext context, bool value, Widget? child) {
          return  TextFormField(
          controller: controller,
          cursorColor: Colors.black54,
          obscureText: _isObscure.value,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(textfieldIcon, color: Colors.black54),
              ),
              suffixIcon: 
                isPass ? Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: IconButton(
                  onPressed: (){
                    _isObscure.value = !_isObscure.value;
                  },
                  icon: Icon(_isObscure.value? Icons.visibility : Icons.visibility_off , color: Colors.black54, )),
                ): 
                SizedBox(),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87,width:1),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: hintText,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87,width:1),
                  borderRadius: BorderRadius.circular(15))),
        );
        },
      ),
    );
  }
}
