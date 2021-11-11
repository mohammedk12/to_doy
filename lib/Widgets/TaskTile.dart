import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final void Function(bool?)
      checkboxCallback; // if used will check or uncheck task
  final Function() longpressCallBack; // if used will delete task

  TaskTile(this.taskTitle, this.isChecked, this.checkboxCallback,
      this.longpressCallBack);

/*
stateful widget changes a lot and it's resource consuming
statless widget dose not change (also we can't use setState() here, because it doesn't have a state ! ,,, all proprties here should be final)

 */

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$taskTitle',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged:
            checkboxCallback, // call back happend (simmiller to call by refrence), if I bringed the function here it wont work, we are calling it from here and it's opeareting in TasksList class
      ),
      onLongPress: longpressCallBack, // call back
    );
  }
}

/*
setState(() {
            // now it will go to build method and rerun it
            if (newVal != null) {
              isChecked = newVal;
            } else {
              isChecked = true;
            }
          });
 */

/*

class checkBoxTrail extends StatelessWidget {
  final bool checkBoxState;
  final void Function(bool?) checkBoxUpdater;

  checkBoxTrail(this.checkBoxState, this.checkBoxUpdater);

  @override
  Widget build(BuildContext context) {
    return
  }
}
 */
