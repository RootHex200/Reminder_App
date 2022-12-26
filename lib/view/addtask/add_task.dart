import 'package:flutter/material.dart';
import 'package:work_manager/view/addtask/component/app_bar.dart';
import 'package:work_manager/view/addtask/component/task_input.dart';
import 'package:work_manager/view/homepage/home_page.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
        return Future.value(true);
      },
      child: Scaffold(
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
      )),
    );
  }
}
