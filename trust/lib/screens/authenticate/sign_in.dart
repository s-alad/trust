import 'package:flutter/material.dart';
import 'package:trust/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

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
        child: Column(
          children: <Widget>[
            Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) => {setState(() => email = value)},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) => {setState(() => password = value)},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => {print(email + " " + password)},
                      child: const Text("sign in with email and password"))
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('Proceed Without Account'),
              onPressed: () async {
                signIn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
