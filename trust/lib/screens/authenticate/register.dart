import 'package:flutter/material.dart';
import 'package:trust/services/auth.dart';

class Register extends StatefulWidget {
  final Function? toggle;
  const Register({Key? key, this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) =>
                        value!.isEmpty ? "enter an email" : null,
                    onChanged: (value) => {setState(() => email = value)},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) => value!.length < 6
                        ? "enter a password with at least 6 characters"
                        : null,
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
                              .registerWithEmailAndPassword(email, password);
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
                      child: const Text("register with email and password")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('Go Back'),
              onPressed: () async {
                widget.toggle!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
