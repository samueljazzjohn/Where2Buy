import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';

ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool isPass;
  final IconData? textfieldIcon;
  const InputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.textfieldIcon,
      this.labelText,
      this.isPass = false})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    _isObscure.value = widget.isPass;

    return Container(
      width: 300,
      height: 80,
      child: ValueListenableBuilder(
        valueListenable: _isObscure,
        builder: (BuildContext context, bool value, Widget? child) {
          return TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                String? text = widget.labelText;
                return '$text shouldn\'t be empty';
              }
              if (widget.isPass && value.length < 8) {
                return 'password must contain atleast 8 characters';
              }
            },
            controller: widget.controller,
            cursorColor: Colors.black54,
            obscureText: _isObscure.value,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                // labelText: labelText ?? '',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.textfieldIcon != null
                      ? Icon(widget.textfieldIcon, color: Colors.black54)
                      : SizedBox(),
                ),
                suffixIcon: widget.isPass
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                            onPressed: () {
                              _isObscure.value = !_isObscure.value;
                            },
                            icon: Icon(
                              _isObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                            )),
                      )
                    : SizedBox(),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryBlack, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: widget.hintText,
                labelStyle: TextStyle(color: primaryBlack),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 1),
                    borderRadius: BorderRadius.circular(15))),
          );
        },
      ),
    );
  }
}
