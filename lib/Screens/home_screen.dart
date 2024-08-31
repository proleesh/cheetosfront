import 'package:cheetosfront/Screens/add_task_screen.dart';
import 'package:cheetosfront/Services/database_services.dart';
import 'package:cheetosfront/models/task.dart';
import 'package:cheetosfront/models/tasks_data.dart';
import 'package:cheetosfront/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task>? tasks;

  getTasks() async {
    tasks = await DataBaseServices.getTasks();
    Provider.of<TasksData>(context, listen: false).tasks = tasks!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                  'Todo tasks (${Provider.of<TasksData>(context).tasks.length})'),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:
                    Consumer<TasksData>(builder: (context, tasksData, child) {
                  return ListView.builder(
                      itemCount: tasksData.tasks.length,
                      itemBuilder: (context, index) {
                        Task task = tasksData.tasks[index];
                        return TaskTile(
                          task: task,
                          tasksData: tasksData,
                        );
                      });
                })),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AddTaskScreen();
                    });
              },
            ),
          );
  }
}
