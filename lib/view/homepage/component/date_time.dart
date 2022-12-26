import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_manager/controller/date_controller.dart';

class DateTimeView extends ConsumerWidget {
  const DateTimeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DatePicker(
      
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.black,
      selectedTextColor: Colors.white,
      height: 90,
      onDateChange: (date) {
        var result = date.toString().split(" ")[0];
        // ignore: deprecated_member_use
        ref.read(dateControllerProvider.state).state = result;
      },
    );
  }
}
