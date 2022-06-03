import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<DocumentSnapshot<Object?>?>(context);
    print(tasks);
    print("================================");
    print("inprint tasks data");
    print(tasks?.data());
    return Container(
      child: Text(tasks?.get('tasks')[0] ?? ''),
    );
  }
}
