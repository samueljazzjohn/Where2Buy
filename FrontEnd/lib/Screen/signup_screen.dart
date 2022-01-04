import 'package:flutter/material.dart';
import 'package:where2buy/Components/network_handler.dart';
import 'package:where2buy/Screen/login_screen.dart';
import 'package:where2buy/Widgets/button.dart';
import 'package:where2buy/Widgets/text_field.dart';
import 'package:where2buy/Components/config.dart';

class SignupScreen extends StatefulWidget {
  final String type;
  const SignupScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    final _paswController = TextEditingController();
    final _mailController = TextEditingController();
    final _typeController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Center(
                      child: Text(
                    'SignUp',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
              // SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  signUp,
                  width: 80,
                  height: 80,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          InputField(
                            controller: _textController,
                            textfieldIcon: Icons.person,
                            hintText: widget.type == 'user'
                                ? "Enter Username"
                                : 'Enter Store Name',
                            labelText: widget.type == 'user'
                                ? "Username"
                                : 'Store Name',
                          ),
                          SizedBox(height: 20),
                          InputField(
                              controller: _mailController,
                              hintText: "Enter Email",
                              textfieldIcon: Icons.mail_outline,
                              labelText: 'email'),
                          SizedBox(height: 20),
                          InputField(
                            controller: _paswController,
                            hintText: "Enter Password",
                            textfieldIcon: Icons.lock_outline,
                            labelText: 'Password',
                            isPass: true,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  maximumSize: const Size(400, 50),
                                  minimumSize: const Size(300, 50),
                                  primary: Colors.black54,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  side: BorderSide(
                                      width: 1, color: Colors.black54)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  Map<String, String> data = {
                                    "username": _textController.text,
                                    "password": _paswController.text,
                                    "mail": _mailController.text,
                                    "type":widget.type
                                  };
                                  print(data);
                                  NetworkHandler net = new NetworkHandler();
                                  await net.postReq(
                                      "/signup", data);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen(type: widget.type);
                                  }));
                                }
                              },
                              child: Text('Signup')),
                          const SizedBox(height: 2),
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen(
                                      type: widget.type,
                                    );
                                  })),
                              child: const Text(
                                'Already have an account?',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
