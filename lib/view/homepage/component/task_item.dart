import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_manager/model/notification_model.dart';
import 'package:work_manager/model/task_model.dart';
import 'package:work_manager/service/notification_service.dart';

class TaskItem extends StatelessWidget {
  final TaskModel Data;
  const TaskItem({super.key, required this.Data});

  @override
  Widget build(BuildContext context) {
    final color = Data.colors.split(" ").last.split(")")[0].split("(").last;
    final main_color = color == "0xfff44336"
        ? 0xfff44336
        : color == "0xffffeb3b"
            ? 0xffffeb3b
            : 0xff2196f3;
    return GestureDetector(
      onLongPress: () {
        print('I am long press');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(main_color)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    Data.title,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "${Data.startTime}- ${Data.endTime}",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  Data.description,
                  style: const TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
