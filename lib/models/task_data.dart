import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_doy/models/tasks.dart';

// provider object
class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'a'),
    Task(name: 'b'),
    Task(name: 'c'),
  ];

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
