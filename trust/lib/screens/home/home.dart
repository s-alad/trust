import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trust/screens/home/task_list.dart';
import 'package:trust/services/auth.dart';
import 'package:trust/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DataBaseService().tasks,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: const Text('Sign out'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ),
            TaskList(),
          ],
        ),
      ),
    );
  }
}
