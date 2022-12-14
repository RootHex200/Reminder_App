import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:work_manager/database/database.dart';
import 'package:work_manager/view/addtask/component/app_bar.dart';
import 'package:work_manager/view/addtask/component/task_input.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          AddTaskAppBar(),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Add Task',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              )),
          SizedBox(
            height: 15,
          ),
          TaskInput()
        ],
      ),
    ));
  }
}
