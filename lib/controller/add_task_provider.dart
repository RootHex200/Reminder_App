import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_manager/database/database.dart';
import 'package:work_manager/model/task_model.dart';
import 'package:work_manager/util/colors_list.dart';

final createTaskProvider =
    StateNotifierProvider.autoDispose<TaskNotifier, UserInput>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<UserInput> {
  TaskNotifier()
      : super(UserInput(
            title: '',
            desc: '',
            date: '',
            color: '',
            starttime: '',
            colorindex: 0,
            endtime: ''));
  Timer? _debounce;
  onSearchChanged(value, type) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (type == "note") {
        state = state.copyWith(desc: value.toString());

        print(value);
        print(state);
      }
      if (type == 'title') {
        state = state.copyWith(title: value.toString());
        print(value);
      }
    });
  }

  void createUserTask() {
    if (state.checkIfAnyIsNull()) {
      var task = TaskModel(
          colors: "${color_list[state.colorindex]}",
          date: state.date,
          endTime: state.endtime,
          description: state.desc,
          title: state.title,
          startTime: state.starttime);
      try {
        Isolate.spawn(createTask, task);
      } catch (e) {
        print("E$e");
      }
    } else {
      debugPrint("Any object is emtpy");
    }
  }
}

class UserInput {
  final String title;
  final String desc;
  final String date;
  final String color;
  final String starttime;
  final String endtime;
  final int colorindex;
  UserInput({
    required this.title,
    required this.desc,
    required this.date,
    required this.color,
    required this.starttime,
    required this.endtime,
    required this.colorindex,
  });

  UserInput copyWith({
    String? title,
    String? desc,
    String? date,
    String? color,
    String? starttime,
    String? endtime,
    int? colorindex,
  }) {
    return UserInput(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      color: color ?? this.color,
      starttime: starttime ?? this.starttime,
      endtime: endtime ?? this.endtime,
      colorindex: colorindex ?? this.colorindex,
    );
  }

  bool checkIfAnyIsNull() {
    var item = [title, desc, date, starttime, endtime, colorindex];
    for (int i = 0; i < item.length; i++) {
      // ignore: prefer_is_empty
      if (item[i].toString().length == 0) {
        return false;
      }
    }
    return true;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'desc': desc});
    result.addAll({'date': date});
    result.addAll({'color': color});
    result.addAll({'starttime': starttime});
    result.addAll({'endtime': endtime});
    result.addAll({'colorindex': colorindex});

    return result;
  }

  factory UserInput.fromMap(Map<String, dynamic> map) {
    return UserInput(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      date: map['date'] ?? '',
      color: map['color'] ?? '',
      starttime: map['starttime'] ?? '',
      endtime: map['endtime'] ?? '',
      colorindex: map['colorindex']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInput.fromJson(String source) =>
      UserInput.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserInput(title: $title, desc: $desc, date: $date, color: $color, starttime: $starttime, endtime: $endtime, colorindex: $colorindex)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInput &&
        other.title == title &&
        other.desc == desc &&
        other.date == date &&
        other.color == color &&
        other.starttime == starttime &&
        other.endtime == endtime &&
        other.colorindex == colorindex;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        desc.hashCode ^
        date.hashCode ^
        color.hashCode ^
        starttime.hashCode ^
        endtime.hashCode ^
        colorindex.hashCode;
  }
}
