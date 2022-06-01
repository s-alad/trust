import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust/models/user.dart';
import 'package:trust/screens/authenticate/authenticate.dart';
import 'package:trust/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final check = Provider.of<Trustee>(context);
    print(check);

    return Authenticate();
  }
}
