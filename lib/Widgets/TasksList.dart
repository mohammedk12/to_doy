import 'package:flutter/material.dart';
import 'package:to_doy/Widgets/TaskTile.dart';
import 'package:to_doy/models/tasks.dart';
import 'package:to_doy/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ListView.builder will only display the tasks that the user see others won't be build to save resources
      itemBuilder: (context, index) {
        return TaskTile(

            // Provider.of<TaskData>(context)    refers to TaskData object

            Provider.of<TaskData>(context)
                .tasks[index]
                .name, // reading from provider object (when TaskData object is updated, this line of code will also be updated )

            Provider.of<TaskData>(context).tasks[index].isDone,
            (checkboxState) {
          // updating to provider package
          Provider.of<TaskData>(context, listen: false).updateTask(
              // always add listen: false when exception error message tells you to add it
              Provider.of<TaskData>(context, listen: false).tasks[index]);
        }, () {
          Provider.of<TaskData>(context, listen: false)
              .deleteTask(// deleting to provider object
                  Provider.of<TaskData>(context, listen: false).tasks[index]);
        });
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
