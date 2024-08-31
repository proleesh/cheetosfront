import 'package:cheetosfront/models/task.dart';
import 'package:cheetosfront/models/tasks_data.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final TasksData tasksData;

  const TaskTile({Key? key, required this.task, required this.tasksData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Checkbox(
          activeColor: Colors.green,
          value: task.done,
          onChanged: (checkBox) {
            tasksData.updateTask(task);
          }),
      title: Text(task.title,
          style: TextStyle(
              decoration: task.done
                  ? TextDecoration.lineThrough
                  : TextDecoration.none)),
      trailing: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          tasksData.deleteTask(task);
        },
      ),
    ));
  }
}
