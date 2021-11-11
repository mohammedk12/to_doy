import 'package:flutter/material.dart';
import 'package:to_doy/Widgets/TasksList.dart';
import 'package:to_doy/screens/add_task_screen.dart';
import 'package:to_doy/models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:to_doy/models/task_data.dart';

/*

we write and read from the provider object the things that are instantly updated like:
- number of tasks under 'to Doy!'
- task list

*when we write to provide package, always remember to notify the listeners so they can update

 */

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled:
                true, // so that keyboard won't cover add button on the sheet
            context: context,
            builder: (context) => AddTaskScreen(),
          );
          // we can see from the documentation that in builder we need to put a function that takes a context and returns a widget, so we created anynomus function here
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // always go to Flutter inspector > Lsyout   to check the layouts on the imulator
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 35,
                    color: Colors.lightBlue,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text(
                  'to Doy!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          // the reason we did not include this expanded widget in the column, is becuse the column above has padding, but in this widget we don't want padding
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}
