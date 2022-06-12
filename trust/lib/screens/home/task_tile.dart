import 'package:flutter/material.dart';
import 'package:trust/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile({this.task});

  @override
  Widget build(BuildContext context) {
    print(task?.name);

    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
          ),
          title: Text(task?.name ?? ''),
          subtitle: Text(task?.text ?? ''),
        ),
      ),
    );
  }
}
