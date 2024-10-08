import 'package:cheetosfront/models/tasks_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            TextField(
              autofocus: true,
              onChanged: (val) => taskTitle = val,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (taskTitle.isNotEmpty) {
                  Provider.of<TasksData>(context, listen: false)
                      .addTaks(taskTitle);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        ));
  }
}
