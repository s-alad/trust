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

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
                      child: const Text("register with email and password"))
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
