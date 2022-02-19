import 'package:flutter/material.dart';
import 'package:where2buy/Components/config.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool isPass;
  final bool isMail;
  final bool isNumber;
  final IconData? textfieldIcon;
  const InputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.textfieldIcon,
      this.labelText,
      this.isMail = false,
      this.isNumber = false,
      this.isPass = false})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool? _isObscure;

  @override
  void initState() {
    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 80,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              String? text = widget.labelText;
              return '$text shouldn\'t be empty';
            }
            if (widget.isPass && value.length < 8) {
              return 'password must contain atleast 8 characters';
            }
            // if (widget.isMail &&
            //     RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            //         .hasMatch(value)) {
            //   return 'Enter a valid email';
            // }
          },
          controller: widget.controller,
          // keyboardType: widget.isMail
          //     ? TextInputType.emailAddress
          //     : widget.isNumber
          //         ? TextInputType.number
          //         : TextInputType.text,
          cursorColor: Colors.black54,
          obscureText: widget.isPass ? _isObscure! : false,
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
                            setState(() {
                              _isObscure = !_isObscure!;
                            });
                          },
                          icon: Icon(
                            _isObscure!
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
        ));
  }
}
