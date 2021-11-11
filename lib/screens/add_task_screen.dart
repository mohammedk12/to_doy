import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_doy/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTextTitle = '';

    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.00),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                )),
            TextField(
              autofocus: true, // automaticlly open the keyboard
              textAlign: TextAlign.center,
              onChanged: (newVal) {
                newTextTitle = newVal;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                //  updating the provider object
                Provider.of<TaskData>(context,
                        listen:
                            false) // listen: false , always type it or you will get an error
                    .addTask(newTextTitle);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
