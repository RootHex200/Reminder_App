import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_manager/controller/add_task_provider.dart';
import 'package:work_manager/util/colors_list.dart';
import 'package:work_manager/util/widgets/textStyle.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:work_manager/view/addtask/component/custom_date_picker.dart';

class TaskInput extends ConsumerStatefulWidget {
  const TaskInput({super.key});

  @override
  ConsumerState<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends ConsumerState<TaskInput> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _datacontroller = TextEditingController();
  final TextEditingController _startTimecontroller = TextEditingController();
  final TextEditingController _endtimecontroller = TextEditingController();

  @override
  void initState() {
    initializeDateFormatting("en_BD");
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _datacontroller.dispose();
    _startTimecontroller.dispose();
    _endtimecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addTask = ref.watch(createTaskProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //title
          const TaskInputTextName(txt: 'Title'),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _titleController,
            onChanged: (value) {
              ref
                  .read(createTaskProvider.notifier)
                  .onSearchChanged(value, "title");
            },
            decoration: InputDecoration(
                focusColor: Colors.grey.withOpacity(0.4),
                hoverColor: Colors.grey.withOpacity(0.4),
                fillColor: Colors.grey.withOpacity(0.4),
                hintText: 'Enter Your Task Title',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),

          const SizedBox(
            height: 10,
          ),
          //Note
          const TaskInputTextName(txt: 'Note'),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _noteController,
            onChanged: (value) {
              ref
                  .read(createTaskProvider.notifier)
                  .onSearchChanged(value, "note");
            },
            decoration: InputDecoration(
                focusColor: Colors.grey.withOpacity(0.4),
                hoverColor: Colors.grey.withOpacity(0.4),
                fillColor: Colors.grey.withOpacity(0.4),
                hintText: 'Write you note',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          const TaskInputTextName(txt: 'Date'),
          const SizedBox(
            height: 5,
          ),

          TextField(
            controller: _datacontroller,
            showCursor: false,
            onTap: () {
              getDateFormate(context);
            },
            onChanged: (value) {},
            decoration: InputDecoration(
                focusColor: Colors.grey.withOpacity(0.4),
                hoverColor: Colors.grey.withOpacity(0.4),
                fillColor: Colors.grey.withOpacity(0.4),
                suffixIcon: const Icon(Icons.calendar_month),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          //data
          //date
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TaskInputTextName(txt: 'Start Time'),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: CustomDataPicker(
                          onChanged: (val) {
                            // ignore: invalid_use_of_protected_member
                            ref.read(createTaskProvider.notifier).state = ref
                                .read(createTaskProvider.notifier)
                                // ignore: invalid_use_of_protected_member
                                .state
                                .copyWith(starttime: val.toString());
                          },
                          startController: _startTimecontroller),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TaskInputTextName(txt: 'End Time'),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: CustomDataPicker(
                        startController: _endtimecontroller,
                        onChanged: (value) {
                          // ignore: invalid_use_of_protected_member
                          ref.read(createTaskProvider.notifier).state = ref
                              .read(createTaskProvider.notifier)
                              // ignore: invalid_use_of_protected_member
                              .state
                              .copyWith(endtime: value);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //color
          const SizedBox(
            height: 10,
          ),
          const TaskInputTextName(txt: 'Color'),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                    3,
                    (index) => GestureDetector(
                          onTap: () {
                            // ignore: invalid_use_of_protected_member
                            ref.read(createTaskProvider.notifier).state = ref
                                .read(createTaskProvider.notifier)
                                // ignore: invalid_use_of_protected_member
                                .state
                                .copyWith(colorindex: index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: color_list[index],
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.only(right: 5),
                            height: 20,
                            width: 20,
                            child: addTask.colorindex == index
                                ? const Center(
                                    child: Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 20,
                                  ))
                                : const Text(""),
                          ),
                        )),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(createTaskProvider.notifier).createUserTask();
                  _titleController.text = "";
                  _noteController.text = "";
                  _datacontroller.text = "";
                  _startTimecontroller.text = "";
                  _endtimecontroller.text = "";
                },
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'Create Task',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  getDateFormate(context) async {
    DateTime? pikcerTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    _datacontroller.text = pikcerTime.toString().split(" ")[0];

    // ignore: invalid_use_of_protected_member
    ref.read(createTaskProvider.notifier).state = ref
        .read(createTaskProvider.notifier)
        // ignore: invalid_use_of_protected_member
        .state
        .copyWith(date: _datacontroller.text);
  }
}
