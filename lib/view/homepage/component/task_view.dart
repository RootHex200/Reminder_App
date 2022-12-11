import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_manager/controller/get_task_provider.dart';
import 'package:work_manager/view/homepage/component/empty_task.dart';
import 'package:work_manager/view/homepage/component/error.dart';
import 'package:work_manager/view/homepage/component/task_item.dart';

class TaskView extends ConsumerWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task_Data = ref.watch(getTaskProvider);
    return task_Data.when(
      loading: ()=>const Center(child: CircularProgressIndicator(color: Colors.blue),),
      error: (error, stackTrace) => const Error(),
      data:(data)=> Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color(0xFF282829),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        // ignore: prefer_is_empty
        child:data.length==0?const EmptyTask(): ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return  Dismissible(
                key: UniqueKey(),
                
                child: TaskItem(Data:data[index]));
            }), 
      )),
    );
  }
}
