import 'package:flutter/material.dart';
import 'package:trust/screens/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  signIn() async {
    dynamic result = await _auth.signInAnon();
    if (result == null) {
      print('error');
    } else {
      print('sign in');
      print(result);
      print(result.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          child: const Text('Sign In'),
          onPressed: () async {
            signIn();
          },
        ),
      ),
    );
  }
}
