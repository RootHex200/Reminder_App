import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskInputTextName extends StatelessWidget {
  final String txt;
  const TaskInputTextName({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
    );
  }
}
