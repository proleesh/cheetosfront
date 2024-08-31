import 'package:cheetosfront/Services/database_services.dart';
import 'package:cheetosfront/models/task.dart';
import 'package:flutter/material.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [];

  void addTaks(String taskTitle) async {
    Task task = await DataBaseServices.addTask(taskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggle();
    DataBaseServices.updateTask(task.id);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    DataBaseServices.deleteTask(task.id);
    notifyListeners();
  }
}
