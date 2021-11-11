import 'package:flutter/material.dart';
import 'package:to_doy/screens/TaskScreen.dart';
import 'package:provider/provider.dart';
import 'package:to_doy/models/task_data.dart';

/*

In order to understand state and provider,
it's very important to check out this video
'205' Introducing the Provider package

https://www.udemy.com/course/flutter-bootcamp-with-dart/learn/lecture/15785418#questions

 */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          TaskData(), // returns the object that need to be provided to all of the children in the tree (which is TaskData)
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
