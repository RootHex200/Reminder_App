
import 'package:flutter/material.dart';

class EmptyTask extends StatelessWidget {
  const EmptyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.min,
      children: const [
        Text("Please Add Task",style: TextStyle(color: Colors.grey,fontSize: 19),),
        SizedBox(height: 20,),
        Icon(
          Icons.task,
          size: 100,
          color: Colors.white,
        )
      ],
    );
  }
}
