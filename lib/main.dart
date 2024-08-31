import 'package:cheetosfront/models/tasks_data.dart';
import 'package:flutter/material.dart';

import 'package:cheetosfront/Screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugDisableShadows;
    return ChangeNotifierProvider<TasksData>(
      create: (context) => TasksData(),
      child: MaterialApp(home: HomeScreen()));
  }
}
