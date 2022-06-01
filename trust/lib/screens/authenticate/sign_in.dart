import 'package:flutter/material.dart';
import 'package:trust/common/check.dart';
import 'package:trust/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function? toggle;
  const SignIn({Key? key, this.toggle}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  Check check = Check();

  String email = '';
  String password = '';
  String error = '';

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
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: check.emailValidator(),
                    onChanged: (value) => {setState(() => email = value)},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: check.passwordValidator(),
                    obscureText: true,
                    onChanged: (value) => {setState(() => password = value)},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print(email + " " + password);
                        if (_formKey.currentState!.validate()) {
                          print("valid" + " " + email + " " + password);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            print('error');
                            setState(() {
                              error = "error signing up";
                            });
                          } else {
                            print('sign in');
                            print(result);
                            print(result.uid);
                          }
                        } else
                          print("not valid");
                      },
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
            Text(error),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('sign up'),
              onPressed: () async {
                widget.toggle!();
                print("toggle");
              },
            ),
          ],
        ),
      ),
    );
  }
}
