import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:trust/screens/home/task_tile.dart';

import '../../models/task.dart';

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

    var taskslist = tasks?.get('tasks');
    print("TASKSLSIT");
    print(taskslist);
    print(taskslist?.length);
    try {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            try {
              print("PASS");
              return TaskTile(
                  task: Task(
                      name: taskslist[index]['name'],
                      text: taskslist[index]['text']));
            } catch (e) {
              print(e);
              return Container(
                height: 20,
              );
            }
          },
          itemCount: taskslist?.length ?? 0);
    } catch (e) {
      return Container(
        child: Text(e.toString()),
      );
    }
  }
}
