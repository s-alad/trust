import 'package:flutter/material.dart';
import 'package:trust/screens/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            child: const Text('Sign out'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ),
      ),
    );
  }
}
