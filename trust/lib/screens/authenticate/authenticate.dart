import 'package:flutter/material.dart';
import 'package:trust/screens/authenticate/register.dart';
import 'package:trust/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool type = true;

  toggle() {
    setState(() {
      type = !type;
      print(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (type)
      return SignIn(toggle: toggle);
    else
      return Register(toggle: toggle);
  }
}
